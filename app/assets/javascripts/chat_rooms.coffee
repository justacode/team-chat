# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', 'button#new-msg-btn', () ->
  $('#new-msg-form').slideToggle()
  return false

$(document).on 'click', 'button.edit-msg-btn', (event) ->
  message = $(event.target).closest('.msg')
  message.find('.msg-content').toggle()
  message.find('.edit-msg-form').toggle()
  return false
