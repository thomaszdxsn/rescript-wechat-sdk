type ws = WxCommon.wx

type shareMenuOptions = {
  withShareTicket: bool,
  isUpdatableMessage: bool,
  activityId?: string,
  toDoActivityId?: string,
  templateInfo?: {"parameterList": array<{"name": string, "value": string}>},
  isPrivateMessage?: bool,
}

@send
external updateShareMenu: (ws, shareMenuOptions) => promise<unit> = "updateShareMenu"

@send
external showShareMenu: (
  ws,
  {"withShareTicket": option<bool>, "menus": option<array<string>>},
) => promise<{..}> = "showShareMenu"

@send
external showShareImageMenu: (ws, {"path": string}) => promise<{..}> = "showShareImageMenu"

@send
external shareVideoMessage: (
  ws,
  {"videoPath": string, "thumbPath": option<string>},
) => promise<{..}> = "shareVideoMessage"

@send
external shareFileMessage: (ws, {"filePath": string, "fileName": string}) => promise<{..}> =
  "shareFileMessage"

@send
external onCopyUrl: (ws, {"query": string} => unit) => unit = "onCopyUrl"

@send
external offCopyUrl: ws => unit = "offCopyUrl"

@send
external hideShareMenu: (ws, {"menus": array<string>}) => promise<{..}> = "hideShareMenu"

@send
external getShareInfo: (ws, {"shareTicket": string, "timeout": option<int>}) => promise<{..}> =
  "getShareInfo"

@send
external authPrivateMessage: (ws, {"shareTicket": string}) => promise<{..}> = "authPrivateMessage"