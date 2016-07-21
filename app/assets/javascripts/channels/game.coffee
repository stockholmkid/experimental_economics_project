App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    switch data.action
      when "game_start"
        $('#status').html("Player Found")
        App.gamePlay = new Game('#game-container', data.msg)
