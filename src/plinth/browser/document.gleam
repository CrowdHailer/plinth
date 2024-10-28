import gleam/javascript/array.{type Array}
import plinth/browser/element.{type Element}
import plinth/browser/event.{type Event}

@external(javascript, "../../document_ffi.mjs", "querySelector")
pub fn query_selector(selector: String) -> Result(Element, Nil)

@external(javascript, "../../document_ffi.mjs", "querySelectorAll")
pub fn query_selector_all(selector: String) -> Array(Element)

@external(javascript, "../../document_ffi.mjs", "addEventListener")
pub fn add_event_listener(type_: String, listener: fn(Event(t)) -> Nil) -> Nil

@external(javascript, "../../document_ffi.mjs", "createElement")
pub fn create_element(tag_name: String) -> Element

@external(javascript, "../../document_ffi.mjs", "createTextNode")
pub fn create_text_node(content: String) -> Element

@external(javascript, "../../document_ffi.mjs", "body")
pub fn body() -> Element

@external(javascript, "../../document_ffi.mjs", "getElementById")
pub fn get_element_by_id(id: String) -> Result(Element, Nil)

@external(javascript, "../../document_ffi.mjs", "getElementsByTagName")
pub fn get_elements_by_tag_name(tag_name: String) -> Array(Element)

@external(javascript, "../../document_ffi.mjs", "readyState")
pub fn ready_state() -> String

/// Get the [`hidden`](https://developer.mozilla.org/en-US/docs/Web/API/Document/hidden)
/// attribute value of the current document
@external(javascript, "../../document_ffi.mjs", "hidden")
pub fn hidden() -> Bool

/// Get the [`visibilityState`](https://developer.mozilla.org/en-US/docs/Web/API/Document/visibilityState)
/// attribute value of the current document. It should be either `"visible"` or `"hidden"`.
@external(javascript, "../../document_ffi.mjs", "visibilityState")
pub fn visibility_state() -> String

/// Get the [`title`](https://developer.mozilla.org/en-US/docs/Web/API/Document/title)
/// attribute value of the current document.
@external(javascript, "../../document_ffi.mjs", "title")
pub fn title() -> String

/// Set the [`title`](https://developer.mozilla.org/en-US/docs/Web/API/Document/title)
/// attribute value of the current document.
@external(javascript, "../../document_ffi.mjs", "setTitle")
pub fn set_title(title: String) -> Nil
