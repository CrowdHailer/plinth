import gleam/dynamic.{type Dynamic}

pub type Event

// event only knows about event target not Element/Document etc
@external(javascript, "../../event_ffi.mjs", "target")
pub fn target(event: Event) -> Dynamic
