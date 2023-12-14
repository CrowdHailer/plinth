import plinth/browser/element.{type Element}

pub type Event

@external(javascript, "../../event_ffi.mjs", "target")
pub fn target(event: Event) -> Element
