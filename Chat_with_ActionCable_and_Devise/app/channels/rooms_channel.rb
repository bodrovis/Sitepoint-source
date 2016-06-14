# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "rooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data) # this is the main method
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id']) if ChatRoom.exists?(id: data['chat_room_id'])
  end
end
