import gleam/javascript/array.{type Array}
import plinth/browser/element.{type Element}
import plinth/browser/event.{type Event}

@external(javascript, "../../document_ffi.mjs", "querySelector")
pub fn query_selector(selector: String) -> Result(Element, Nil)

@external(javascript, "../../document_ffi.mjs", "querySelectorAll")
pub fn query_selector_all(selector: String) -> Array(Element)

@external(javascript, "../../document_ffi.mjs", "addEventListener")
pub fn add_event_listener(type_: String, listener: fn(Event) -> Nil) -> Nil

@external(javascript, "../../document_ffi.mjs", "createElement")
pub fn create_element(tag_name: String) -> Element

@external(javascript, "../../document_ffi.mjs", "createTextNode")
pub fn create_text_node(content: String) -> Element

@external(javascript, "../../document_ffi.mjs", "body")
pub fn body() -> Element
