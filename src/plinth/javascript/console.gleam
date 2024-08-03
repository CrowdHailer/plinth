//// This module aims to replicate the
//// [Console API](https://developer.mozilla.org/en-US/docs/Web/API/Console_API)

/// Outputs a message to the console.
@external(javascript, "../../console_ffi.mjs", "log")
pub fn log(value: a) -> Nil

/// Outputs a message to the console with the warning log level.
@external(javascript, "../../console_ffi.mjs", "warn")
pub fn warn(value: a) -> Nil

/// Outputs a message to the console with the error log level.
@external(javascript, "../../console_ffi.mjs", "error")
pub fn error(value: a) -> Nil

/// Outputs a message to the console with the info log level.
@external(javascript, "../../console_ffi.mjs", "info")
pub fn info(value: a) -> Nil

/// Outputs a message to the console with the debug log level.
@external(javascript, "../../console_ffi.mjs", "debug")
pub fn debug(value: a) -> Nil
