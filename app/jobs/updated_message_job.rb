class UpdatedMessageJob < ApplicationJob
  queue_as :default

  def perform(data, id)
    message = Message.find(id)
    message.update(content: data)
    ActionCable.server.broadcast 'chat_room_channel', updated_message: message
  end
end
