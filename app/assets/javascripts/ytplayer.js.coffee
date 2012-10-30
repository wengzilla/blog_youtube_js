root = exports ? this

class YouTubePlayer
  currentVideo = ""

  constructor: (options, readyCallback) ->
    params = "allowScriptAccess": "always"
    atts = "id": options["player_id"]
    swfobject.embedSWF "http://www.youtube.com/apiplayer?" + "version=3&enablejsapi=1", options["container_element"], "480", "295", "9", null, null, params, atts

  nextVideo: ->
    $("#ytPlayer")[0].loadVideoById("9bZkp7q19f0")

player_id = "ytPlayer"
yt_player = new YouTubePlayer({"player_id": player_id, "container_element": "videoDiv"})

root.stateChanged = (state) =>
  if state == 0
    yt_player.nextVideo()

root.onYouTubePlayerReady = (event) =>
  $("#ytPlayer")[0].addEventListener("onStateChange", "stateChanged")
  $("#ytPlayer")[0].loadVideoById("9bZkp7q19f0")