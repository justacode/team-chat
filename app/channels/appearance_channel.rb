class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    current_user.online
  end
 
  def unsubscribed
    current_user.offline
  end
end