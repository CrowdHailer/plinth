import gleam/javascript/array.{Array}
import plinth/browser/element.{Element}
import plinth/browser/event.{Event}


@external(javascript, "../../document_ffi.mjs", "querySelector")
pub fn query_selector(selector: String) -> Result(Element, Nil)

@external(javascript, "../../document_ffi.mjs", "querySelectorAll")
pub fn query_selector_all(selector: String) -> Array(Element)

@external(javascript, "../../document_ffi.mjs", "addEventListener")
pub fn add_event_listener(type_: String, listener: fn(Event) -> Nil) -> Nil
