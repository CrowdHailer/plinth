import gleam/javascript/promise.{type Promise}

@external(javascript, "../../clipboard_ffi.mjs", "readText")
pub fn read_text() -> Promise(Result(String, String))

@external(javascript, "../../clipboard_ffi.mjs", "writeText")
pub fn write_text(clip_text: String) -> Promise(Result(Nil, String))
