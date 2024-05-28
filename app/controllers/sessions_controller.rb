class SessionsController < ApplicationController
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
end
