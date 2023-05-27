type wx = WxCommon.wx

@send
external switchTab: (wx, {"url": string}) => promise<'a> = "switchTab"

@send
external reLaunch: (wx, {"url": string}) => promise<'a> = "reLaunch"

@send
external redirectTo: (wx, {"url": string}) => promise<'a> = "redirectTo"

@send
external navigateTo: (wx, {"url": string, "events": {..}, "routeType": string}) => promise<'a> =
  "navigateTo"

@send
external navigateBack: (wx, {"delta": int}) => promise<'a> = "navigateBack"

module EventChannle = {
  type t

  @send
  external emit: (t, string, {..}) => uint = "emit"

  @send
  external on: (t, string, {..} => unit) => unit = "on"

  @send
  external off: (t, string, {..} => unit) => unit = "off"

  @send
  external once: (t, string, {..} => unit) => unit = "once"
}

module Router = {
  type t

  @val
  external getRouter: wx => t = "router"

  @send
  external addRouteBuilder: (t, string, {..} => unit) => unit = "addRouteBuilder"

  @send
  external getRouteContext: (t, {..}) => 'a = "getRouteContext"

  @send
  external removeRouteBuilder: (t, string) => unit = "removeRouteBuilder"
}
