type wx = WxCommon.wx

module MapContext = {
  type t

  @send
  external createMapContext: (string, {..}) => t = "createMapContext"

  @send
  external addArc: (
    t,
    {
      "id": int,
      "start": {"latitude": float, "longitude": float},
      "end": {"latitude": float, "longitude": float},
      "pass": option<{
        "latitude": float,
        "longitude": float,
      }>,
      "angle": option<float>,
      "width": option<float>,
      "color": option<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addArc"

  @send
  external addCustomLayer: (
    t,
    {
      "layerId": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addCustomLayer"

  @send
  external addGroundOverlay: (
    t,
    {
      "id": int,
      "src": string,
      "bounds": {
        "southwest": {"latitude": float, "longitude": float},
        "northeast": {"latitude": float, "longitude": float},
      },
      "visible": option<bool>,
      "zIndex": option<int>,
      "opacity": option<float>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addGroundOverlay"

  @send
  external addMarkers: (
    t,
    {
      "markers": array<string>,
      "clear": option<bool>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addMarkers"

  @send
  external addVisualLayer: (
    t,
    {
      "layerId": string,
      "interval": option<int>,
      "zIndex": option<int>,
      "opacity": option<float>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addVisualLayer"

  @send
  external eraseLines: (
    t,
    {
      "lines": array<{
        "id": int,
        "index": int,
        "point": option<{
          "latitude": float,
          "longitude": float,
        }>,
        "clear": option<bool>,
      }>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "eraseLines"

  @send
  external executeVisualLayerCommand: (
    t,
    {
      "layerId": string,
      "cmd": string,
      "args": array<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "executeVisualLayerCommand"

  @send
  external fromScreenLocation: (
    t,
    {
      "x": float,
      "y": float,
      "success": option<{"latitude": float, "longitude": float} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "fromScreenLocation"

  @send
  external getCenterLocation: (
    t,
    {
      "iconPath": option<string>,
      "success": option<{"latitude": float, "longitude": float} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getCenterLocation"

  @send
  external getRegion: (
    t,
    {
      "success": option<
        {
          "southwest": {"latitude": float, "longitude": float},
          "northeast": {"latitude": float, "longitude": float},
        } => unit,
      >,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getRegion"

  @send
  external getRotate: (
    t,
    {
      "success": option<float => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getRotate"

  @send
  external getScale: (
    t,
    {
      "success": option<float => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getScale"

  @send
  external getSkew: (
    t,
    {
      "success": option<float => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getSkew"

  @send
  external includePoints: (
    t,
    {
      "points": array<{
        "latitude": float,
        "longitude": float,
      }>,
      "padding": option<array<string>>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "includePoints"

  @send
  external initMarkerCluster: (
    t,
    {
      "enableDefaultStyle": option<bool>,
      "zoomOnClick": option<bool>,
      "gridSize": option<int>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "initMarkerCluster"

  @send
  external moveAlong: (
    t,
    {
      "markerId": int,
      "path": array<{
        "latitude": float,
        "longitude": float,
      }>,
      "duration": int,
      "autoRotate": option<bool>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "moveAlong"

  @send
  external moveToLocation: (
    t,
    {
      "latitude": float,
      "longitude": float,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "moveToLocation"

  @send
  external on: (t, string, {..} => unit) => unit = "on"

  @send
  external openMapApp: (
    t,
    {
      "latitude": float,
      "longitude": float,
      "destination": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "openMapApp"

  @send
  external removeArc: (
    t,
    {
      "id": int,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeArc"

  @send
  external removeCustomLayer: (
    t,
    {
      "layerId": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeCustomLayer"

  @send
  external removeGroundOverlay: (
    t,
    {
      "id": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeGroundOverlay"

  @send
  external removeMarkers: (
    t,
    {
      "markerIds": array<string>,
      "clear": option<bool>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeMarkers"

  @send
  external removeVisualLayer: (
    t,
    {
      "layerId": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeVisualLayer"

  @send
  external setBoundary: (
    t,
    {
      "southwest": {"latitude": float, "longitude": float},
      "northeast": {"latitude": float, "longitude": float},
      "success": unit => unit,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "setBoundary"

  @send
  external setCenterOffset: (
    t,
    {
      "offset": array<int>,
      "success": unit => unit,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "setCenterOffset"

  @send
  external setLocMarkerIcon: (
    t,
    {
      "iconPath": string,
      "success": unit => unit,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "setLocMarkerIcon"

  @send
  external toScreenLocation: (
    t,
    {
      "latitude": float,
      "longitude": float,
      "success": option<{"x": float, "y": float} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "toScreenLocation"

  @send
  external translateMarker: (
    t,
    {
      "markerId": int,
      "destination": {"latitude": float, "longitude": float},
      "autoRotate": option<bool>,
      "rotate": option<float>,
      "duration": option<int>,
      "moveWithRotate": option<bool>,
      "animationEnd": option<unit => unit>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "translateMarker"

  @send
  external uupdateGroundOverlay: (
    t,
    {
      "id": string,
      "src": string,
      "bounds": option<{
        "southwest": {"latitude": float, "longitude": float},
        "northeast": {"latitude": float, "longitude": float},
      }>,
      "visible": option<bool>,
      "zIndex": option<int>,
      "opacity": option<float>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "updateGroundOverlay"
}

// 「媒体 - 图片」
@send
external saveImageToPhotosAlbum: (wx, {"filePath": string}) => promise<{..}> =
  "saveImageToPhotosAlbum"

@send
external previewMedia: (
  wx,
  {
    "current": int,
    "sources": array<{
      "url": string,
      "type": [#image | #video],
      "poster": option<string>,
    }>,
    "shoowmenu": option<bool>,
    "referrerPolicy": option<string>,
  },
) => promise<{..}> = "previewMedia"

@send
external previewImage: (
  wx,
  {
    "current": int,
    "urls": array<string>,
    "showmenu": option<bool>,
    "referrerPolicy": option<string>,
  },
) => promise<{..}> = "previewImage"

@send
external getImageInfo: (
  wx,
  {"src": string},
) => promise<{
  "width": int,
  "height": int,
  "path": string,
  "orientation": string,
  "type": string,
}> = "getImageInfo"

@send
external editImage: (wx, {"src": string}) => promise<{"tempFilePath": string}> = "editImage"

@send
external cropImage: (
  wx,
  {"src": string, "cropScale": [#"16:9" | #"9:16" | #"4:3" | #"3:4" | #"5:4" | #"4:5" | #"1:1"]},
) => promise<{
  "tempFilePath": string,
}> = "cropImage"

@send
external compressImage: (
  wx,
  {
    "src": string,
    "quality": option<int>,
    "compressedWidth": option<int>,
    "compressedHeight": option<int>,
  },
) => promise<{
  "tempFilePath": string,
}> = "compressImage"

@send
external chooseMessageFile: (
  wx,
  {
    "count": int,
    "type": option<[#all | #video | #image | #file]>,
    "extension": option<array<string>>,
  },
) => promise<{
  "tempFiles": array<{
    "path": string,
    "size": int,
    "name": string,
    "type": string,
  }>,
}> = "chooseMessageFile"

@send
external chooseImage: (
  wx,
  {
    "count": option<int>,
    "sourceType": option<[#album | #camera]>,
    "sizeType": option<[#original | #compressed]>,
  },
) => promise<{
  "tempFilePaths": array<string>,
  "tempFiles": array<{
    "path": string,
    "size": int,
  }>,
}> = "chooseImage"

@send
external saveVideoToPhotosAlbum: (wx, {"filePath": string}) => promise<{..}> =
  "saveVideoToPhotosAlbum"

@send
external openVideoEditor: (
  wx,
  {"filePath": string, "minDuration": string, "maxDuration": string},
) => promise<{..}> = "openVideoEditor"

@send
external getVideoInfo: (
  wx,
  {"src": string},
) => promise<{
  "width": int,
  "height": int,
  "duration": int,
  "size": int,
  "bitrate": int,
  "orientation": string,
  "type": string,
  "fps": int,
  "bitrate": int,
}> = "getVideoInfo"

@send
external compressVideo: (
  wx,
  {
    "src": string,
    "quality": option<int>,
    "bitrate": option<int>,
    "fps": option<int>,
    "resolution": option<float>,
  },
) => promise<{
  "tempFilePath": string,
  "size": string,
}> = "compressVideo"

@send
external chooseVideo: (
  wx,
  {
    "sourceType": option<[#album | #camera]>,
    "maxDuration": option<int>,
    "camera": option<[#front | #back]>,
    "compressed": option<bool>,
    "maxDuration": option<int>,
  },
) => promise<{
  "tempFilePath": string,
  "duration": int,
  "size": int,
  "height": int,
  "width": int,
}> = "chooseVideo"

@send
external chooseMedia: (
  wx,
  {
    "count": option<int>,
    "mediaType": option<[#image | #video | #mix]>,
    "sourceType": option<[#album | #camera]>,
    "maxDuration": option<int>,
    "sizeType": option<array<[#original | #compressed]>>,
    "camera": option<[#front | #back]>,
    "compressed": option<bool>,
    "maxDuration": option<int>,
  },
) => promise<{
  "tempFiles": array<{
    "path": string,
    "size": int,
    "name": string,
    "type": string,
  }>,
  "tempFilePaths": array<string>,
}> = "chooseMedia"

module VideoContext = {
  type t

  @send
  external createVideoContext: (wx, {"id": string}) => t = "createVideoContext"

  @send
  external exitBackgroundPlayback: t => unit = "exitBackgroundPlayback"

  @send
  external exitCasting: t => unit = "exitCasting"

  @send external exitFullScreen: t => unit = "exitFullScreen"

  @send
  external exitPictureInPicture: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "exitPictureInPicture"

  @send
  external hideStatusBar: t => unit = "hideStatusBar"

  @send
  external pause: t => unit = "pause"

  @send external play: t => unit = "play"

  @send external playbackRate: (t, float) => unit = "playbackRate"

  @send external reconnectCasting: t => unit = "reconnectCasting"

  @send external requestBackgroundPlayback: t => unit = "requestBackgroundPlayback"

  @send external requestFullscreen: (t, {"direction": option<int>}) => unit = "requestFullscreen"

  @send external seek: (t, int) => unit = "seek"

  @send external sendDanmu: (t, {"text": string, "color": option<string>}) => unit = "sendDanmu"

  @send external showStatusBar: t => unit = "showStatusBar"

  @send external startCasting: t => unit = "startCasting"

  @send external stop: t => unit = "stop"

  @send external switchCasting: t => unit = "switchCasting"
}

// 「媒体 - 音频」

@send
external stopVoice: wx => promise<{"tempFilePath": string}> = "stopVoice"

@send
external setInnerAudioOption: (
  wx,
  {"mixWithOther": option<bool>, "obeyMuteSwitch": option<bool>, "speakerOn": option<bool>},
) => promise<{..}> = "setInnerAudioOption"

@send
external playVoice: (wx, {"filePath": string, "duration": option<int>}) => promise<{..}> =
  "playVoice"

@send
external pauseVoice: wx => promise<{..}> = "pauseVoice"

@send
external getAvailableAudioSources: wx => promise<{"audioSources": array<string>}> =
  "getAvailableAudioSources"

module AudioBuffer = {
  type t

  @send external copyFromChannel: t => unit = "copyFromChannel"

  @send
  external copyToChannel: (t, Js.TypedArray2.Float32Array.t, int, int) => unit = "copyToChannel"

  @send external getChannelData: (t, int) => Js.TypedArray2.Float32Array.t = "getChannelData"
}

module MediaAudioPlayer = {
  type t

  module VideoDecoder = {
    type t
  }

  @send external createMediaAudioPlayer: wx => t = "createMediaAudioPlayer"

  @send external addAudioSource: (t, VideoDecoder.t) => unit = "addAudioSource"

  @send external destroy: t => unit = "destroy"

  @send external removeAudioSource: (t, VideoDecoder.t) => unit = "removeAudioSource"

  @send external start: t => unit = "start"

  @send external stop: t => unit = "stop"
}

module InnerAudioContext = {
  type t

  @send external createInnerAudioContext: wx => t = "createInnerAudioContext"

  @send external destroy: t => unit = "destroy"

  @send external offCanplay: (t, {..} => unit) => unit = "offCanplay"
  @send external onCanplay: (t, {..} => unit) => unit = "onCanplay"

  @send external offEnded: (t, {..} => unit) => unit = "offEnded"
  @send external onEnded: (t, {..} => unit) => unit = "onEnded"

  @send external offError: (t, {..} => unit) => unit = "offError"
  @send external onError: (t, {..} => unit) => unit = "onError"

  @send external onPause: (t, {..} => unit) => unit = "onPause"
  @send external offPause: (t, {..} => unit) => unit = "offPause"

  @send external onPlay: (t, {..} => unit) => unit = "onPlay"
  @send external offPlay: (t, {..} => unit) => unit = "offPlay"

  @send external onSeeked: (t, {..} => unit) => unit = "onSeeked"
  @send external offSeeked: (t, {..} => unit) => unit = "offSeeked"

  @send external onSeeking: (t, {..} => unit) => unit = "onSeeking"
  @send external offSeeking: (t, {..} => unit) => unit = "offSeeking"

  @send external onStop: (t, {..} => unit) => unit = "onStop"
  @send external offStop: (t, {..} => unit) => unit = "offStop"

  @send external onTimeUpdate: (t, {..} => unit) => unit = "onTimeUpdate"
  @send external offTimeUpdate: (t, {..} => unit) => unit = "offTimeUpdate"

  @send external onWaiting: (t, {..} => unit) => unit = "onWaiting"
  @send external offWaiting: (t, {..} => unit) => unit = "offWaiting"

  @send external pause: t => unit = "pause"
  @send external play: t => unit = "play"
  @send external seek: (t, int) => unit = "seek"
  @send external stop: t => unit = "stop"
}

module AudiContext = {
  type t

  @send external createAudioContext: (wx, string) => t = "createAudioContext"

  @send external pause: t => unit = "pause"

  @send external play: t => unit = "play"

  @send external seek: (t, int) => unit = "seek"

  @send external setSrc: (t, string) => unit = "setSrc"
}

module WebAudioContext = {
  type t

  module AnalyserNode = {
    type t
  }

  module BiquadFilterNode = {
    type t
  }

  module AudioBuffer = {
    type t
  }

  module BufferSourceNode = {
    type t
  }

  module ChannelMergerNode = {
    type t
  }

  module ChannelSplitterNode = {
    type t
  }

  module ConstantSourceNode = {
    type t
  }

  module DelayNode = {
    type t
  }

  module DynamicsCompressorNode = {
    type t
  }

  module GainNode = {
    type t
  }

  module IIRFilter = {
    type t
  }

  module OscillatorNode = {
    type t
  }

  module PannerNode = {
    type t
  }

  module PeriodicWaveNode = {
    type t
  }

  module ScriptProcessorNode = {
    type t
  }

  module WaveShaperNode = {
    type t
  }

  @send
  external createWebAudioContext: wx => t = "createWebAudioContext"

  @send external close: t => promise<unit> = "close"

  @send external createAnalyser: t => AnalyserNode.t = "createAnalyser"

  @send external createBiquadFilter: t => BiquadFilterNode.t = "createBiquadFilter"

  @send external createBuffer: (t, int, int, float) => AudioBuffer.t = "createBuffer"

  @send external createBufferSource: t => BufferSourceNode.t = "createBufferSource"

  @send external createChannelMerger: (t, int) => ChannelMergerNode.t = "createChannelMerger"

  @send external createChannelSplitter: (t, int) => ChannelSplitterNode.t = "createChannelSplitter"

  @send external createConstantSource: t => ConstantSourceNode.t = "createConstantSource"

  @send external createDelay: (t, float) => DelayNode.t = "createDelay"

  @send external createDynamicCompressor: t => DynamicsCompressorNode.t = "createDynamicCompressor"

  @send external createGain: t => GainNode.t = "createGain"

  @send external createIIRFilter: (t, array<float>, array<float>) => IIRFilter.t = "createIIRFilter"

  @send external createOscillator: t => OscillatorNode.t = "createOscillator"

  @send external createPanner: t => PannerNode.t = "createPanner"

  @send
  external createPeriodicWave: (
    t,
    array<float>,
    array<float>,
    {"disableNormalization": option<bool>},
  ) => PeriodicWaveNode.t = "createPeriodicWave"

  @send
  external createScriptProcessor: (t, int, int, int) => ScriptProcessorNode.t =
    "createScriptProcessor"

  @send external createWaveShaper: t => WaveShaperNode.t = "createWaveShaper"

  @send external decodeAudioData: t => promise<AudioBuffer.t> = "decodeAudioData"

  @send external resume: t => promise<unit> = "resume"

  @send external suspend: t => promise<unit> = "suspend"
}

module WebAudioContextNode = {
  type t
}

// 「媒体 - 背景音乐」

@send external stopBackgroundAudio: wx => promise<{..}> = "stopBackgroundAudio"

@send external seekBackgroundAudio: (wx, {"position": int}) => promise<{..}> = "seekBackgroundAudio"

@send
external playBackgroundAudio: (
  wx,
  {"dataUrl": string, "title": option<string>, "coverImgUrl": option<string>},
) => promise<{..}> = "playBackgroundAudio"

@send external pauseBackgroundAudio: wx => promise<{..}> = "pauseBackgroundAudio"

@send external onBackgroundAudioStop: (wx, {..} => unit) => unit = "onBackgroundAudioStop"
@send external onBackgroundAudioPlay: (wx, {..} => unit) => unit = "onBackgroundAudioPlay"
@send external onBackgroundAudioPause: (wx, {..} => unit) => unit = "onBackgroundAudioPause"

@send
external getBackgroundAudioPlayerState: wx => promise<{
  "duration": int,
  "currentPosition": int,
  "status": int,
  "downloadPercent": float,
  "dataUrl": string,
}> = "getBackgroundAudioPlayerState"

module BackgroundAudioManager = {
  type t

  @send external getBackgroundAudioManager: wx => t = "getBackgroundAudioManager"

  @send external offCanplay: (t, {..} => unit) => unit = "offCanplay"
  @send external onCanplay: (t, {..} => unit) => unit = "onCanplay"

  @send external offEnded: (t, {..} => unit) => unit = "offEnded"
  @send external onEnded: (t, {..} => unit) => unit = "onEnded"

  @send external offError: (t, {..} => unit) => unit = "offError"
  @send external onError: (t, {..} => unit) => unit = "onError"

  @send external onPause: (t, {..} => unit) => unit = "onPause"
  @send external offPause: (t, {..} => unit) => unit = "offPause"

  @send external onPlay: (t, {..} => unit) => unit = "onPlay"
  @send external offPlay: (t, {..} => unit) => unit = "offPlay"

  @send external onSeeked: (t, {..} => unit) => unit = "onSeeked"
  @send external offSeeked: (t, {..} => unit) => unit = "offSeeked"

  @send external onSeeking: (t, {..} => unit) => unit = "onSeeking"
  @send external offSeeking: (t, {..} => unit) => unit = "offSeeking"

  @send external onStop: (t, {..} => unit) => unit = "onStop"
  @send external offStop: (t, {..} => unit) => unit = "offStop"

  @send external onTimeUpdate: (t, {..} => unit) => unit = "onTimeUpdate"
  @send external offTimeUpdate: (t, {..} => unit) => unit = "offTimeUpdate"

  @send external onWaiting: (t, {..} => unit) => unit = "onWaiting"
  @send external offWaiting: (t, {..} => unit) => unit = "offWaiting"

  @send external pause: t => unit = "pause"
  @send external play: t => unit = "play"
  @send external seek: (t, int) => unit = "seek"
  @send external stop: t => unit = "stop"
}

// 「媒体 - 实时音视频」

module LivePlayerContext = {
  type t

  @send external createLivePlayerContext: (wx, string) => t = "createLivePlayerContext"

  @send
  external exitCasting: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "exitCasting"

  @send
  external exitFullScreen: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "exitFullScreen"

  @send
  external exitPictureInPicture: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "exitPictureInPicture"

  @send
  external mute: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "mute"

  @send
  external pause: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "pause"

  @send
  external play: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "play"

  @send
  external reconnectCasting: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "reconnectCasting"

  @send
  external requestFullScreen: (
    t,
    {
      "direction": option<int>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "requestFullScreen"

  @send
  external requestPictureInPicture: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "requestPictureInPicture"

  @send
  external resume: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "resume"

  @send
  external snapshot: (
    t,
    {
      "quality": option<string>,
      "sourceType": option<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "snapshot"

  @send
  external startCasting: (
    t,
    {
      "appParameter": option<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "startCasting"

  @send
  external stop: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "stop"

  @send
  external switchCasting: (
    t,
    {
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "switchCasting"
}

module LivePusherContext = {
  type t

  @send external createLivePusherContext: wx => t = "createLivePusherContext"

  @send
  external applyBlusherStickMakeup: (
    t,
    {
      "alpha": float,
      "path": string,
      "blendMode": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "applyBlusherStickMakeup"

  @send
  external applyEyeBrowMakeup: (
    t,
    {
      "alpha": float,
      "blendMode": string,
      "shrinkRate": float,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "applyEyeBrowMakeup"

  @send
  external applyEyeShadowMakeup: (
    t,
    {
      "alpha": float,
      "path": string,
      "blendMode": string,
      "shimmerPosition": option<string>,
      "shimmerPositionMD5": option<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "applyEyeShadowMakeup"

  // TODO.. 暂时不加入其它的 APIs
}

// 「媒体 - 录音」

@send external stopRecord: wx => promise<{..}> = "stopRecord"
@send external startRecord: wx => promise<{..}> = "startRecord"

module RecorderManager = {
  type t

  @send external getRecorderManager: wx => t = "getRecorderManager"

  @send external onError: (t, {..} => unit) => unit = "onError"

  @send external onFrameRecorded: (t, {..} => unit) => unit = "onFrameRecorded"

  @send external onInterruptionBegin: (t, {..} => unit) => unit = "onInterruptionBegin"

  @send external onInterruptionEnd: (t, {..} => unit) => unit = "onInterruptionEnd"

  @send external onPause: (t, {..} => unit) => unit = "onPause"

  @send external onResume: (t, {..} => unit) => unit = "onResume"

  @send external onStart: (t, {..} => unit) => unit = "onStart"

  @send external onStop: (t, {..} => unit) => unit = "onStop"

  @send external pause: t => unit = "pause"
  @send external resume: t => unit = "resume"
  @send
  external start: (
    t,
    {
      "duration": option<int>,
      "sampleRate": option<int>,
      "numberOfChannels": option<int>,
      "encodeBitRate": option<int>,
      "format": option<string>,
      "frameSize": option<int>,
      "audioSource": option<string>,
    },
  ) => unit = "start"
  @send external stop: t => unit = "stop"
}

module CameraContext = {
  type t

  @send
  external createCameraContext: wx => t = "createCameraContext"

  @send
  external onCameraFrame: (
    t,
    {"width": int, "height": int, "data": Js.TypedArray2.Uint8ClampedArray.t} => unit,
  ) => unit = "onCameraFrame"

  @send
  external setZoom: (t, {"zoom": float}) => promise<{"zoom": float}> = "setZoom"

  @send
  external startRecord: (
    t,
    {
      "timeoutCallback": option<unit => unit>,
      "timeout": option<int>,
      "selfieMirror": option<bool>,
      "success": option<{..} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "startRecord"

  @send
  external stopRecord: (
    t,
    {
      "compressed": option<bool>,
      "success": option<{..} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "stopRecord"

  @send
  external takePhoto: (
    t,
    {
      "quality": option<string>,
      "selfieMirror": option<bool>,
      "success": option<{..} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "takePhoto"
}

module CameraFrameListener = {
  type t

  @send
  external start: (t, {..}) => unit = "start"

  @send external stop: (t, {..}) => unit = "stop"
}

module EditorContext = {
  type t
  type callbacks<'a> = {
    "success": option<'a => unit>,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  }

  @send external blur: (t, callbacks<'a>) => unit = "blur"

  @send external clear: (t, callbacks<'a>) => unit = "clear"

  @send external format: (t, string, string) => unit = "format"

  @send external getContents: (t, callbacks<'a>) => unit = "getContents"

  @send external getSelectionText: (t, callbacks<'a>) => unit = "getSelectionText"

  @send external insertDivider: (t, callbacks<'a>) => unit = "insertDivider"

  @send
  external insertImage: (
    t,
    {
      "src": string,
      "nowrap": option<bool>,
      "alt": option<string>,
      "width": option<string>,
      "height": option<string>,
      "extClass": option<string>,
      "data": {..},
      ...callbacks<'a>,
    },
  ) => unit = "insertImage"

  @send
  external insertText: (t, {"text": option<string>, ...callbacks<'a>}) => unit = "insertText"

  @send external redo: (t, callbacks<'a>) => unit = "redo"
  @send external undo: (t, callbacks<'a>) => unit = "undo"
  @send external removeFormat: (t, callbacks<'a>) => unit = "removeFormat"
  @send
  external setContents: (t, {"html": option<string>, "delta": {..}, ...callbacks<'a>}) => unit =
    "setContents"
  @send external scrollIntoView: t => unit = "scrollIntoView"
}

module MediaContainer = {
  type t

  module MediaTrack = {
    type t
  }

  @send external createMediaContainer: wx => t = "createMediaContainer"

  @send external addTrack: (t, MediaTrack.t) => unit = "addTrack"

  @send external destroy: t => unit = "destroy"

  @send external export: t => unit = "export"

  @send external extractDataSource: (t, {"source": string}) => unit = "extractDataSource"

  @send external removeTrack: (t, MediaTrack.t) => unit = "removeTrack"
}

// 「媒体 - 实时语音」 Todo... 暂时不支持这套 APIs

// 「媒体 - 画面录制器」

module MediaRecorder = {
  type t

  @send
  external createMediaRecorder: (
    wx,
    WxCanvas.OffScreenCanvas.t,
    {
      "duration": option<int>,
      "fps": option<int>,
      "gop": option<int>,
      "videoBitsPerSecond": option<int>,
    },
  ) => t = "createMediaRecorder"

  @send external destroy: t => promise<unit> = "destroy"

  @send external on: (t, string, {..} => unit) => unit = "on"
  @send external off: (t, string, {..} => unit) => unit = "off"

  @send external pause: t => promise<unit> = "pause"
  @send external requestFrame: (t, {..} => unit) => promise<unit> = "requestFrame"
  @send external resume: t => promise<unit> = "resume"
  @send external start: t => promise<unit> = "start"
  @send external stop: t => promise<unit> = "stop"
}

module VideoDecoder = {
  type t

  @send external createVideoDecoder: wx => t = "createVideoDecoder"

  @send
  external getFrameData: t => {
    "width": int,
    "height": int,
    "data": Js.TypedArray2.Uint8ClampedArray.t,
    "pkPts": int,
    "pkDts": int,
  } = "getFrameData"
 @send external on: (t, string, {..} => unit) => unit = "on"
  @send external off: (t, string, {..} => unit) => unit = "off"

  @send external remove: t => promise<unit> = "remove"
  @send external seek: t => promise<unit> = "seek"
  @send external start: (t, {
    "source": string,
    "mode": option<int>,
    "abortAudio": option<bool>,
    "abortVideo": option<bool>
  }) => promise<unit> = "start"
  @send external stop: t => promise<unit> = "stop"
}
