class SnippetsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "snippets"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
end
