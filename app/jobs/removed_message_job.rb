class RemovedMessageJob < ApplicationJob
  queue_as :default

  def perform(id)
    message = Message.find(id)
    message.archieve
    ActionCable.server.broadcast 'chat_room_channel', removed_message_id: id
  end
end