class SessionsController < ApplicationController

  def google_auth
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      session[:user_id] = @user.id
      flash[:notice] = 'Successfully signed in with Google'
      redirect_to root_path
    else
      session["google_data"] = request.env["omniauth.auth"].except(:extra)
      flash[:alert] = @user.errors.full_messages.join("\n")
      redirect_to signup_path
    end
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: I18n.translate(".logged_in")
    else
      flash.now.alert = I18n.translate(".invalid")
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: I18n.translate('.logged_out')
  end

  protected

  def auth_info
    request.env['omniauth.auth'].info
  end
end
