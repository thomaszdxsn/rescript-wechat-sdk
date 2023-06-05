type wx = WxCommon.wx

@send
external canvasToTempFilePath: (
  wx,
  {
    "x": option<int>,
    "y": option<int>,
    "width": option<int>,
    "height": option<int>,
    "destWidth": option<int>,
    "destHeight": option<int>,
    "canvasId": option<string>,
    "canvas": {..},
    "fileType": option<string>,
    "quality": option<int>,
  },
) => promise<string> = "canvasToTempFilePath"

@send
external canvasPutImageData: (
  wx,
  {
    "canvasId": string,
    "data": Js.Typed_array.Uint8ClampedArray.t,
    "x": int,
    "y": int,
    "width": int,
    "height": int,
  },
) => promise<unit> = "canvasPutImageData"

@send
external canvasGetImageData: (
  wx,
  {"canvasId": string, "x": int, "y": int, "width": int, "height": int},
) => promise<{
  "data": Js.Typed_array.Uint8ClampedArray.t,
  "width": int,
  "height": int,
}> = "canvasGetImageData"

module RenderingContext = {
  type t

  @send
  external createCanvasContext: (wx, string) => t = "createCanvasContext"

  @send
  external arc: (t, float, float, float, float, float, bool) => unit = "arc"

  @send
  external arcTo: (t, float, float, float, float, float) => unit = "arcTo"

  @send
  external beginPath: t => unit = "beginPath"

  @send
  external bezierCurveTo: (t, float, float, float, float, float, float) => unit = "bezierCurveTo"

  @send
  external clearRect: (t, float, float, float, float) => unit = "clearRect"

  @send
  external clip: t => unit = "clip"

  @send external closePath: t => unit = "closePath"

  @send external createCircularGradient: (t, float, float, float) => unit = "createCircularGradient"

  @send
  external createLinearGradient: (t, float, float, float, float) => unit = "createLinearGradient"

  @send external createPattrn: (t, string, string) => unit = "createPattrn"

  @send external draw: (t, bool, unit => unit) => unit = "draw"

  @send
  external drawImage: (t, string, float, float, float, float, float, float, float, float) => unit =
    "drawImage"

  @send external fill: t => unit = "fill"

  @send external filLRect: (t, float, float, float, float) => unit = "fillRect"

  @send external fillText: (t, string, float, float, float) => unit = "fillText"

  @send external lienTo: (t, float, float) => unit = "lienTo"

  @send external measureText: (t, string) => unit = "measureText"

  @send external moveTo: (t, float, float) => unit = "moveTo"

  @send external quadraticCurveTo: (t, float, float, float, float) => unit = "quadraticCurveTo"

  @send external rect: (t, float, float, float, float) => unit = "rect"

  @send external restore: t => unit = "restore"

  @send external rotate: (t, float) => unit = "rotate"

  @send external save: t => unit = "save"

  @send external scale: (t, float, float) => unit = "scale"

  @send external setFillStyle: (t, string) => unit = "setFillStyle"

  @send external setFontSize: (t, float) => unit = "setFontSize"

  @send external setGlobalAlpha: (t, float) => unit = "setGlobalAlpha"

  @send external setLineCap: (t, [#butt | #round | #square]) => unit = "setLineCap"

  @send external setLineDash: (t, array<float>, float) => unit = "setLineDash"

  @send external setLineJoin: (t, [#bevel | #round | #miter]) => unit = "setLineJoin"

  @send external setLineWidth: (t, float) => unit = "setLineWidth"

  @send external setMiterLimit: (t, float) => unit = "setMiterLimit"

  @send external setShadow: (t, float, float, float, string) => unit = "setShadow"

  @send external setStrokeStyle: (t, string) => unit = "setStrokeStyle"

  @send external setTextgAlign: (t, [#left | #center | #right]) => unit = "setTextgAlign"

  @send
  external setTextBaseline: (t, [#top | #bottom | #middle | #normal]) => unit = "setTextBaseline"

  @send
  external setTransform: (t, float, float, float, float, float, float) => unit = "setTransform"

  @send external stroke: t => unit = "stroke"

  @send external strokeRect: (t, float, float, float, float) => unit = "strokeRect"

  @send external strokeText: (t, string, float, float, float) => unit = "strokeText"

  @send external transform: (t, float, float, float, float, float, float) => unit = "transform"

  @send external translate: (t, float, float) => unit = "translate"
}

module Image = {
  type t = {
    src: string,
    width: int,
    height: int,
    referrerPolicy: string,
  }

  @set
  external setSrc: (t, string) => unit = "src"

  @set
  external setWidth: (t, int) => unit = "width"

  @set
  external setHeight: (t, int) => unit = "height"

  @set
  external setReferrerPolicy: (t, string) => unit = "referrerPolicy"

  @set
  external setOnLoad: (t, unit => unit) => unit = "onload"

  @set
  external setOnError: (t, unit => unit) => unit = "onerror"
}

module ImageData = {
  type t = {
    data: Js.Typed_array.Uint8ClampedArray.t,
    width: int,
    height: int,
  }

  @set external setData: (t, Js.Typed_array.Uint8ClampedArray.t) => unit = "data"
  @set external setWidth: (t, int) => unit = "width"
  @set external setHeight: (t, int) => unit = "height"
}

module Path2D = {
  type t
}

module Canvas = {
  type t

  @get
  external getWidth: t => int = "width"
  @get
  external getHeight: t => int = "height"

  @send
  external cancelAnimationFrame: (t, int) => unit = "cancelAnimationFrame"

  @send
  external createImage: t => Image.t = "createImage"

  @send external createImageData: t => ImageData.t = "createImageData"

  @send external createPath2D: t => Path2D.t = "createPath2D"

  @send external getContext: (t, string) => RenderingContext.t = "getContext"

  @send external requestAnimationFrame: (t, unit => unit) => int = "requestAnimationFrame"

  @send external toDataURL: (t, string, float) => string = "toDataURL"
}

module OffScreenCanvas = {
  type t

  type createOffscreenCanvasOption = {
    width?: int,
    height?: int,
    @as("type") type_?: string,
    compInst?: string,
  }

  @send
  external createOffscreenCanvas: (wx, createOffscreenCanvasOption) => t = "createOffscreenCanvas"

  @send external getContext: (t, string) => RenderingContext.t = "getContext"

  @send external createImage: t => Image.t = "createImage"
}
