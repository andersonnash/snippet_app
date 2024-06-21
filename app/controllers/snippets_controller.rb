class SnippetsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :create, :new, :destroy]
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def new
    @snippet = Snippet.new
  end

  def index
    @snippets = Snippet.all
  end

  def show
  end

  def create
    @snippet = current_user.snippets.new(snippet_params)
    if @snippet.save
      ActionCable.server.broadcast 'snippets', { snippet: render_snippet(@snippet) }
      redirect_to @snippet, notice: 'Snippet was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

 def update
    @snippet = current_user.snippets.find(params[:id])
    if @snippet.update(snippet_params)
      ActionCable.server.broadcast 'snippets', { snippet: render_snippet(@snippet) }
      redirect_to @snippet, notice: 'Snippet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @snippet.destroy
    redirect_to snippets_path, notice: 'Snippet was successfully deleted.'
  end
  
  private

  def render_snippet(snippet)
    ApplicationController.renderer.render(partial: 'snippets/snippet', locals: { snippet: snippet })
  end

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  def snippet_params
    params.require(:snippet).permit(:title, :description, :code_block, :language)
  end


  def check_owner
    unless @snippet.user == current_user
      redirect_to snippets_path, alert: 'You are not authorized to perform this action.'
    end
  end
end