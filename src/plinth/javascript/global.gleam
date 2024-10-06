@external(javascript, "../../global_ffi.mjs", "encodeURI")
pub fn encode_uri(a: String) -> String

@external(javascript, "../../global_ffi.mjs", "decodeURI")
pub fn decode_uri(a: String) -> String

@external(javascript, "../../global_ffi.mjs", "decodeURIComponent")
pub fn decode_uri_component(a: String) -> String

pub type TimerID

// https://tc39.es/ecma262/multipage/global-object.html#sec-globalthis
@external(javascript, "../../global_ffi.mjs", "setTimeout")
pub fn set_timeout(delay: Int, callback: fn() -> anything) -> TimerID

@external(javascript, "../../global_ffi.mjs", "clearTimeout")
pub fn clear_timeout(timer: TimerID) -> Nil

@external(javascript, "../../global_ffi.mjs", "setInterval")
pub fn set_interval(delay: Int, callback: fn() -> anything) -> TimerID

@external(javascript, "../../global_ffi.mjs", "clearInterval")
pub fn clear_interval(id: TimerID) -> Nil
