type wx = WxCommon.wx

module Component = {
  type t
}

module NodesRef = {
  type t

  @send
  external boundingClientRect: (
    t,
    {
      "id": string,
      "dataset": {..},
      "left": int,
      "right": int,
      "top": int,
      "bottom": int,
      "width": int,
      "height": int,
    } => unit,
  ) => unit = "boundingClientRect"

  @send
  external context: (t, {..} => unit) => unit = "context"
}
module SelectorQuery = {
  type t

  @send
  external createSelectorQuery: wx => t = "createSelectorQuery"

  @send
  external exec: (t, unit => NodesRef.t) => unit = "exec"

  @send external in_: (t, Component.t) => t = "in"

  @send external select: (t, string) => NodesRef.t = "select"

  @send external selectAll: (t, string) => NodesRef.t = "selectAll"

  @send external selectViewport: t => NodesRef.t = "selectViewport"

  @send
  external fields: (NodesRef.t, Js.Dict.t<bool>, {..} => unit) => t = "fields"

  @send external node: (NodesRef.t, {..} => unit) => t = "node"

  @send
  external scrollOffset: (
    NodesRef.t,
    {"id": string, "dataset": {..}, "scrollLeft": int, "scrollTop": int} => unit,
  ) => t = "scrollOffset"
}

module IntersectionObserver = {
  type t

  @send
  external createIntersectionObserver: (
    wx,
    Component.t,
    {"thresholds": option<array<float>>, "initialRatio": option<float>, "observeAll": option<bool>},
  ) => t = "createIntersectionObserver"

  @send external disconnect: t => unit = "disconnect"

  @send
  external observe: (
    t,
    string,
    {
      "id": string,
      "dataset": {..},
      "intersectionRatio": float,
      "intersectionRect": {
        "left": int,
        "right": int,
        "top": int,
        "bottom": int,
        "width": int,
        "height": int,
      },
      "boundingClientRect": {
        "left": int,
        "right": int,
        "top": int,
        "bottom": int,
        "width": int,
        "height": int,
      },
      "relativeRect": {"left": int, "right": int, "top": int, "bottom": int},
      "time": int,
    } => unit,
  ) => unit = "observe"

  @send
  external relativeTo: (
    t,
    string,
    {"left": option<int>, "right": option<int>, "top": option<int>, "bottom": option<int>},
  ) => t = "relativeTo"

  @send
  external relativeToViewport: (
    t,
    {"left": option<int>, "right": option<int>, "top": option<int>, "bottom": option<int>},
  ) => t = "relativeToViewport"
}

module MediaQueryObserver = {
  type t

  @send external disconnect: t => unit = "disconnect"

  @send external observe: (t, {
    "minWidth": int,
    "maxWidth": int,
    "minHeight": int,
    "maxHeight": int,
    "width": int,
    "height": int,
    "orientation": [#landscape | #portrait]
  }, {"matches": bool} => unit) => unit = "observe"
}