type wx = WxCommon.wx

type successResp

type pluginPaymentParams<'a, 'b> = {
  version: [#develop | #trail | #release],
  fee: float,
  paymentArgs: Js.Dict.t<string>,
  currencyType?: string,
  success?: 'a => unit,
  fail?: 'b => unit,
  complete?: unit => unit,
}

@send
external requestPluginPayment: (wx, pluginPaymentParams<'a, 'b>) => unit = "requestPluginPayment"

type paymentParams = {
  timeStamp: string,
  nonceStr: string,
  package: string,
  signType?: string,
  paySign: string,
}

@send
external requestPayment: (wx, paymentParams) => promise<{..}> = "requestPayment"