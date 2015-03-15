player = {}

player.play = (track_id) ->
  SC.stream '/tracks/' + track_id, (sound) ->
    sound.play()

window.player = player
