type wx = WxCommon.wx

@send
external reportMonitor: (wx, string, int) => unit = "reportMonitor"

@send
external reportEvent: (wx, string, {..}) => unit = "reportEvent"

@send
external reportAnalytics: (wx, string, {..}) => unit = "reportAnalytics"

@send
external getExpInfoSync: (wx, array<string>) => {..} = "getExpInfoSync"