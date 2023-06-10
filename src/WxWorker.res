type wx = WxCommon.wx

type t

type createOptions = {useExperimentalWorker?: bool}

@send external createWorker: (wx, string, createOptions) => t = "createWorker"

@send external getCameraFrameData: t => Js.TypedArray2.ArrayBuffer.t = "getCameraFrameData"

@send external onMessage: (t, {"message": {..}} => unit) => unit = "onMessage"
@send external onProcessKilled: (t, unit => unit) => unit = "onProcessKilled"
@send external postMessage: (t, {..}) => unit = "postMessage"
@send external terminate: t => unit = "terminate"
@send external testOnProcessKilled: (t, unit => unit) => unit = "testOnProcessKilled"