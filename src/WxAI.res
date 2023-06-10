type wx = WxCommon.wx

@send
external getInferenceEnvInfo: (
  wx,
  {
    "success": {"ver": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<{..} => unit>,
  },
) => unit = "getInferenceEnvInfo"

module Tensor = {
  type t
  type tensors = Js.Dict.t<t>

  @get external getShape: t => array<int> = "shape"
  @get external getData: t => Js.TypedArray2.ArrayBuffer.t = "data"
  @get external getType: t => string = "type"
}

module InferenceSession = {
  type t

  @send
  external createInferenceSession: (
    wx,
    {
      "model": string,
      "precisionLevel": option<int>,
      "allowQuantize": option<bool>,
      "allowNPU": option<bool>,
      "typicalShape": {..},
    },
  ) => t = "createInferenceSession"

  @send
  external destroy: t => unit = "destroy"

  @send
  external run: (t, Tensor.tensors) => promise<Tensor.tensors> = "run"

  @send
  external onLoad: (t, {..} => unit) => unit = "onLoad"

  @send
  external offLoad: (t, {..} => unit) => unit = "offLoad"

  @send external onError: (t, {..} => unit) => unit = "onError"
  @send external offError: (t, {..} => unit) => unit = "offError"
}

@send
external isVKSupport: (wx, [#v1 | #v2]) => bool = "isVKSupport"

module VKSession = {
  type t

  @send
  external createVKSession: (
    wx,
    {
      "version": option<[#v1 | #v2]>,
      "track": {
        "plane": {"mode": [#1 | #2 | #3]},
        "marker": option<bool>,
        "OSD": option<bool>,
        "face": option<{
          "mode": [#1 | #2],
        }>,
        "OCR": option<{
          "mode": [#1 | #2],
        }>,
        "body": option<{
          "mode": [#1 | #2],
        }>,
        "hand": option<{
          "mode": [#1 | #2],
        }>,
        "threeDof": option<bool>,
      },
    },
  ) => t = "createVKSession"
}

module VKBodyAnchor = {
  type t
}

module VKCamera = {
  type t
}

module VKFaceAnchor = {
  type t
}

module VKFrame = {
  type t
}

module VKHandAnchor = {
  type t
}

module VKMarkerAnchor = {
  type t
}

module VKOCRAnchor = {
  type t
}

module VKOSDAnchor = {
  type t
}

module VKPlaneAnchor ={
  type t
}


@send
external stopFaceDetect: (wx, {..} => unit) => unit = "stopFaceDetect"
@send external initFaceDetect: (wx, {..} => unit) => unit = "initFaceDetect"
@send external faceDetect: (wx, {..} => unit) => unit = "faceDetect"