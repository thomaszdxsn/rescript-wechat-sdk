type wx = WxCommon.wx

type openMiniProgramOptions = {
  appid: string,
  path?: string,
  extraData?: {..},
  envVersion?: [#develop | #trail | #release],
  shortLink?: string,
  verify?: [#binding | #unionProduct],
  onRelaunchIfPathUnchanged?: boolean,
}

// https://developers.weixin.qq.com/miniprogram/dev/api/navigate/wx.openEmbeddedMiniProgram.html
@send
external openEmbededMiniProgram: (wx, openMiniProgramOptions) => promise<'a> =
  "openEmbededMiniProgram"

@send
external navigateToMiniProgram: (wx, openMiniProgramOptions) => promise<'a> =
  "navigateToMiniProgram"

@send
external navigateBackMiniProgram: (wx, {"data": {..}}) => promise<'a> = "navigateBackMiniProgram"

@send
external exitMiniProgram: (wx) => promise<'a> = "exitMiniProgram"