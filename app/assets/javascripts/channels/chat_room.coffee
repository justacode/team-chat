App.chat_room = App.cable.subscriptions.create "ChatRoomChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    if data.message
      @addNewMessage(data.message, data.user_id)
    if data.updated_message
      @addUpdatedMessage(data.updated_message)
    if data.removed_message_id
      @removeMessage(data.removed_message_id)
    if data.restored_message
      @restoreMessage(data.restored_message)

  speak: (message) ->
    @perform 'speak', message: message

  update: (message, message_id) ->
    @perform 'edit', updated: message, message_id: message_id

  remove: (message_id) ->
    @perform 'remove', message_id: message_id

  restore: (message_id) ->
    @perform 'restore', message_id: message_id

  addNewMessage: (message, user_id) ->
    wrap = $("<div>" + message + "</div>")
    unless user_id == @currentUserId()
      wrap.find('.edit-msg-btn').remove()
      wrap.find('.remove-msg-btn').remove()
      wrap.find('.message').addClass('partners-message')
    $('.messages').append wrap.html()

  addUpdatedMessage: (updated) ->
    message = $(".msg##{updated.id}").find('.msg-content')
    message.text(updated.content)
    message.toggle() unless message.is(":visible")

  removeMessage: (removed_id) ->
    message =  $(".msg##{removed_id}")
    content = message.find(".msg-content")
    content.text('message was deleted')
    content.addClass('removed-msg')
    restore_button = $('<button class="btn btn-default btn-sm restore-msg-btn">restore</button>')
    message.append restore_button if message.data('user-id') == @currentUserId()

  restoreMessage: (restored) ->
    message = $(".msg##{restored.id}")
    message.find('.msg-content').text(restored.content)
    message.find('.restore-msg-btn').remove()
    message.find('.buttons').show()
    message.removeClass('removed-msg')

  currentUserId: () ->
    $('#chatroom').data('user-id')

$(document).on 'keypress', '[data-behaviour~=chat_room_speaker]', (event) ->
  if event.keyCode is 13
    App.chat_room.speak event.target.value
    event.target.value = ''
    event.preventDefault()

$(document).on 'keypress', '[data-behaviour~=chat_room_editor]', (event) ->
  if event.keyCode is 13
    message_id = $(this).closest('.msg').attr('id')
    App.chat_room.update event.target.value, message_id
    $(event.target).parent().toggle()
    event.preventDefault()

$(document).on 'click', 'button.remove-msg-btn', (event) ->
  if confirm("Are you sure?")
    message = $(event.target).closest('.msg')
    message_id = message.attr('id')
    message.find(".buttons").toggle()
    App.chat_room.remove message_id
    event.preventDefault()  

$(document).on 'click', 'button.restore-msg-btn', (event) ->
  message_id = $(this).closest('.msg').attr('id')
  App.chat_room.restore message_id
  $(this).closest('.msg').find('.buttons').hide()
  event.preventDefault()  
