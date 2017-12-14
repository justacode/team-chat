App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    if data['message']
      @addNewMessage(data['message'], data['user_id'])
    if data['updated_message']
      @addUpdatedMessage(data['updated_message'])

  speak: (message) ->
    @perform 'speak', message: message

  update: (message, message_id) ->
    @perform 'edit', updated_message: message, message_id: message_id

  addNewMessage: (message, user_id) ->
    current_user_id = $('#chatroom').data('user-id')
    wrap = $("<div>" + message + "</div>")
    unless user_id == current_user_id
      wrap.find('.edit-msg-btn').remove()
      wrap.find('.message').addClass('partners-message')
    $('.messages').append wrap.html()

  addUpdatedMessage: (updated_message) ->
    message = $("#content-#{updated_message.id}").text(updated_message.content)
    message.toggle() unless message.is(":visible")

$(document).on 'keypress', '[data-behaviour~=chat_room_speaker]', (event) ->
  if event.keyCode is 13
    App.chat_room.speak event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).on 'keypress', '[data-behaviour~=chat_room_editor]', (event) ->
  if event.keyCode is 13
    message_id = $(this).parent().attr("id")
    App.chat_room.update event.target.value, message_id
    $(event.target).parent().toggle()
    event.preventDefault()
