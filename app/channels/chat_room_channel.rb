class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_room_channel'
  end

  def unsubscribed; end

  def speak(data)
    NewMessageJob.perform_later data['message'], current_user
  end

  def edit(data)
    UpdatedMessageJob.perform_later data['updated_message'], data['message_id']
  end
end
