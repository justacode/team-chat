class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat_room_channel'
  end

  def unsubscribed; end

  def speak(data)
    NewMessageJob.perform_later data['message'], current_user
  end

  def edit(data)
    UpdatedMessageJob.perform_later data['updated'], data['message_id']
  end

  def remove(data)
    RemovedMessageJob.perform_later data['message_id']
  end

  def restore(data)
    RestoredMessageJob.perform_later data['message_id']
  end
end
