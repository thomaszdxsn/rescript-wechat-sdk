type wx

@val external wx: wx = "wx"

@send
external env: wx => {"USER_DATA_PATH": string} = "env"

@send
external canIUse: (wx, string) => bool = "canIUse"

@deprecated @send
external base64ToArrayBuffer: (wx, string) => Js_typed_array.array_buffer = "base64ToArrayBuffer"

@deprecated @send
external arrayBufferToBase64: (wx, Js_typed_array.array_buffer) => string = "arrayBufferToBase64"

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
