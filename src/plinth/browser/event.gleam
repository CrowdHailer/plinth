import plinth/browser/element.{type Element}

pub type Event

pub type KeyboardEvent {
  KeyboardEvent(
    event: Event,
    alt_key: Bool,
    code: String,
    ctrl_key: Bool,
    is_composing: Bool,
    key: String,
    location: Int,
    meta_key: Bool,
    repeat: Bool,
    shift_key: Bool,
  )
}

@external(javascript, "../../event_ffi.mjs", "constructorName")
fn constructor_name(value: a) -> String

@external(javascript, "../../event_ffi.mjs", "toKeyboardEventUnsafe")
fn to_keyboard_event_unsafe(event: Event) -> KeyboardEvent

pub fn as_keyboard_event(event: Event) -> Result(KeyboardEvent, Nil) {
  case constructor_name(event) {
    "KeyboardEvent" -> Ok(to_keyboard_event_unsafe(event))
    _ -> Error(Nil)
  }
}

@external(javascript, "../../event_ffi.mjs", "target")
pub fn target(event: Event) -> Element
