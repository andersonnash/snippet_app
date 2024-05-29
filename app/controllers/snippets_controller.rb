class SnippetsController < ApplicationController
  before_action :authorize, only: [:edit, :update]

  def new
    @snippet = Snippet.new
  end

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)
    if @snippet.save
      redirect_to @snippet, notice: 'Snippet was successfully created.'
    else
      render 'new'
    end
  end
  private

  def snippet_params
    params.require(:snippet).permit(:title, :description, :code_block)
  end
end
