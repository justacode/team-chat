App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behaviour~=chat_room_speaker]', (event) ->
  if event.keyCode is 13
    App.chat_room.speak event.target.value
    event.target.value = ''
    event.preventDefault()