type wx = WxCommon.wx

@send external getExtConfigSync: unit => {..} = "getExtConfigSync"

@send external getExtConfig: unit => {..} = "getExtConfig"

module InterstitialAd = {
  type t

    @send
  external createInterstitialAd: (wx, {"adUnitId": string, "multiton": option<bool>}) => t =
    "createInterstitialAd"

  @send external destroy: t => unit = "destroy"

  @send external load: t => promise<unit> = "load"

  @send external show: t => promise<unit> = "show"

  @send external onLoad: (t, ({..} => unit)) => unit = "onLoad"
  @send external offLoad: (t, ({..} => unit)) => unit = "offLoad"

  @send external onError: (t, ({..} => unit)) => unit = "onError"
  @send external offError: (t, ({..} => unit)) => unit = "offError"

  @send external onClose: (t, ({..} => unit)) => unit = "onClose"
  @send external offClose: (t, ({..} => unit)) => unit = "offClose"
}

module RewardedVideoAd = {
  type t

  @send
  external createRewardedVideoAd: (wx, {"adUnitId": string, "multiton": option<bool>}) => t =
    "createRewardedVideoAd"

  @send external destroy: t => unit = "destroy"

  @send external load: t => promise<unit> = "load"

  @send external show: t => promise<unit> = "show"

  @send external onLoad: (t, ({..} => unit)) => unit = "onLoad"
  @send external offLoad: (t, ({..} => unit)) => unit = "offLoad"

  @send external onError: (t, ({..} => unit)) => unit = "onError"
  @send external offError: (t, ({..} => unit)) => unit = "offError"

  @send external onClose: (t, ({..} => unit)) => unit = "onClose"
  @send external offClose: (t, ({..} => unit)) => unit = "offClose"
}
