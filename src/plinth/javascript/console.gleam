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

/// Writes an error message to the console if the assertion is false.
/// If the assertion is true, nothing happens.
@external(javascript, "../../console_ffi.mjs", "assert")
pub fn assert_(assertion: Bool, value: a) -> Nil

/// clears the console if the console allows it. A graphical console,
/// like those running on browsers, will allow it; a console displaying
/// on the terminal, like the one running on Node, will not support it,
/// and will have no effect (and no error).
@external(javascript, "../../console_ffi.mjs", "clear")
pub fn clear() -> Nil
