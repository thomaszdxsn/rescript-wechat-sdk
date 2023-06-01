type wx = WxCommon.wx

@send
external setStorageSync: (wx, string, {..}) => unit = "setStorageSync"

@send
external setStorage: (wx, {"key": string, "data": {..}, "encrypt": option<bool>}) => promise<unit> =
  "setStorage"

@send
external revokeBufferURL: (wx, string) => unit = "revokeBufferURL"

@send
external removeStorageSync: (wx, string) => unit = "removeStorageSync"

@send
external removeStorage: (wx, {"key": string}) => promise<unit> = "removeStorage"

@send
external getStorageSync: (wx, string) => {..} = "getStorageSync"

@send
external getStorageInfoSync: wx => {
  "success": {"keys": array<string>, "currentSize": int, "limitSize": int} => unit,
  "fail": {..} => unit,
  "complete": {..} => unit,
} = "getStorageInfoSync"

@send
external getStorageInfo: wx => promise<{
  "keys": array<string>,
  "currentSize": int,
  "limitSize": int,
}> = "getStorageInfo"

@send
external getStorage: (wx, {"key": string, "encrypt": option<bool>}) => promise<{"data": {..}}> =
  "getStorage"

@send
external createBufferURL: (wx, Js.TypedArray2.ArrayBuffer.t) => string = "createBufferURL"

@send
external clearStorageSync: wx => unit = "clearStorageSync"

@send external clearStorage: wx => promise<unit> = "clearStorage"

@send
external batchSetStorageSync: (wx, array<{"key": string, "value": {..}}>) => unit =
  "batchSetStorageSync"

@send
external batchSetStorage: (wx, array<{"key": string, "value": {..}}>) => promise<unit> =
  "batchSetStorage"

@send external batchRemoveStorageSync: (wx, array<string>) => unit = "batchRemoveStorageSync"

@send external batchRemoveStorage: (wx, array<string>) => promise<unit> = "batchRemoveStorage"

// 周期性更新

@send
external setBackgroundFetchToken: (wx, {"token": string}) => promise<unit> =
  "setBackgroundFetchToken"

@send
external onBackgroundFetchData: (
  wx,
  {
    "fetchType": string,
    "fetchData": string,
    "timeStamp": int,
    "path": string,
    "query": string,
    "scene": int,
  } => unit,
) => unit = "onBackgroundFetchData"

@send
external getBackgroundFetchToken: wx => promise<{"token": string, "errMsg": option<string>}> =
  "getBackgroundFetchToken"

@send
external getBackgroundFetchData: (
  wx,
  {"fetchType": string},
) => promise<{
  "fetchData": string,
  "timeStamp": int,
  "path": string,
  "query": string,
  "scene": int,
}> = "getBackgroundFetchData"

module CacheManager = {
  type t

  type schema = {
    @as("type") type_: string,
    value?: string,
  }

  type rule = {
    id?: string,
    method?: string,
    url: string,
    maxAge?: int,
    dataSchema: array<schema>,
  }

  type handler<'a, 'b> = {
    "url": string,
    "data": 'a,
    "method": string,
    "request": promise<'a>,
  } => promise<'b>

  @send
  external createCacheManager: (
    wx,
    {
      "origin": option<string>,
      "mode": option<[#weakNetwork | #always | #none]>,
      "maxAge": option<int>,
      "extra": {"apiList": array<string>},
    },
  ) => t = "createCacheManager"

  @send
  external addRule: (t, rule) => string = "addRule"

  @send
  external addRules: (t, array<rule>) => array<string> = "addRules"

  @send
  external clearCaches: t => unit = "clearCaches"

  @send
  external clearRules: t => unit = "clearRules"

  @send
  external clearCache: (t, string) => unit = "clearCache"

  @send external deleteCaches: (t, array<string>) => unit = "deleteCaches"

  @send external deleteRules: (t, array<string>) => unit = "deleteRules"

  @send external deleteRule: (t, string) => unit = "deleteRule"

  @send
  external match: (
    t,
    {..},
  ) => {"ruleId": string, "cachedId": string, "data": {..}, "createTime": int, "maxAge": int} =
    "match"

  @send external on: (t, string, handler<'a, 'b>) => unit = "on"
  @send external off: (t, string, handler<'a, 'b>) => unit = "off"
  @send external start: t => unit = "start"
  @send external stop: t => unit = "stop"
}
