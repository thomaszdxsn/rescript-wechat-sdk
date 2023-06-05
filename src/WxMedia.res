type wx = WxCommon.wx

module MapContext = {
  type t

  @send
  external createMapContext: (string, {..}) => t = "createMapContext"

  @send
  external addArc: (
    t,
    {
      "id": int,
      "start": {"latitude": float, "longitude": float},
      "end": {"latitude": float, "longitude": float},
      "pass": option<{
        "latitude": float,
        "longitude": float,
      }>,
      "angle": option<float>,
      "width": option<float>,
      "color": option<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addArc"

  @send
  external addCustomLayer: (
    t,
    {
      "layerId": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addCustomLayer"

  @send
  external addGroundOverlay: (
    t,
    {
      "id": int,
      "src": string,
      "bounds": {
        "southwest": {"latitude": float, "longitude": float},
        "northeast": {"latitude": float, "longitude": float},
      },
      "visible": option<bool>,
      "zIndex": option<int>,
      "opacity": option<float>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addGroundOverlay"

  @send
  external addMarkers: (
    t,
    {
      "markers": array<string>,
      "clear": option<bool>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addMarkers"

  @send
  external addVisualLayer: (
    t,
    {
      "layerId": string,
      "interval": option<int>,
      "zIndex": option<int>,
      "opacity": option<float>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "addVisualLayer"

  @send
  external eraseLines: (
    t,
    {
      "lines": array<{
        "id": int,
        "index": int,
        "point": option<{
          "latitude": float,
          "longitude": float,
        }>,
        "clear": option<bool>,
      }>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "eraseLines"

  @send
  external executeVisualLayerCommand: (
    t,
    {
      "layerId": string,
      "cmd": string,
      "args": array<string>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "executeVisualLayerCommand"

  @send
  external fromScreenLocation: (
    t,
    {
      "x": float,
      "y": float,
      "success": option<{"latitude": float, "longitude": float} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "fromScreenLocation"

  @send
  external getCenterLocation: (
    t,
    {
      "iconPath": option<string>,
      "success": option<{"latitude": float, "longitude": float} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getCenterLocation"

  @send
  external getRegion: (
    t,
    {
      "success": option<
        {
          "southwest": {"latitude": float, "longitude": float},
          "northeast": {"latitude": float, "longitude": float},
        } => unit,
      >,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getRegion"

  @send
  external getRotate: (
    t,
    {
      "success": option<float => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getRotate"

  @send
  external getScale: (
    t,
    {
      "success": option<float => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getScale"

  @send
  external getSkew: (
    t,
    {
      "success": option<float => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "getSkew"

  @send
  external includePoints: (
    t,
    {
      "points": array<{
        "latitude": float,
        "longitude": float,
      }>,
      "padding": option<array<string>>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "includePoints"

  @send
  external initMarkerCluster: (
    t,
    {
      "enableDefaultStyle": option<bool>,
      "zoomOnClick": option<bool>,
      "gridSize": option<int>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "initMarkerCluster"

  @send
  external moveAlong: (
    t,
    {
      "markerId": int,
      "path": array<{
        "latitude": float,
        "longitude": float,
      }>,
      "duration": int,
      "autoRotate": option<bool>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "moveAlong"

  @send
  external moveToLocation: (
    t,
    {
      "latitude": float,
      "longitude": float,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "moveToLocation"

  @send
  external on: (t, string, {..} => unit) => unit = "on"

  @send
  external openMapApp: (
    t,
    {
      "latitude": float,
      "longitude": float,
      "destination": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "openMapApp"

  @send
  external removeArc: (
    t,
    {
      "id": int,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeArc"

  @send
  external removeCustomLayer: (
    t,
    {
      "layerId": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeCustomLayer"

  @send
  external removeGroundOverlay: (
    t,
    {
      "id": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeGroundOverlay"

  @send
  external removeMarkers: (
    t,
    {
      "markerIds": array<string>,
      "clear": option<bool>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeMarkers"

  @send
  external removeVisualLayer: (
    t,
    {
      "layerId": string,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeVisualLayer"

  @send
  external setBoundary: (
    t,
    {
      "southwest": {"latitude": float, "longitude": float},
      "northeast": {"latitude": float, "longitude": float},
      "success": unit => unit,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "setBoundary"

  @send
  external setCenterOffset: (
    t,
    {
      "offset": array<int>,
      "success": unit => unit,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "setCenterOffset"

  @send
  external setLocMarkerIcon: (
    t,
    {
      "iconPath": string,
      "success": unit => unit,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "setLocMarkerIcon"

  @send
  external toScreenLocation: (
    t,
    {
      "latitude": float,
      "longitude": float,
      "success": option<{"x": float, "y": float} => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "toScreenLocation"

  @send
  external translateMarker: (
    t,
    {
      "markerId": int,
      "destination": {"latitude": float, "longitude": float},
      "autoRotate": option<bool>,
      "rotate": option<float>,
      "duration": option<int>,
      "moveWithRotate": option<bool>,
      "animationEnd": option<unit => unit>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "translateMarker"

  @send
  external uupdateGroundOverlay: (
    t,
    {
      "id": string,
      "src": string,
      "bounds": option<{
        "southwest": {"latitude": float, "longitude": float},
        "northeast": {"latitude": float, "longitude": float},
      }>,
      "visible": option<bool>,
      "zIndex": option<int>,
      "opacity": option<float>,
      "success": option<unit => unit>,
      "fail": option<unit => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "updateGroundOverlay"
}

// 「媒体 - 图片」
@send
external saveImageToPhotosAlbum: (wx, {"filePath": string}) => promise<{..}> =
  "saveImageToPhotosAlbum"

@send
external previewMedia: (
  wx,
  {
    "current": int,
    "sources": array<{
      "url": string,
      "type": [#image | #video],
      "poster": option<string>,
    }>,
    "shoowmenu": option<bool>,
    "referrerPolicy": option<string>,
  },
) => promise<{..}> = "previewMedia"

@send
external previewImage: (
  wx,
  {
    "current": int,
    "urls": array<string>,
    "showmenu": option<bool>,
    "referrerPolicy": option<string>,
  },
) => promise<{..}> = "previewImage"

@send
external getImageInfo: (
  wx,
  {"src": string},
) => promise<{
  "width": int,
  "height": int,
  "path": string,
  "orientation": string,
  "type": string,
}> = "getImageInfo"

@send
external editImage: (wx, {"src": string}) => promise<{"tempFilePath": string}> = "editImage"

@send
external cropImage: (
  wx,
  {"src": string, "cropScale": [#"16:9" | #"9:16" | #"4:3" | #"3:4" | #"5:4" | #"4:5" | #"1:1"]},
) => promise<{
  "tempFilePath": string,
}> = "cropImage"

@send
external compressImage: (
  wx,
  {
    "src": string,
    "quality": option<int>,
    "compressedWidth": option<int>,
    "compressedHeight": option<int>,
  },
) => promise<{
  "tempFilePath": string,
}> = "compressImage"

@send
external chooseMessageFile: (
  wx,
  {
    "count": int,
    "type": option<[#all | #video | #image | #file]>,
    "extension": option<array<string>>,
  },
) => promise<{
  "tempFiles": array<{
    "path": string,
    "size": int,
    "name": string,
    "type": string,
  }>,
}> = "chooseMessageFile"

@send
external chooseImage: (
  wx,
  {
    "count": option<int>,
    "sourceType": option<[#"album" | #"camera"]>,
    "sizeType": option<[#"original" | #"compressed"]>,
  },
) => promise<{
  "tempFilePaths": array<string>,
  "tempFiles": array<{
    "path": string,
    "size": int,
  }>,
}> = "chooseImage"