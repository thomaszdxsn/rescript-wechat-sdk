type wx = WxCommon.wx

@send
external pluginLogin: (
  wx,
  {
    "success": {"code": string} => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "pluginLogin"

@send
external login: (
  wx,
  {
    "timeout": option<int>,
    "success": {"code": string} => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "login"

@send
external checkSession: wx => promise<unit> = "checkSession"

@send
external getAccountInfoSync: wx => {
  "miniProgram": {"appId": string, "envVersion": string, "version": string},
  "plugin": {"appId": string, "version": string},
} = "getAccountInfoSync"

@send
external getUserProfile: (
  wx,
  {"lang": option<string>, "desc": option<string>},
) => promise<{
  "userInfo": {..},
  "rawData": string,
  "signature": string,
  "encryptedData": string,
  "iv": string,
  "cloudID": string,
}> = "getUserProfile"

@send
external getUserInfo: (
  wx,
  {
    "withCredentials": option<bool>,
    "lang": option<string>,
    "success": {
      "userInfo": {..},
      "rawData": string,
      "signature": string,
      "encryptedData": string,
      "iv": string,
      "cloudID": string,
    } => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getUserInfo"

@send
external authorizeForMiniProgram: (
  wx,
  {
    "scope": string,
    "success": unit => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "authorizedForMiniProgram"

@send
external authorize: (
  wx,
  {
    "scope": string,
    "success": unit => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "authorize"

@send
external openSetting: (
  wx,
  {
    "withSubscriptions": option<bool>,
    "success": {"authSetting": {..}, "subscriptionsSetting": {..}} => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "openSetting"

@send
external getSetting: (
  wx,
  {
    "withSubscriptions": option<bool>,
    "success": {
      "authSetting": {..},
      "subscriptionsSetting": {..},
      "miniprogramAuthSetting": {..},
    } => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getSetting"

@send
external chooseAddress: (
  wx,
  {
    "success": {
      "userName": string,
      "postalCode": string,
      "provinceName": string,
      "cityName": string,
      "countyName": string,
      "streetName": string,
      "detailInfo": string,
      "detailInfoNew": string,
      "nationalCode": string,
      "telNumber": string,
    } => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "chooseAddress"

@send
external chooseInvoiceTitle: (
  wx,
  {
    "success": {
      "type": string,
      "title": string,
      "taxNumber": string,
      "companyAddress": string,
      "telephone": string,
      "bankName": string,
      "bankAccount": string,
      "errMsg": string,
    } => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "chooseInvoiceTitle"

@send
external chooseInvoice: (
  wx,
  {
    "success": {
      "type": string,
      "title": string,
      "taxNumber": string,
      "companyAddress": string,
      "telephone": string,
      "bankName": string,
      "bankAccount": string,
      "errMsg": string,
    } => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "chooseInvoice"

@send
external starSoterAuthentication: (
  wx,
  {
    "requestAuthModes": array<string>,
    "challenge": string,
    "authContent": option<string>,
    "success": {"resultJSON": string, "resultJSONSignature": string, "authMode": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "startSoterAuthentication"

@send
external checkIsSupportSoterAuthentication: (
  wx,
  {
    "success": {"supportMode": array<string>} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "checkIsSupportSoterAuthentication"

@send
external checkIsSoterEnrolledInDevice: (
  wx,
  {
    "checkAuthMode": string,
    "success": {"isEnrolled": bool} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "checkIsSoterEnrolledInDevice"

@send
external shareToWeRun: (
  wx,
  {
    "recordList": array<{
      "typeId": int,
      "time": int,
      "calorie": int,
      "distance": int,
    }>,
    "success": {"errMsg": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "shareToWeRun"

@send
external getWeRunData: (
  wx,
  {
    "success": {"encryptedData": string, "iv": string, "cloudId": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getWeRunData"

@send
external requestSubscribeMessage: (
  wx,
  {
    "tmplIds": array<string>,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "requestSubscribeMessage"

@send
external requestSubscribeDeviceMessage: (
  wx,
  {
    "deviceId": string,
    "sn": string,
    "snTicket": string,
    "modelId": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "requestSubscribeDeviceMessage"

@send
external showRedPackage: (
  wx,
  {
    "url": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "showRedPackage"

@send
external addVideoToFavorites: (
  wx,
  {
    "videoPath": string,
    "thumbPath": option<string>,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "addVideoToFavorites"

@send
external addFileToFavorites: (
  wx,
  {
    "filePath": string,
    "fileName": option<string>,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "addFileToFavorites"

@send
external checkIsAddedToMyMiniProgram: (
  wx,
  {
    "success": {"added": bool} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "checkIsAddedToMyMiniProgram"

@send
external chooseLicensePlate: (
  wx,
  {
    "success": {"plateNumber": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "chooseLicensePlate"

@send
external reserveChannelIsLave: (wx, {"noticeId": string}) => unit = "reserveChannelIsLave"

@send
external openChannelIsUserProfile: (
  wx,
  {
    "finderUserName": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "openChannelIsUserProfile"

@send
external openChannelsLive: (
  wx,
  {
    "finderUserName": string,
    "feedId": option<string>,
    "nonceId": option<string>,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "openChannelsLive"

@send
external openChannelsEvent: (
  wx,
  {
    "finderUserName": string,
    "eventId": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "openChannelIsEvent"

@send
external openChannelsActivity: (
  wx,
  {
    "finderUserName": string,
    "activityId": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "openChannelsActivity"

@send
external getChannelsShareKey: (
  wx,
  {
    "success": {"shareKey": string} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getChannelsShareKey"

@send
external getChannelsLiveNoticeInfo: (
  wx,
  {
    "finderUserName": string,
    "success": {"noticeInfo": {..}} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getChannelsLiveNoticeInfo"

@send
external getChannelsLiveInfo: (
  wx,
  {
    "finderUserName": string,
    "startTime": option<int>,
    "endTime": option<int>,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getChannelsLiveInfo"

@send
external requestDeviceVoIP: (
  wx,
  {
    "sn": string,
    "snTicket": string,
    "modelId": string,
    "deviceName": string,
    "isGroup": option<bool>,
    "groupId": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "requestDeviceVoIP"

@send
external getDeviceVoIPList: (
  wx,
  {
    "success": {
      "list": array<{
        "sn": string,
        "model_id": string,
        "group_id": string,
        "status": string,
      }>,
    } => unit,
    "fail": option<{..} => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "getDeviceVoIPList"

@send
external getGroupEnterInfo: (
  wx,
  {"success": {..} => unit, "fail": option<{..} => unit>, "complete": option<unit => unit>},
) => unit = "getGroupEnterInfo"

@send
external openCustomerServiceChat: (
  wx,
  {
    "extInfo": {"url": string},
    "corpId": string,
    "showMessageCard": option<bool>,
    "sendMessageTitle": option<string>,
    "sendMessagePath": option<string>,
    "sendMessageImg": option<string>,
  }
) => unit = "openCustomerServiceChat"