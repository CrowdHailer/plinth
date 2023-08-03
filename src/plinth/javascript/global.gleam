// https://tc39.es/ecma262/multipage/global-object.html#sec-globalthis

@external(javascript, "../../global_ffi.mjs", "setTimeout")
pub fn set_timeout(callback: fn(Nil) -> Nil, delay: Int) -> Nil
