# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#new-msg-btn").click ->
    $("#new-msg-form").slideToggle()
    return false

  $(document).on 'click', 'button.edit-msg-btn', (event) ->
    msg_id = event.target.id
    $("#content-#{msg_id}").toggle()
    $("##{msg_id}.edit-msg-form").toggle()
    return false
