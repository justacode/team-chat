App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $("#members").find("b").text('')
    @updateAppearance(a) for a in data.appearances

  updateAppearance: (appearance) ->
    name = $("p:contains(\"#{appearance}\")")
    name.find('.usr-status').text('(Online)')