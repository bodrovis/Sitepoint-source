jQuery ->
  if $('#new_message').size() > 0
    App.global_chat = App.cable.subscriptions.create "RoomsChannel",
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#messages').prepend data['message']

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id


    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      chat_room_id = $this.find('#chat_room_id').val()
      unless $.trim(textarea.val()) is ''
        App.global_chat.send_message textarea.val(), chat_room_id
        textarea.val('')
      e.preventDefault()
      return false