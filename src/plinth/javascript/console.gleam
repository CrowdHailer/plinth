// part of global but separate because it's nicer to type console.log

@external(javascript, "../../global_ffi.mjs", "log")
pub fn log(value: a) -> Nil
