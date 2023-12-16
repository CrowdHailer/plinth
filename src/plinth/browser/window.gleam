import plinth/browser/event.{type Event}

@external(javascript, "../../window_ffi.mjs", "addEventListener")
pub fn add_event_listener(type_: String, listener: fn(Event) -> Nil) -> Nil
