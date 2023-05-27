type wx = WxCommon.wx

type toastOptions = {
  title: string,
  icon?: [#success | #error | #loading | #none],
  duration?: int,
  mask?: bool,
  image?: bool,
}

@send external showToast: (wx, toastOptions) => promise<unit> = "showToast"

type modalOptions = {
  title?: string,
  content?: string,
  showCancel?: bool,
  cancelText?: string,
  cancelColor?: string,
  confirmText?: string,
  confirmColor?: string,
  editable?: bool,
  placeholderText?: string,
}

@send external showModal: (wx, modalOptions) => promise<{..}> = "showModal"

type loadingOptions = {
  title: string,
  mask?: bool,
}

@send external showLoading: (wx, loadingOptions) => promise<unit> = "showLoading"

type actionSheetOptions = {
  alertText?: string,
  itemList: array<string>,
  itemColor?: string,
}

@send external showActionSheet: (wx, actionSheetOptions) => promise<{..}> = "showActionSheet"

@send external hideToast: (wx, {"noConflict": bool}) => promise<unit> = "hideToast"

@send external hideLoading: (wx, {"noConflict": bool}) => promise<unit> = "hideLoading"

@send
external enableAlertBeforeUnload: (
  wx,
  {
    "message": string,
    "success": unit => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "enableAlertBeforeUnload"

@send
external disableAlertBeforeUnload: (
  wx,
  {"success": unit => unit, "fail": option<unit => unit>, "complete": option<unit => unit>},
) => unit = "disableAlertBeforeUnload"

@send external showNavigationBarLoading: wx => promise<unit> = "showNavigationBarLoading"

@send
external setNavigationBarTitle: (wx, {"title": string}) => promise<unit> = "setNavigationBarTitle"

@send
external setNavigationBarColor: (
  wx,
  {
    "frontColor": string,
    "backgroundColor": string,
    "animation": option<{
      "duration": int,
      "timingFunc": [#linear | #easeIn | #easeOut | #easeInOut],
    }>,
  },
) => promise<unit> = "setNavigationBarColor"

@send
external hideNavigationBarLoading: wx => promise<unit> = "hideNavigationBarLoading"

@send
external hideHomeButton: wx => promise<unit> = "hideHomeButton"

@send
external setBackgroundTextStyle: (wx, {"textStyle": [#dark | #light]}) => promise<unit> =
  "setBackgroundTextStyle"

@send
external setBackgroundColor: (
  wx,
  {
    "backgroundColor": string,
    "backgroundColorTop": option<string>,
    "backgroundColorBottom": option<string>,
  },
) => promise<unit> = "setBackgroundColor"

@send
external showTabBarRedDot: (wx, {"index": int}) => promise<unit> = "showTabBarRedDot"

@send
external showTabBar: (wx, {"animation": option<bool>}) => promise<unit> = "showTabBar"

@send
external setTabBarStyle: (
  wx,
  {
    "color": string,
    "selectedColor": string,
    "backgroundColor": string,
    "borderStyle": [#black | #white],
  },
) => promise<unit> = "setTabBarStyle"

@send
external setTabBarItem: (
  wx,
  {
    "index": int,
    "text": option<string>,
    "iconPath": option<string>,
    "selectedIconPath": option<string>,
  },
) => promise<unit> = "setTabBarItem"

@send
external setTabBarBadge: (wx, {"index": int, "text": string}) => promise<unit> = "setTabBarBadge"

@send
external removeTabBarBadge: (wx, {"index": int}) => promise<unit> = "removeTabBarBadge"

@send
external hideTabBarRedDot: (wx, {"index": int}) => promise<unit> = "hideTabBarRedDot"

@send
external hideTabBar: (wx, {"animation": option<bool>}) => promise<unit> = "hideTabBar"

@send
external loadFontFace: (
  wx,
  {
    "global": option<bool>,
    "family": string,
    "source": string,
    "desc": {"style": string, "weight": string, "variant": string},
    "scopes": array<[#webview | #native]>,
  },
) => promise<{..}> = "loadFontFace"

@send
external stopPullDownRefresh: wx => promise<unit> = "stopPullDownRefresh"

@send
external startPullDownRefresh: wx => promise<unit> = "startPullDownRefresh"

type scrollOptions = {
  scrollTop?: int,
  duration?: int,
  selector?: string,
  offsetTop?: int,
}

@send external pageScrollTo: (wx, scrollOptions) => promise<unit> = "pageScrollTo"

module ScrollViewContext = {
  type t
  type scrollToOptions = {
    top?: int,
    left?: int,
    velocity?: int,
    duration?: int,
    animated?: bool,
  }

  @send external scrollIntoView: (t, string) => unit = "scrollIntoView"

  @send external scrollTo: (t, scrollToOptions) => unit = "scrollTo"
}

module Animation = {
  type t
  type animationOptions = {
    duration?: int,
    timingFunction?: [
      | #linear
      | #ease
      | #"ease-in"
      | #"ease-out"
      | #"ease-in-out"
      | #"step-start"
      | #"step-end"
    ],
    delay?: int,
    transformOrigin?: string,
  }

  @send external make: wx => (t, animationOptions) = "createAnimation"

  @send external setBackgroundColor: (t, string) => t = "backgroundColor"

  @set external setTop: (t, int) => t = "top"

  @send external setBottom: (t, int) => t = "bottom"

  @send external export: t => {..} = "export"

  @send external setHeight: (t, int) => t = "height"

  @send external setLeft: (t, int) => t = "left"

  @send external setRight: (t, int) => t = "right"

  @send @variadic external setMatrix: (t, array<int>) => t = "matrix"

  @send @variadic external setMatrix3d: (t, array<int>) => t = "matrix3d"

  @send external setOpacity: (t, int) => t = "opacity"

  @send external setRotate: (t, int) => t = "rotate"

  @send
  external setRotate3d: (t, ~x: int=?, ~y: int=?, ~z: int=?, ~angle: int=?, unit) => t = "rotate3d"

  @send external setRotateX: (t, int) => t = "rotateX"
  @send external setRotateY: (t, int) => t = "rotateY"
  @send external setRotateZ: (t, int) => t = "rotateZ"

  @send external setScale: (t, float, float) => t = "scale"
  @send external setScale3d: (t, float, float, float) => t = "scale3d"
  @send external setScaleX: (t, float) => t = "scaleX"
  @send external setScaleY: (t, float) => t = "scaleY"
  @send external setScaleZ: (t, float) => t = "scaleZ"

  @send external setSkew: (t, int, int) => t = "skew"
  @send external setSkewX: (t, int) => t = "skewX"
  @send external setSkewY: (t, int) => t = "skewY"

  @send external setStep: (t, animationOptions) => t = "step"

  @send external setTranslate: (t, int, int) => t = "translate"
  @send external setTranslate3d: (t, int, int, int) => t = "translate3d"
  @send external setTranslateX: (t, int) => t = "translateX"
  @send external setTranslateY: (t, int) => t = "translateY"
  @send external setTranslateZ: (t, int) => t = "translateZ"

  @send external setWidth: (t, int) => t = "width"
}

@send external setTopBarText: (wx, {"text": string}) => promise<unit> = "setTopBarText"

@send external nextTick: (wx, unit => unit) => unit = "nextTick"

type boudingClientRect = {
  width: int,
  height: int,
  top: int,
  right: int,
  bottom: int,
  left: int,
}
@send
external getMenuButtonBoundingClientRect: wx => boudingClientRect =
  "getMenuButtonBoundingClientRect"

@send
external setWindowSize: (
  wx,
  {
    "width": int,
    "height": int,
    "success": unit => unit,
    "fail": option<unit => unit>,
    "complete": option<unit => unit>,
  },
) => unit = "setWindowSize"

@send
external onWindowResize: (wx, {"windowWidth": int, "windowHeight": int} => unit) => unit =
  "onWindowResize"

@send
external offWindowResize: (wx, option<{"windowWidth": int, "windowHeight": int} => unit>) => unit =
  "offWindowResize"

@send
external checkIsPictureInPictureActive: wx => bool = "checkIsPictureInPictureActive"

module Worklet = {
  type t
  type sharedValue
  type derived

  @val external getWorklet: wx => t = "worklet"

  @send external cancelAnimation: (t, sharedValue) => unit = "cancelAnimation"

  @val external getDerived: t => derived = "derived"

  @val external getSharedValue: t => sharedValue = "shared"
}
