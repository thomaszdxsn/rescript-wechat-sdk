type wx

@val external wx: wx = "wx"

@send
external env: wx => {"USER_DATA_PATH": string} = "env"

@send
external canIUse: (wx, string) => bool = "canIUse"

@deprecated @send
external base64ToArrayBuffer: (wx, string) => Js.TypedArray2.ArrayBuffer.t = "base64ToArrayBuffer"

@deprecated @send
external arrayBufferToBase64: (wx, Js.TypedArray2.ArrayBuffer.t) => string = "arrayBufferToBase64"

// 「基础.系统」相关API
// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.openSystemBluetoothSetting.html
type windowInfo = {
  pixelRatio: float,
  screenWidth: int,
  screenHeight: int,
  windowWidth: int,
  windowHeight: int,
  statusBarHeight: int,
  safeArea: {"left": int, "right": int, "top": int, "bottom": int, "width": int, "height": int},
  screenTop: int,
}

type systemSetting = {
  bluetoothEnabled: bool,
  locationEnabled: bool,
  wifiEnabled: bool,
  deviceOrientation: [#portrait | #landscape],
}

type systemInfo = {
  brand: string,
  model: string,
  pixelRatio: float,
  screenWidth: int,
  screenHeight: int,
  windowWidth: int,
  windowHeight: int,
  statusBarHeight: int,
  language: string,
  version: string,
  system: string,
  platform: [#ios | #android | #windows | #mac | #devtools],
  fontSizeSetting: int,
  @as("SDKVersion") sdkVersion: string,
  becnmarkLevel: int,
  albumAuthorized: bool,
  cameraAuthorized: bool,
  locationAuthorized: bool,
  microphoneAuthorized: bool,
  notificationAuthorized: bool,
  notificationAlertAuthorized: bool,
  notificationBadgeAuthorized: bool,
  notificationSoundAuthorized: bool,
  phoneCalendarAuthorized: bool,
  bluetoothEnabled: bool,
  locationEnabled: bool,
  wifiEnabled: bool,
  safeArea: {"left": int, "right": int, "top": int, "bottom": int, "width": int, "height": int},
  locationReducedAccuracy: bool,
  theme: [#light | #dark],
  host: {"appId": string},
  enableDebug: bool,
  deviceOrientation: [#portrait | #landscape],
}

type skylineInfo = {
  isSupported: bool,
  version: string,
  reason: string,
}

type deviceInfo = {
  abi: string,
  deviceAbi: string,
  benchmarkLevel: int,
  brand: string,
  model: string,
  system: string,
  platform: string,
  cpuType: string,
  memorySize: string,
}

type appBaseInfo = {
  @as("SDKVersion") sdkVersion: string,
  enableDebug: bool,
  host: {"appId": string},
  language: string,
  version: string,
  theme: [#light | #dark],
}

type authorizeSetting = {
  albumAuthorized: bool,
  cameraAuthorized: bool,
  locationAuthorized: bool,
  microphoneAuthorized: bool,
  notificationAuthorized: bool,
  notificationAlertAuthorized: bool,
  notificationBadgeAuthorized: bool,
  notificationSoundAuthorized: bool,
  phoneCalendarAuthorized: bool,
}

@send
external openSystemBluetoothSetting: wx => promise<'a> = "openSystemBluetoothSetting"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.openAppAuthorizeSetting.html
@send
external openAppAuthorizeSetting: wx => promise<'a> = "openAppAuthorizeSetting"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getWindowInfo.html
@send
external getWindowInfo: wx => windowInfo = "getWindowInfo"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getSystemSetting.html
@send
external getSystemSetting: wx => systemSetting = "getSystemSetting"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getSystemInfo.html
@send
external getSystemInfo: wx => promise<systemInfo> = "getSystemInfoAsync"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getSkylineInfo.html
@send
external getSkylineInfo: wx => promise<skylineInfo> = "getSkylineInfo"

@send
external getRendererUserAgent: wx => promise<string> = "getRendererUserAgent"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getDeviceInfo.html
@send
external getDeviceInfo: wx => deviceInfo = "getDeviceInfo"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getAppBaseInfo.html
@send
external getAppBaseInfo: wx => appBaseInfo = "getAppBaseInfo"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/system/wx.getAppAuthorizeSetting.html
@send
external getAppAuthorizeSetting: wx => authorizeSetting = "getAppAuthorizeSetting"

// 「基础.更新」相关API: https://developers.weixin.qq.com/miniprogram/dev/api/base/update/wx.updateWeChatApp.html

@send
external updateWeChatApp: wx => promise<unit> = "updateWeChatApp"

@send
external applyUpdate: updateManager => unit = "applyUpdate"

module UpdateManager = {
  type t

  @send
  external getUpdateManager: wx => t = "getUpdateManager"

  @send
  external onCheckForUpdate: (t, bool => unit) => unit = "onCheckForUpdate"

  @send
  external onUpdateFailed: (t, unit => unit) => unit = "onUpdateFailed"

  @send
  external onUpdateReady: (t, unit => unit) => unit = "onUpdateReady"
}

// 「基础.小程序」相关API:  https://developers.weixin.qq.com/miniprogram/dev/api/base/app/life-cycle/wx.getLaunchOptionsSync.html

type launchOptions = {
  path: string,
  scene: int,
  query: Js.Dict.t<string>,
  shareTicket: string,
  referrerInfo: {"appId": string, "extraData": Js.Dict.t<string>},
  forwardMaterials: Js.Array2.t<{"type": string, "name": string, "path": string, "size": float}>,
  chatType: [#1 | #2 | #3 | #4],
  apiCategory: [#default | #nativeFunctionalized | #browserOnly | #embeded],
}

@send
external getLaunchOptionsSync: wx => launchOptions = "getLaunchOptionsSync"

@send
external getEnterOptionsSync: wx => launchOptions = "getEnterOptionsSync"

@send
external onUnhandleRejection: (wx, {"reason": string, "promise": promise<'a>} => unit) => unit =
  "onUnhandledRejection"

@send
external onThemeChange: (wx, {"theme": [#light | #dark]} => unit) => unit = "onThemeChange"

@send
external onPageNotFound: (
  wx,
  {"path": string, "query": Js.Dict.t<string>, "isEntryPage": bool} => unit,
) => unit = "onPageNotFound"

// https://developers.weixin.qq.com/miniprogram/dev/api/base/app/app-event/wx.onLazyLoadError.html
@send
external onLazyLoadError: (
  wx,
  {"type": string, "subpackage": array<'a>, "errMsg": string} => unit,
) => unit = "onLazyLoadError"

@send
external onError: (wx, {"message": string, "stack": string} => unit) => unit = "onError"

@send
external onAudioInterruptionEnd: (wx, unit => unit) => unit = "onAudioInterruptionEnd"

@send
external onAudioInterruptionBegin: (wx, unit => unit) => unit = "onAudioInterruptionBegin"

@send
external onAppShow: (wx, launchOptions => unit) => unit = "onAppShow"

@send
external onAppHide: (wx, unit => unit) => unit = "onAppHide"

@send
external offUnhandledRejection: (wx, {"reason": string, "promise": promise<'a>} => unit) => unit =
  "offUnhandledRejection"

@send
external offThemeChange: (wx, {"theme": [#light | #dark]} => unit) => unit = "offThemeChange"

@send
external offPageNotFound: (
  wx,
  {"path": string, "query": Js.Dict.t<string>, "isEntryPage": bool} => unit,
) => unit = "offPageNotFound"

@send
external offLazyLoadError: (
  wx,
  {"type": string, "subpackage": array<'a>, "errMsg": string} => unit,
) => unit = "offLazyLoadError"

@send
external offError: (wx, {"message": string, "stack": string} => unit) => unit = "offError"

@send
external offAudioInterruptionEnd: (wx, unit => unit) => unit = "offAudioInterruptionEnd"

@send
external offAudioInterruptionBegin: (wx, unit => unit) => unit = "offAudioInterruptionBegin"

@send
external offAppShow: (wx, launchOptions => unit) => unit = "offAppShow"

@send
external offAppHide: (wx, unit => unit) => unit = "offAppHide"

// 「基础.调试」相关APIs

@send
external setEnableDebug: (wx, {"enableDebug": bool}) => promise<'a> = "setEnableDebug"

module LogManager = {
  type t

  @send
  external getLogManager: (wx, {"label": int}) => t = "getLogManager"

  @send
  external debug: (t, 'a) => unit = "debug"
  @send
  external info: (t, 'a) => unit = "info"
  @send
  external log: (t, 'a) => unit = "log"
  @send
  external warn: (t, 'a) => unit = "warn"
}

module RealtimeLogManager = {
  type t
  type logState = {
    size: int,
    maxSize: int,
    logCount: int,
    maxLogCount: int,
  }

  @send
  external getRealtimeLogManager: wx => t = "getRealtimeLogManager"

  @send
  external addFilterMsg: (t, string) => unit = "addFilterMsg"

  @send
  external error: (t, 'a) => unit = "error"

  @send
  external getCurrentState: t => logState = "getCurrentState"

  @send
  external info: (t, 'a) => unit = "info"

  @send
  external setFilterMsg: (t, string) => unit = "setFilterMsg"

  @send
  external warn: (t, 'a) => unit = "warn"

  module RealtimeTagLogManager = {
    type t

    @send
    external make: (RealtimeLogManager.t, string) => t = "tag"

    @send
    external addFilterMsg: (t, string) => unit = "addFilterMsg"

    @send
    external error: (t, 'a) => unit = "error"

    @send
    external getCurrentState: t => logState = "getCurrentState"

    @send
    external info: (t, 'a) => unit = "info"

    @send
    external setFilterMsg: (t, string) => unit = "setFilterMsg"

    @send
    external warn: (t, 'a) => unit = "warn"
  }
}

// 「基础.性能」相关APIs
@send
external reportPerformance: (wx, int, int, string) => unit = "reportPerformance"

@send
external preloadWebview: wx => promise<'a> = "preloadWebview"

@send
external preloadSkylineView: wx => promise<'a> = "preloadSkylineView"

@send
external preloadAssets: (
  wx,
  {"data": array<{"type": [#font | #image], "src": string}>},
) => promise<'a> = "preloadAssets"

module Performance = {
  type t
  type entryType = [
    | #navigation
    | #render
    | #script
    | #loadPackage
    | #resource
  ]

  @send
  external getPerformance: wx => t = "getPerformance"

  @send
  external getEntries: t => array<PerformanceEntry.t> = "getEntries"

  @send
  external getEntriesByName: (t, string, entryType) => array<PerformanceEntry.t> =
    "getEntriesByName"

  @send
  external getEntriesByType: (t, entryType) => array<PerformanceEntry.t> = "getEntriesByType"

  @send
  external setBufferSize: (t, int) => unit = "setBufferSize"

  module PerformanceEntry = {
    type t = {
      entryType: entryType,
      name: string,
      startTime: float,
      duration: float,
      path: string,
      referrerPath: string,
      pageId: int,
      referrerPageId: int,
      navigationStart: float,
      navigationType: string,
      moduleName: string,
      fileList: array<string>,
      viewLayerReadyTime: float,
      initDataSendTime: float,
      initDataRecvTime: float,
      viewLayerRenderStartTime: float,
      viewLayerRenderEndTime: float,
      packageName: string,
      packageSize: float,
      uri: string,
      initiatorType: [
        | #audio
        | @as("cover-image") #coverImage
        | #image
        | @as("open-data") #openData
      ],
      transferSize: float,
      domainLookupStart: float,
      domainLookupEnd: float,
    }
  }

  module EntryList = {
    type t

    @send
    external getEntries: t => array<PerformanceEntry.t> = "getEntries"

    @send
    external getEntriesByName: (t, string, entryType) => array<PerformanceEntry.t> =
      "getEntriesByName"

    @send
    external getEntriesByType: (t, entryType) => array<PerformanceEntry.t> = "getEntriesByType"
  }

  module PerformanceObserver = {
    type t

    @send
    external createObserver: (Performance.t, EntryList.t => unit) => t = "createObserver"

    @send
    external disconnect: t => unit = "disconnect"

    @send
    external observe: (t, {"entryTypes": array<entryType>}) => unit = "observe"
  }
}

// 「基础.分包加载」相关APIs

// https://developers.weixin.qq.com/miniprogram/dev/api/base/subpackage/wx.preDownloadSubpackage.html
module PreDownloadSubpackageTask = {
  type t

  @send
  external make: (wx, {"packageType": [#workers]}) => t = "preDownloadSubpackage"

  @send
  external onProgressUpdate: (
    t,
    {"progress": int, "totalBytesWritten": int, "totalBytesExpectedToWrite": int} => unit,
  ) => unit = "onProgressUpdate"
}

// 「基础.加密」相关APIs

// https://developers.weixin.qq.com/miniprogram/dev/api/base/crypto/wx.getUserCryptoManager.html
module UserCryptoManager = {
  type t

  @send
  external make: wx => t = "getUserCryptoManager"

  @send
  external getLatestUserKey: t => promise<{
    "encryptKey": string,
    "iv": string,
    "version": int,
    "expireTime": int,
  }> = "getLatestUserKey"

  @send
  external getRandomValues: (
    t,
    {"length": int},
  ) => promise<{
    "randomValues": Js.TypedArray2.ArrayBuffer.t,
  }> = "getRandomValues"
}
