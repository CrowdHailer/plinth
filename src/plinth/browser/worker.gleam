import gleam/json.{type Json}

pub type Worker

@external(javascript, "../../worker_ffi.mjs", "newWorker")
pub fn new(script: String) -> Result(Worker, String)

@external(javascript, "../../worker_ffi.mjs", "postMessage")
pub fn post_message(worker: Worker, message: Json) -> Nil

@external(javascript, "../../worker_ffi.mjs", "onMessage")
pub fn on_message(worker: Worker, handle: fn(Json) -> Nil) -> Nil
