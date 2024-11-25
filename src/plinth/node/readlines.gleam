import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}

pub type PromiseInterface

@external(javascript, "../../plinth_node_readlines_ffi.mjs", "createInterface")
pub fn create_interface(
  completer: fn(String) -> #(Array(String), String),
  history: Array(String),
) -> PromiseInterface

@external(javascript, "../../plinth_node_readlines_ffi.mjs", "question")
pub fn question(interface: PromiseInterface, prompt: String) -> Promise(String)

@external(javascript, "../../plinth_node_readlines_ffi.mjs", "close")
pub fn close(interface: PromiseInterface) -> Promise(String)
