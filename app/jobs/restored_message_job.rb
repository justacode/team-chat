class RestoredMessageJob < ApplicationJob
  queue_as :default

  def perform(id)
    message = Message.find(id)
    message.restore
    ActionCable.server.broadcast 'chat_room_channel', restored_message: message
  end
end