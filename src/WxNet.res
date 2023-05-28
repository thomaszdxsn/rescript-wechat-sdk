type wx = WxCommon.wx

type profile = {
  redirectStart: int,
  redirectEnd: int,
  fetchStart: int,
  domainLookupStart: int,
  domainLookupEnd: int,
  connectStart: int,
  connectEnd: int,
  @as("SSLconnnectionStart") sSLconnectionStart: int,
  @as("SSLConnectionEnd") sSLconnectionEnd: int,
  requestStart: int,
  requestEnd: int,
  rtt: int,
  estimate_nettype: int,
  httpRttEstimate: int,
  transportRttEstimate: int,
  downstreamThroughputKbpsEstimate: float,
  throughputKbps: float,
  peerIP: string,
  port: int,
  socketReused: bool,
  sendBytesCount: int,
  receivedBytesCount: int,
  protocol: string,
}

module RequestTask = {
  type t
  type requestData<'a> = String(string) | Object('a) | ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)
  type successResponse<'a> = {
    data: requestData<'a>,
    statusCode: int,
    header: Js.Dict.t<string>,
    cookies: array<string>,
    profile: profile,
  }

  type failResponse = {
    errMsg: string,
    errno: int,
  }

  type requestOptions<'a, 'b> = {
    url: string,
    data?: @unwrap requestData<'a>,
    header?: Js.Dict.t<string>,
    timeout?: int,
    method?: [#GET | #OPTIONS | #HEAD | #POST | #PUT | #DELETE | #TRACE | #CONNECT],
    dataType?: string,
    responseType?: [#text | #arraybuffer],
    enableHttp2?: bool,
    enableQuic?: bool,
    enableCache?: bool,
    enableHttpDNS?: bool,
    httpDNSServiceId?: string,
    enableChunked?: bool,
    forceCellularNetwork?: bool,
    success: successResponse<'b> => unit,
    fail?: failResponse => unit,
    complete?: unit => unit,
  }

  @send
  external request: (wx, requestOptions<'a, 'b>) => t = "request"

  @send
  external abort: t => unit = "abort"

  @send
  external onChunkReceived: (t, {"data": Js.TypedArray2.ArrayBuffer.t} => unit) => unit =
    "onChunkReceived"

  @send
  external offChunkReceived: (t, {"data": Js.TypedArray2.ArrayBuffer.t} => unit) => unit =
    "offChunkReceived"

  @send
  external onHeadersReceived: (t, {"header": Js.Dict.t<string>} => unit) => unit =
    "onHeadersReceived"

  @send
  external offHeadersReceived: (t, {"header": Js.Dict.t<string>} => unit) => unit =
    "offHeadersReceived"
}

module DownloadTask = {
  type t
  type successResponse = {
    tempFilePath: string,
    filePath: string,
    statusCode: int,
    profile: profile,
  }
  type downloadOptions = {
    url: string,
    header?: Js.Dict.t<string>,
    timeout?: int,
    filePath?: string,
    success: successResponse => unit,
    fail?: unit => unit,
    complete?: unit => unit,
  }
  type progressUpdateResponse = {
    progress: int,
    totalBytesWritten: int,
    totalBytesExpectedToWrite: int,
  }

  @send
  external downloadFile: (wx, downloadOptions) => t = "downloadFile"

  @send
  external abort: t => unit = "abort"

  @send
  external onProgressUpdate: (t, progressUpdateResponse => unit) => unit = "onProgressUpdate"

  @send
  external offProgressUpdate: (t, progressUpdateResponse => unit) => unit = "offProgressUpdate"

  @send
  external onHeadersReceived: (t, {"header": Js.Dict.t<string>} => unit) => unit =
    "onHeadersReceived"

  @send
  external offHeadersReceived: (t, {"header": Js.Dict.t<string>} => unit) => unit =
    "offHeadersReceived"
}

module UploadTask = {
  type t
  type successResponse = {
    data: string,
    statusCode: int,
  }
  type uploadOptions = {
    url: string,
    filePath: string,
    name: string,
    header?: Js.Dict.t<string>,
    formData?: Js.Dict.t<string>,
    timeout?: int,
    success: successResponse => unit,
    fail?: unit => unit,
    complete?: unit => unit,
  }
  type progressUpdateResponse = {
    progress: int,
    totalBytesSent: int,
    totalBytesExpectedToSend: int,
  }

  @send
  external uploadFile: (wx, uploadOptions) => t = "uploadFile"

  @send
  external abort: t => unit = "abort"

  @send
  external onProgressUpdate: (t, progressUpdateResponse => unit) => unit = "onProgressUpdate"

  @send
  external offProgressUpdate: (t, progressUpdateResponse => unit) => unit = "offProgressUpdate"

  @send
  external onHeadersReceived: (t, {"header": Js.Dict.t<string>} => unit) => unit =
    "onHeadersReceived"

  @send
  external offHeadersReceived: (t, {"header": Js.Dict.t<string>} => unit) => unit =
    "offHeadersReceived"
}

module WebSocket = {
  type socketTask

  type wsOptions = {
    url: string,
    header?: Js.Dict.t<string>,
    protocols?: array<string>,
    tcpNoDelay?: bool,
    perMessageDeflate?: bool,
    timouet?: int,
    forceCellularNetwork?: bool,
    success: unit => unit,
    fail?: unit => unit,
    complete?: unit => unit,
  }

  @send
  external connectSocket: (wx, wsOptions) => socketTask = "connectSocket"

  module SocketTask = {
    type message = String(string) | ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)
    type closeOptions = {
      code?: int,
      reason?: string,
      success: unit => unit,
      fail?: unit => unit,
      complete?: unit => unit,
    }
    type sendOptions = {
      data: @unwrap message,
      success: unit => unit,
      fail?: unit => unit,
      complete?: unit => unit,
    }

    @send
    external close: (socketTask, closeOptions) => unit = "close"
    @send
    external send: (socketTask, sendOptions) => unit = "send"

    @send
    external onClose: (socketTask, {"code": int, "reason": string} => unit) => unit = "onClose"

    @send external onError: (socketTask, {"errMsg": string} => unit) => unit = "onError"

    @send external onMessage: (socketTask, @unwrap message => unit) => unit = "onMessage"

    @send
    external onOpen: (
      socketTask,
      {"header": Js.Dict.t<string>, "profile": profile} => unit,
    ) => unit = "onOpen"
  }
}

module M_DNS = {
  @send
  external stopLocalServiceDiscovery: wx => promise<{"errMsg": string}> =
    "stopLocalServiceDiscovery"

  @send
  external startLocalServiceDiscovery: (
    wx,
    {"serviceType": string},
  ) => promise<{
    "errMsg": option<string>,
  }> = "startLocalServiceDiscovery"

  @send
  external onLocalServiceResolveFail: (
    wx,
    {"serviceType": string, "serviceName": string} => unit,
  ) => unit = "onLocalServiceResolveFail"

  @send
  external offLocalServiceResolveFail: (
    wx,
    {"serviceType": string, "serviceName": string} => unit,
  ) => unit = "offLocalServiceResolveFail"

  @send
  external onLocalServiceLost: (
    wx,
    {"serviceType": string, "serviceName": string} => unit,
  ) => unit = "onLocalServiceLost"

  @send
  external offLocalServiceLost: (
    wx,
    {"serviceType": string, "serviceName": string} => unit,
  ) => unit = "offLocalServiceLost"

  @send
  external onLocalServiceFound: (
    wx,
    {"serviceType": string, "serviceName": string, "ip": string, "port": int} => unit,
  ) => unit = "onLocalServiceFound"

  @send
  external offLocalServiceFound: (
    wx,
    {"serviceType": string, "serviceName": string, "ip": string, "port": int} => unit,
  ) => unit = "offLocalServiceFound"

  @send
  external onLocalServiceDiscoveryStop: (wx, {..} => unit) => unit = "onLocalServiceDiscoveryStop"

  @send
  external offLocalServiceDiscoveryStop: (wx, {..} => unit) => unit = "offLocalServiceDiscoveryStop"
}

module TCPSocket = {
  type t
  type message = {
    message: Js.TypedArray2.ArrayBuffer.t,
    remoteInfo: {"address": string, "family": string, "port": int, "size": int},
    localInfo: {"address": string, "family": string, "port": int},
  }
  type msg = String(string) | ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)

  @send
  external createTCPSocket: wx => t = "createTCPSocket"

  @send external bindWifi: (t, {"BSSID": string}) => unit = "bindWifi"

  @send external close: t => unit = "close"

  @send external write: (t, msg) => unit = "write"

  @send
  external connect: (t, {"port": int, "address": string, "timeout": option<int>}) => unit =
    "connect"

  @send external onBindWifi: (t, {..} => unit) => unit = "onBindWifi"
  @send external offBindWifi: (t, {..} => unit) => unit = "offBindWifi"

  @send external onClose: (t, {..} => unit) => unit = "onClose"
  @send external offClose: (t, {..} => unit) => unit = "offClose"

  @send external onConnect: (t, {..} => unit) => unit = "onConnect"
  @send external offConnect: (t, {..} => unit) => unit = "offConnect"

  @send external onError: (t, {"errMsg": string} => unit) => unit = "onError"
  @send external offError: (t, {"errMsg": string} => unit) => unit = "offError"

  @send external onMessage: (t, message => unit) => unit = "onMessage"
  @send external offMessage: (t, message => unit) => unit = "offMessage"
}


module UDPSocket = {
  type t
  type message = {
    message: Js.TypedArray2.ArrayBuffer.t,
    remoteInfo: {"address": string, "family": string, "port": int, "size": int},
    localInfo: {"address": string, "family": string, "port": int},
  }
  type msg = String(string) | ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)
  type sendProps = {
    address: string,
    port: int,
    message: @unwrap msg,
    offset?: int,
    length?: int,
    setBroadcast?: bool,
  }

  @send
  external createTCPSocket: wx => t = "createUDPSocket"

  @send external bind: t => int = "bind"

  @send external connect: (t, {"port": int, "address": string}) => unit = "connect" 

  @send external close: t => unit = "close"

  @send external write: (t, sendProps) => unit = "write"

  @send external send: (t, sendProps) => unit = "send"

  @send external setTTL: (t, int) => unit = "setTTL"


  @send external onClose: (t, {..} => unit) => unit = "onClose"
  @send external offClose: (t, {..} => unit) => unit = "offClose"

  @send external onError: (t, {"errMsg": string} => unit) => unit = "onError"
  @send external offError: (t, {"errMsg": string} => unit) => unit = "offError"

  @send external onMessage: (t, message => unit) => unit = "onMessage"
  @send external offMessage: (t, message => unit) => unit = "offMessage"

  @send external onListening: (t, {..} => unit) => unit = "onListening"
  @send external offListening: (t, {..} => unit) => unit = "offListening"
}