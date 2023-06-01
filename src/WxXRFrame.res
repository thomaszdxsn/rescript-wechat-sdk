type arTrackerState = [@as(0) #init | @as(1) #detecting | @as(2) #detected | @as(3) #error]

type animationBlendType = [@as(0) #override | @as(1) #additive]

type blendEquation = [
  | @as(0) #funcAdd
  | @as(1) #subtract
  | @as(2) #funcSubtract
  | @as(3) #min
  | @as(4) #max
]

// TODO...
// [Enumeration: EBlendFactor | 微信开放文档](https://developers.weixin.qq.com/miniprogram/dev/api/xr-frame/enums/EBlendFactor.html)