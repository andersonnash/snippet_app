class FeedController < ApplicationController
  def index
    @snippets = Snippet.all
  end
end