class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data, user)
    message = user.messages.create! content: data
    ActionCable.server.broadcast 'chat_room_channel', message: render_message(message)
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
end
