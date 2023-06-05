type wx = WxCommon.wx

@send external stopLocationUpdate: wx => promise<{..}> = "stopLocationUpdate"

@send
external startLocationUpdateBackground: (wx, {"type": string}) => promise<{..}> =
  "startLocationUpdateBackground"

@send external startLocationUpdate: (wx, {"type": string}) => promise<{..}> = "startLocationUpdate"

@send
external openLocation: (
  wx,
  {
    "latitude": float,
    "longitude": float,
    "scale": option<int>,
    "name": option<string>,
    "address": option<string>,
  },
) => promise<{..}> = "openLocation"

@send
external onLocationChangeError: (wx, {"errCode": int} => unit) => unit = "onLocationChangeError"
@send
external offLocationChangeError: (wx, {"errCode": int} => unit) => unit = "offLocationChangeError"

@send external onLocationChange: (wx, {"latitude": float, "longitude": float} => unit) => unit =
  "onLocationChange"
@send external offLocationChange: (wx, {"latitude": float, "longitude": float} => unit) => unit =
  "offLocationChange"

@send external getLocation: wx => promise<{..}> = "getLocation"
@send external getFuzzyLocation: wx => promise<{..}> = "getFuzzyLocation"

@send external choosePoint: (wx, {..}) => promise<{..}> = "choosePoint"
@send external chooseLocation: (wx, {..}) => promise<{..}> = "chooseLocation"