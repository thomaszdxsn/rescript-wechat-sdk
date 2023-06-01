type wx = WxCommon.wx

@send
external reportMonitor: (string, int) => unit = "reportMonitor"

@send
external reportEvent: (string, {..}) => unit = "reportEvent"

@send
external reportAnalytics: (string, {..}) => unit = "reportAnalytics"

@send
external getExpInfoSync: (array<string>) => {..} = "getExpInfoSync"