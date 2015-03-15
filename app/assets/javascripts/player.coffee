class Player

  currentTrackManagerId: null

  play: (trackId) =>
    SC.stream '/tracks/' + trackId, {
      onfinish: ->
        next()
      onsuspend: ->
        next()
      ondataerror: ->
        alert 'error'
    }, (sound) =>
      sound.play()
      @currentTrackManagerId = sound.sID

  stop: () ->
    soundManager.pause(@currentTrackManagerId)

  next: () ->
    window.location.reload();

window.player = new Player
