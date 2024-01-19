@external(javascript, "../../global_ffi.mjs", "encodeURI")
pub fn encode_uri(a: String) -> String

@external(javascript, "../../global_ffi.mjs", "decodeURI")
pub fn decode_uri(a: String) -> String

@external(javascript, "../../global_ffi.mjs", "decodeURIComponent")
pub fn decode_uri_component(a: String) -> String

// https://tc39.es/ecma262/multipage/global-object.html#sec-globalthis
@external(javascript, "../../global_ffi.mjs", "setTimeout")
pub fn set_timeout(callback: fn(Nil) -> Nil, delay: Int) -> Nil
