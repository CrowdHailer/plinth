import gleam/dynamic.{type Dynamic, DecodeError}

pub type Event

@external(javascript, "../../event_ffi.mjs", "cast")
fn do_cast(raw: Dynamic) -> Result(Event, Nil)

pub fn cast(raw) {
  case do_cast(raw) {
    Ok(event) -> Ok(event)
    Error(Nil) -> Error(DecodeError("Event", dynamic.classify(raw), []))
  }
}

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
