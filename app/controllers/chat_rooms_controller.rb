class ChatRoomsController < ApplicationController
  expose_decorated :users, -> { User.all }
  expose_decorated :messages, -> { Message.all.sort_by { |m| m.created_at } }

  def show; end
end
