class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(personal_message)
    message = render_message(personal_message)

    ActionCable.server.broadcast "notifications_#{personal_message.user.id}_channel",
                                 message: message,
                                 conversation_id: personal_message.conversation.id

    if personal_message.receiver.online?
      ActionCable.server.broadcast "notifications_#{personal_message.receiver.id}_channel",
                                   notification: render_notification(personal_message),
                                   message: message,
                                   conversation_id: personal_message.conversation.id
    end
  end

  private

  def render_notification(message)
    NotificationsController.render partial: 'notifications/notification', locals: {message: message}
  end

  def render_message(message)
    PersonalMessagesController.render partial: 'personal_messages/personal_message',
                                      locals: {personal_message: message}
  end
end
