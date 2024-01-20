import gleam/javascript/promise.{type Promise}

pub type MediaStream

@external(javascript, "../../media_capture_ffi.mjs", "getDisplayMedia")
pub fn get_display_media() -> Promise(Result(MediaStream, String))

@external(javascript, "../../media_capture_ffi.mjs", "getUserMedia")
pub fn get_user_media() -> Promise(Result(MediaStream, String))