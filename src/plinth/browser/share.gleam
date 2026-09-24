import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}
import gleam/option.{type Option}
import plinth/browser/file.{type File}

pub type ShareData {
  ShareData(
    title: Option(String),
    text: Option(String),
    url: Option(String),
    files: Option(Array(File)),
  )
}

@external(javascript, "../../share_ffi.mjs", "share")
pub fn share(data: ShareData) -> Promise(Result(Nil, String))

@external(javascript, "../../share_ffi.mjs", "canShare")
pub fn can_share(data: ShareData) -> Bool
