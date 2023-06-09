type wx = WxCommon.wx

@send
external stopBluetoothDevicesDiscovery: wx => promise<{..}> = "stopBluetoothDevicesDiscovery"

@send
external startBluetoothDevicesDiscovery: (
  wx,
  {
    "services": option<array<string>>,
    "allowDuplicatesKey": option<bool>,
    "interval": option<int>,
    "powerLevel": option<string>,
  },
) => promise<{..}> = "startBluetoothDevicesDiscovery"

@send
external openBluetoothAdapter: (wx, {"mode": option<string>}) => promise<{..}> =
  "openBluetoothAdapter"

@send
external onBluetoothDeviceFound: (
  wx,
  {
    "devices": array<{
      "deviceId": string,
      "name": string,
      "RSSI": int,
      "advertisData": Js.TypedArray2.ArrayBuffer.t,
      "advertisServiceUUIDs": array<string>,
      "localName": string,
      "serviceData": {..},
      "connectable": bool,
    }>,
  } => unit,
) => unit = "onBluetoothDeviceFound"

@send
external onBluetoothAdapterStateChange: (
  wx,
  {"available": bool, "discovering": bool} => unit,
) => unit = "onBluetoothAdapterStateChange"

@send external offBluetoothDeviceFound: wx => unit = "offBluetoothDeviceFound"

@send external offBluetoothAdapterStateChange: wx => unit = "offBluetoothAdapterStateChange"

@send
external makeBluetoothPair: (
  wx,
  {"deviceId": string, "pin": string, "timeout": option<int>},
) => promise<{..}> = "makeBluetoothPair"

@send
external isBluetoothPairing: (wx, {"deviceId": string}) => promise<{..}> = "isBluetoothPairing"

@send
external getConnectedBluetoothDevices: (wx, {"services": array<string>}) => promise<{..}> =
  "getConnectedBluetoothDevices"

@send external getBluetoothDevices: wx => promise<{..}> = "getBluetoothDevices"

@send external getBluetoothAdapterState: wx => promise<{..}> = "getBluetoothAdapterState"

@send external closeBluetoothAdapter: wx => promise<{..}> = "closeBluetoothAdapter"

// 「蓝牙 - 低功耗中心设备」 TODO
// 「蓝牙 - 低功耗外围设备」 TODO

// 「蓝牙 - 信标」
module BeaconInfo = {
  type t

  @get external getUUID: t => string = "uuid"
  @get external getMajor: t => string = "major"
  @get external getMinor: t => string = "minor"
  @get external getProximity: t => int = "proximity"
  @get external getAccuracy: t => int = "accuracy"
  @get external getRSSI: t => int = "rssi"
}

@send external stopBeaconDiscovery: wx => promise<{..}> = "stopBeaconDiscovery"
@send
external startBeaconDiscovery: (
  wx,
  {"uuids": array<string>, "ignoreBluetoothAvailable": option<bool>},
) => promise<{..}> = "startBeaconDiscovery"
@send external onBeaconUpdate: (wx, array<BeaconInfo.t> => unit) => unit = "onBeaconUpdate"
@send external offBeaconUpdate: wx => unit = "offBeaconUpdate"
@send
external onBeaconServiceChange: (wx, {"available": bool, "discovering": bool}) => unit =
  "onBeaconServiceChange"
@send external offBeaconServiceChange: wx => unit = "offBeaconServiceChange"
@send external getBeacons: wx => promise<array<BeaconInfo.t>> = "getBeacons"

// NFC

module IsoDep = {
  type t

  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getHistoricalBytes: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getHistoricalBytes"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}
module MifareClassic = {
  type t

  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}
module MifareUltralight = {
  type t

  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}
module Ndef = {
  type t
  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send external onNdefMessage: (t, {..} => unit) => unit = "onNdefMessage"
  @send external offNdefMessage: t => unit = "offNdefMessage"
  @send external writeNdefMessage: (t, {..}) => unit = "writeNdefMessage"
}
module NfcA = {
  type t
  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}
module NfcB = {
  type t
  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}
module NfcF = {
  type t
  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}
module NfcV = {
  type t
  @send
  external close: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "close"

  @send
  external connect: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "connect"

  @send
  external getMaxTransceiveLength: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "getMaxTransceiveLength"

  @send
  external setTimeout: (
    t,
    {
      "timeout": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "setTimeout"

  @send
  external transceive: (
    t,
    {
      "data": Js.TypedArray2.ArrayBuffer.t,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "transceive"
}

module NFCAdapter = {
  type t

  @send external getNFCAdapter: wx => t = "getNFCAdapter"

  @send external getIsoDep: t => IsoDep.t = "getIsoDep"

  @send external getMifareClassic: t => MifareClassic.t = "getMifareClassic"

  @send external getMifareUltralight: t => MifareUltralight.t = "getMifareUltralight"

  @send external getNdef: t => Ndef.t = "getNdef"

  @send external getNfcA: t => NfcA.t = "getNfcA"

  @send external getNfcB: t => NfcB.t = "getNfcB"

  @send external getNfcF: t => NfcF.t = "getNfcF"

  @send external getNfcV: t => NfcV.t = "getNfcV"

  @send external onDiscovered: (t, {..} => unit) => unit = "onDiscovered"
  @send external offDiscovered: t => unit = "offDiscovered"

  @send
  external startDiscovery: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "startDiscovery"

  @send
  external stopDiscovery: (
    t,
    {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<{..} => unit>},
  ) => unit = "stopDiscovery"
}

// 「Wi-Fi」
@send external stopWifi: wx => promise<{..}> = "stopWifi"
@send external startWifi: wx => promise<{..}> = "startWifi"
@send
external setWifiList: (
  wx,
  {
    "wifiList": array<{
      "SSID": option<string>,
      "BSSID": option<string>,
      "password": option<string>,
    }>,
  },
) => promise<{..}> = "setWifiList"
@send
external connectWifi: (
  wx,
  {
    "SSID": string,
    "BSSID": option<string>,
    "password": string,
    "manual": option<bool>,
    "partialInfo": option<bool>,
  },
) => promise<{..}> = "connectWifi"

module WifiInfo = {
  type t

  @get external getSSID: t => string = "SSID"
  @get external getBSSID: t => string = "BSSID"
  @get external getSecure: t => bool = "secure"
  @get external getSignalStrength: t => int = "signalStrength"
  @get external getFrequency: t => int = "frequency"
}

@send
external onWifiConnectedWithPartialInfo: (wx, {"wifi": WifiInfo.t} => unit) => unit =
  "onWifiConnectedWithPartialInfo"
@send
external offWifiConnectedWithPartialInfo: (wx, {"wifi": WifiInfo.t} => unit) => unit =
  "offWifiConnectedWithPartialInfo"

@send external onGetWifiList: (wx, {"wifi": array<WifiInfo.t>} => unit) => unit = "onGetWifiList"
@send external offGetWifiList: (wx, {"wifi": array<WifiInfo.t>} => unit) => unit = "offGetWifiList"

@send external onWifiConnected: (wx, {"wifi": WifiInfo.t} => unit) => unit = "onWifiConnected"
@send external offWifiConnected: (wx, {"wifi": WifiInfo.t} => unit) => unit = "offWifiConnected"

// 「日历」
@send
external addPhoneRepeatCalendar: (
  wx,
  {
    "title": string,
    "startDate": int,
    "allDay": option<bool>,
    "description": option<string>,
    "location": option<string>,
    "endDate": option<int>,
    "alarm": option<bool>,
    "alarmOffset": option<int>, // unit: second
    "repeatInterval": option<string>,
    "repeatEndTime": option<int>,
  },
) => promise<{..}> = "addPhoneRepeatCalendar"

@send
external addPhoneCalendar: (
  wx,
  {
    "title": string,
    "startDate": int,
    "allDay": option<bool>,
    "description": option<string>,
    "location": option<string>,
    "endDate": option<int>,
    "alarm": option<bool>,
    "alarmOffset": option<int>, // unit: second
  },
) => promise<{..}> = "addPhoneCalendar"

// 「联系人」
@send
external chooseContact: (
  wx,
  {
    "success": {"phoneNumber": string, "displayName": string, "phoneNumberList": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<{..} => unit>,
  },
) => unit = "chooseContact"

@send
external addPhoneContact: (
  wx,
  {
    "firstName": string,
    "photoFilePath": option<string>,
    "nickName": option<string>,
    "lastName": option<string>,
    "middleName": option<string>,
    "remark": option<string>,
    "mobilePhoneNumber": option<string>,
    "weChatNumber": option<string>,
    "addressCountry": option<string>,
    "addressState": option<string>,
    "addressCity": option<string>,
    "addressStreet": option<string>,
    "addressPostalCode": option<string>,
    "organization": option<string>,
    "title": option<string>,
    "workFaxNumber": option<string>,
    "workPhoneNumber": option<string>,
    "hostNumber": option<string>,
    "email": option<string>,
    "url": option<string>,
    "workAddressCountry": option<string>,
    "workAddressState": option<string>,
    "workAddressCity": option<string>,
    "workAddressStreet": option<string>,
    "workAddressPostalCode": option<string>,
    "homeFaxNumber": option<string>,
    "homePhoneNumber": option<string>,
    "homeAddressCountry": option<string>,
    "homeAddressState": option<string>,
    "homeAddressCity": option<string>,
    "homeAddressStreet": option<string>,
    "homeAddressPostalCode": option<string>,
  },
) => promise<{..}> = "addPhoneContact"

@send external checkIsOpenAccessibility: wx => promise<{"open": bool}> = "checkIsOpenAccessibility"

@send external getBatteryInfoSync: wx => {"level": int, "isCharging": bool} = "getBatteryInfoSync"
@send external getBattery: wx => promise<{"level": int, "isCharging": bool}> = "getBattery"

@send external setClipboardData: (wx, {"data": string}) => promise<{..}> = "setClipboardData"
@send external getClipboardData: wx => promise<{"data": string}> = "getClipboardData"

// 「NFC主机卡模拟」
@send external stopHCE: wx => promise<{..}> = "stopHCE"
@send external startHCE: (wx, {"aid_list": array<string>}) => promise<{..}> = "startHCE"
@send
external sendHCEMessage: (wx, {"data": Js.TypedArray2.ArrayBuffer.t}) => promise<{..}> =
  "sendHCEMessage"
@send
external onHCEMessage: (
  wx,
  {"data": Js.TypedArray2.ArrayBuffer.t, "messageType": int, "reason": int} => unit,
) => unit = "onHCEMessage"
@send
external offHCEMessage: (
  wx,
  {"data": Js.TypedArray2.ArrayBuffer.t, "messageType": int, "reason": int} => unit,
) => unit = "offHCEMessage"
@send external getHCEState: wx => promise<{..}> = "getHCEState"

// 「网络」
@send
external onNetworkWeakChange: (wx, {"weakNet": bool, "networkType": string} => unit) => unit =
  "onNetworkWeakChange"
@send
external offNetworkWeakChange: (wx, {"weakNet": bool, "networkType": string} => unit) => unit =
  "offNetworkWeakChange"

@send
external onNetworkStatusChange: (wx, {"isConnected": bool, "networkType": string} => unit) => unit =
  "onNetworkStatusChange"
@send
external offNetworkStatusChange: (
  wx,
  {"isConnected": bool, "networkType": string} => unit,
) => unit = "offNetworkStatusChange"

@send
external getNetworkType: wx => promise<{
  "networkType": string,
  "signalStrength": int,
  "hasSystemProxy": bool,
}> = "getNetworkType"

@send
external getLocalIPAddress: wx => promise<{
  "localip": string,
  "netmask": string,
  "errMsg": string,
}> = "getLocalIPAddress"

// 「加密」
@send
external getRandomValues: (
  wx,
  {"length": int},
) => promise<{
  "randomValues": Js.TypedArray2.ArrayBuffer.t,
}> = "getRandomValues"

// 「屏幕」
@send
external setVisualEffectOnCapture: (wx, {"visualEffect": string}) => promise<{..}> =
  "setVisualEffectOnCapture"

@send
external setScreenBrightness: (wx, {"value": int}) => promise<{..}> = "setScreenBrightness"

@send
external setKeepScreenOn: (wx, {"keepScreenOn": bool}) => promise<{..}> = "setKeepScreenOn"

@send external onUserCaptureScreen: (wx, {..} => unit) => unit = "onUserCaptureScreen"
@send external offUserCaptureScreen: (wx, {..} => unit) => unit = "offUserCaptureScreen"

@send
external onScreenRecordingStateChanged: (wx, {"state": string} => unit) => unit =
  "onScreenRecordingStateChanged"
@send
external offScreenRecordingStateChanged: (wx, {"state": string} => unit) => unit =
  "offScreenRecordingStateChanged"

@send external getScreenRecordingState: wx => promise<{"state": string}> = "getScreenRecordingState"

@send external getScreenBrightness: wx => promise<{"value": int}> = "getScreenBrightness"

// 「键盘」
@send
external onKeyboardHeightChange: (wx, {"height": int} => unit) => unit = "onKeyboardHeightChange"
@send
external offKeyboardHeightChange: (wx, {"height": int} => unit) => unit = "offKeyboardHeightChange"
@send external hideKeyboard: wx => promise<{..}> = "hideKeyboard"
@send
external getSelectedTextRange: wx => promise<{"start": int, "end": int}> = "getSelectedTextRange"

// 「电话」
@send
external makePhoneCall: (wx, {"phoneNumber": string}) => promise<{..}> = "makePhoneCall"

// 「加速计」
@send
external stopAccelerometer: wx => promise<{..}> = "stopAccelerometer"
@send
external startAccelerometer: (wx, {"interval": option<string>}) => promise<{..}> =
  "startAccelerometer"
@send
external onAccelerometerChange: (wx, {"x": float, "y": float, "z": float} => unit) => unit =
  "onAccelerometerChange"
@send
external offAccelerometerChange: (wx, {"x": float, "y": float, "z": float} => unit) => unit =
  "offAccelerometerChange"

// 「罗盘」
@send
external stopCompass: wx => promise<{..}> = "stopCompass"
@send
external startCompass: wx => promise<{..}> = "startCompass"
@send
external onCompassChange: (wx, {"direction": float, "accuracy": float} => unit) => unit =
  "onCompassChange"
@send
external offCompassChange: (wx, {"direction": float, "accuracy": float} => unit) => unit =
  "offCompassChange"

// 「设备方向」
@send
external stopDeviceMotionListening: wx => promise<{..}> = "stopDeviceMotionListening"
@send
external startDeviceMotionListening: (wx, {"interval": option<string>}) => promise<{..}> =
  "startDeviceMotionListening"
@send
external onDeviceMotionChange: (
  wx,
  {"alpha": float, "beta": float, "gamma": float} => unit,
) => unit = "onDeviceMotionChange"
@send
external offDeviceMotionChange: (
  wx,
  {"alpha": float, "beta": float, "gamma": float} => unit,
) => unit = "offDeviceMotionChange"

// 「陀螺仪」
@send
external stopGyroscope: wx => promise<{..}> = "stopGyroscope"
@send
external startGyroscope: (wx, {"interval": option<string>}) => promise<{..}> = "startGyroscope"
@send
external onGyroScopeChange: (wx, {"x": float, "y": float, "z": float} => unit) => unit =
  "onGyroScopeChange"
@send
external offGyroScopeChange: (wx, {"x": float, "y": float, "z": float} => unit) => unit =
  "offGyroScopeChange"

// 「内存」
@send external onMemoryWarning: (wx, {"level": int} => unit) => unit = "onMemoryWarning"
@send external offMemoryWarning: (wx, {"level": int} => unit) => unit = "offMemoryWarning"

// 「扫码」
@send
external scanCode: (
  wx,
  {
    "onlyFromCamera": option<bool>,
    "scanType": option<array<[#barCode | #qrCode | #datamatrix | #pdf417]>>,
  },
) => promise<{..}> = "scanCode"

@send
external sendSms: (
  wx,
  {
    "phoneNumber": string,
    "content": string,
  },
) => promise<{..}> = "sendSms"

@send
external vibrateShort: (
  wx,
  {
    "type": [#heavy | #medium | #light]
  },
) => promise<{..}> = "vibrateShort"

@send external vibrateLong: wx => promise<{..}> = "vibrateLong"