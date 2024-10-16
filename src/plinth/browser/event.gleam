import gleam/dynamic.{type Dynamic, DecodeError}

fn wrap_cast(raw, f) {
  case f(raw) {
    Ok(event) -> Ok(event)
    Error(Nil) -> Error(DecodeError("Event", dynamic.classify(raw), []))
  }
}

pub type Event(sub)

@external(javascript, "../../event_ffi.mjs", "castEvent")
fn do_cast_event(raw: Dynamic) -> Result(Event(Dynamic), Nil)

pub fn cast_event(raw) {
  wrap_cast(raw, do_cast_event)
}

pub type UIEvent(sub)

// event only knows about event target not Element/Document etc
@external(javascript, "../../event_ffi.mjs", "target")
pub fn target(event: Event(t)) -> Dynamic

@external(javascript, "../../event_ffi.mjs", "preventDefault")
pub fn prevent_default(event: Event(t)) -> Nil

@external(javascript, "../../event_ffi.mjs", "stopPropagation")
pub fn stop_propagation(event: Event(t)) -> Nil

pub type KeyboardEvent

@external(javascript, "../../event_ffi.mjs", "castKeyboardEvent")
fn do_cast_keyboard_event(
  raw: Dynamic,
) -> Result(Event(UIEvent(KeyboardEvent)), Nil)

pub fn cast_keyboard_event(raw) {
  wrap_cast(raw, do_cast_keyboard_event)
}

@external(javascript, "../../event_ffi.mjs", "altKey")
pub fn alt_key(event: Event(UIEvent(KeyboardEvent))) -> Bool

@external(javascript, "../../event_ffi.mjs", "code")
pub fn code(event: Event(UIEvent(KeyboardEvent))) -> String

@external(javascript, "../../event_ffi.mjs", "ctrlKey")
pub fn ctrl_key(event: Event(UIEvent(KeyboardEvent))) -> Bool

@external(javascript, "../../event_ffi.mjs", "isComposing")
pub fn is_composing(event: Event(UIEvent(KeyboardEvent))) -> Bool

@external(javascript, "../../event_ffi.mjs", "key")
pub fn key(event: Event(UIEvent(KeyboardEvent))) -> String

@external(javascript, "../../event_ffi.mjs", "metaKey")
pub fn meta_key(event: Event(UIEvent(KeyboardEvent))) -> Bool

@external(javascript, "../../event_ffi.mjs", "shiftKey")
pub fn shift_key(event: Event(UIEvent(KeyboardEvent))) -> Bool
