import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}

pub type SerialPort

// https://developer.mozilla.org/en-US/docs/Web/API/Serial/requestPort
@external(javascript, "../../serial_ffi.mjs", "requestPort")
pub fn request_port() -> Promise(Result(SerialPort, Nil))

// https://developer.mozilla.org/en-US/docs/Web/API/Serial/getPorts
@external(javascript, "../../serial_ffi.mjs", "getPorts")
pub fn get_ports() -> Promise(Result(Array(SerialPort), Nil))

// https://developer.mozilla.org/en-US/docs/Web/API/SerialPort/getInfo
@external(javascript, "../../serial_ffi.mjs", "getInfo")
pub fn get_info(port: SerialPort) -> Result(#(Int, Int), Nil)

// https://developer.mozilla.org/en-US/docs/Web/API/SerialPort/open
@external(javascript, "../../serial_ffi.mjs", "open")
pub fn open(port: SerialPort, baud_rate: Int) -> Promise(Result(Nil, Nil))

// https://developer.mozilla.org/en-US/docs/Web/API/SerialPort#reading_data_from_a_port
@external(javascript, "../../serial_ffi.mjs", "read")
pub fn read(
  port: SerialPort,
  callback: fn(BitArray) -> Nil,
) -> Promise(Result(Nil, Nil))
