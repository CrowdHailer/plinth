import gleam/javascript/array.{type Array}
import plinth/javascript/big_int.{type BigInt}

/// Returns an array containing the command-line arguments passed when the Node.js process was launched.
/// The first element will be `process.execPath`.
/// The second element will be the path to the JavaScript file being executed.
/// The remaining elements will be any additional command-line arguments.
@external(javascript, "../../node_process_ffi.mjs", "argv")
pub fn argv() -> Array(String)

/// Returns the current working directory of the Node.js process.
@external(javascript, "process", "cwd")
pub fn cwd() -> String

/// instructs Node.js to terminate the process synchronously with an exit status of `code`.
/// Node.js will not terminate until all the `exit` event listeners are called.
@external(javascript, "process", "exit")
pub fn exit(code code: Int) -> Nil

/// returns the current high-resolution real time in nanoseconds as a bigint
@external(javascript, "process", "hrtime")
pub fn hrtime() -> BigInt
