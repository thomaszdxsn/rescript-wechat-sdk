type wx = WxCommon.wx

@send
external saveFileToDisk: (
  wx,
  {
    "filePath": string,
    "success": {..} => unit,
    "fail": option<{..} => unit>,
    "complete": option<{..} => unit>,
  },
) => unit = "saveFileToDisk"

@send
external openDocument: (
  wx,
  {
    "filePath": string,
    "showMenu": option<bool>,
    "fileType": option<[#doc | #docx | #xls | #xlsx | #ppt | #pptx | #pdf]>,
  },
) => promise<{..}> = "openDocument"

module Stats = {
  type t

  @get external getMode: t => string = "mode"
  @get external getSize: t => int = "size"
  @get external getAtime: t => int = "lastAccessedTime"
  @get external getMtime: t => int = "lastModifiedTime"

  @send external isDirectory: t => bool = "isDirectory"
  @send external isFile: t => bool = "isFile"
}

module FileSystemManager = {
  type t

  @send external getFileSystemManager: wx => t = "getFileSystemManager"

  @send
  external access: (
    t,
    {
      "path": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "access"

  @send
  external appendFile: (
    t,
    {
      "filePath": string,
      "data": @unwrap [#String(string) | #ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)],
      "encoding": option<[#ascii | #base64 | #binary | #hex | #ucs2 | #utf16le | #utf8]>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "appendFile"

  @send
  external close: (
    t,
    {
      "fd": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "close"

  @send
  external copyFile: (
    t,
    {
      "srcPath": string,
      "destPath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "copyFile"

  @send
  external fstat: (
    t,
    {
      "fd": string,
      "success": Stats.t => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "fstat"

  @send
  external fruncate: (
    t,
    {
      "fd": string,
      "length": int,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "fruncate"

  @send
  external getFileInfo: (
    t,
    {
      "filePath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "getFileInfo"

  @send
  external mkdir: (
    t,
    {
      "dirPath": string,
      "recursive": option<bool>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "mkdir"

  @send
  external open_: (
    t,
    {
      "filePath": string,
      "flags": option<[#r | #"r+" | #w | #"w+" | #a | #"a+"]>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "open"

  @send
  external read: (
    t,
    {
      "fd": string,
      "arrayBuffer": Js.TypedArray2.ArrayBuffer.t,
      "offset": option<int>,
      "length": option<int>,
      "position": option<int>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "read"

  @send
  external readCompressedFile: (
    t,
    {
      "filePath": string,
      "compressionAlgorithm": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "readCompressedFile"

  @send
  external readdir: (
    t,
    {
      "dirPath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "readdir"

  @send
  external readFile: (
    t,
    {
      "filePath": string,
      "encoding": option<[#ascii | #base64 | #binary | #hex | #ucs2 | #utf16le | #utf8]>,
      "position": option<int>,
      "length": option<int>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<{..} => unit>,
    },
  ) => unit = "readFile"

  @send
  external readZipEntry: (
    t,
    {
      "filePath": string,
      "encoding": option<string>,
      "entries": array<{
        "path": string,
        "encoding": option<string>,
        "position": option<int>,
        "length": option<int>,
      }>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "readZipEntry"

  @send
  external removeSavedFile: (
    t,
    {
      "filePath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "removeSavedFile"

  @send
  external rename: (
    t,
    {
      "oldPath": string,
      "newPath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "rename"

  @send
  external rmdir: (
    t,
    {
      "dirPath": string,
      "recursive": option<bool>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "rmdir"

  @send
  external saveFile: (
    t,
    {
      "tempFilePath": string,
      "filePath": option<string>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "saveFile"

  @send
  external stat: (
    t,
    {
      "path": string,
      "recursive": option<bool>,
      "success": Stats.t => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "stat"

  @send
  external truncate: (
    t,
    {
      "filePath": string,
      "length": option<int>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "truncate"

  @send
  external unlink: (
    t,
    {
      "filePath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "unlink"

  @send
  external unzip: (
    t,
    {
      "zipFilePath": string,
      "targetPath": string,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    },
  ) => unit = "unzip"

  @send
  external write: (
    t,
    {
      "fd": string,
      "data": @unwrap [#String(string) | #ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)],
      "offset": option<int>,
      "length": option<int>,
      "position": option<int>,
      "encoding": option<[#ascii | #base64 | #binary | #hex | #ucs2 | #utf16le | #utf8]>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    }
  ) => unit = "write"

  @send
  external writeFile: (
    t,
    {
      "filePath": string,
      "data": @unwrap [#String(string) | #ArrayBuffer(Js.TypedArray2.ArrayBuffer.t)],
      "encoding": option<[#ascii | #base64 | #binary | #hex | #ucs2 | #utf16le | #utf8]>,
      "success": {..} => unit,
      "fail": option<{..} => unit>,
      "complete": option<unit => unit>,
    }
  ) => unit = "writeFile"
}
