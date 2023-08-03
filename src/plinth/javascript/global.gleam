// should this be called window?

@external(javascript, "../../global_ffi.mjs", "setTimeout")
pub fn set_timeout(callback: fn(Nil) -> Nil, delay: Int) -> Nil
