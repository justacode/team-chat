class NewMessageJob < ApplicationJob
  queue_as :default

  def perform(data, user)
    message = user.messages.create! content: data
    ActionCable.server.broadcast 'chat_room_channel',
                                 message: render_message(message.decorate, user),
                                 user_id: user.id
  end

  private

  def render_message(message, user)
    MessagesController.render(partial: 'messages/message',
                              locals: { current_user: user, message: message })
  end
end
