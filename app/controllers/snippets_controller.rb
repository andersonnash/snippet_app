class SnippetsController < ApplicationController
  before_action :authorize, only: [:edit, :update]
  
  def new
    @snippet = Snippet.new
  end

  def index
    @snippet = Snippet.all
  end
end