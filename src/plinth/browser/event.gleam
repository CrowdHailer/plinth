import gleam/dynamic.{type Dynamic}

pub type Event

// event only knows about event target not Element/Document etc
@external(javascript, "../../event_ffi.mjs", "target")
pub fn target(event: Event) -> Dynamic

@external(javascript, "../../event_ffi.mjs", "key")
pub fn key(event: Event) -> String

@external(javascript, "../../event_ffi.mjs", "keyCode")
pub fn key_code(event: Event) -> Int

@external(javascript, "../../event_ffi.mjs", "preventDefault")
pub fn prevent_default(event: Event) -> Nil

@external(javascript, "../../event_ffi.mjs", "stopPropagation")
pub fn stop_propagation(event: Event) -> Nil
