import gleam/dynamic.{type Dynamic, DecodeError}
import gleam/javascript/promise.{type Promise}
import plinth/browser/event.{type Event}

pub type Element

@external(javascript, "../../element_ffi.mjs", "cast")
fn do_cast(raw: Dynamic) -> Result(Element, Nil)

pub fn cast(raw) {
  case do_cast(raw) {
    Ok(element) -> Ok(element)
    Error(Nil) -> Error(DecodeError("Element", dynamic.classify(raw), []))
  }
}

@external(javascript, "../../element_ffi.mjs", "addEventListener")
pub fn add_event_listener(
  a: Element,
  b: String,
  c: fn(Event(t)) -> Nil,
) -> fn() -> Nil

@external(javascript, "../../element_ffi.mjs", "getAttribute")
pub fn get_attribute(element: Element, name: String) -> Result(String, Nil)

@external(javascript, "../../element_ffi.mjs", "setAttribute")
pub fn set_attribute(element: Element, name: String, value: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "setInnerHTML")
pub fn set_inner_html(element: Element, value: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "setInnerText")
pub fn set_inner_text(element: Element, value: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "innerText")
pub fn inner_text(element: Element) -> String

pub type Position {
  BeforeBegin
  AfterBegin
  BeforeEnd
  AfterEnd
}

fn position_to_string(position) {
  case position {
    BeforeBegin -> "beforebegin"
    AfterBegin -> "afterbegin"
    BeforeEnd -> "beforeend"
    AfterEnd -> "afterend"
  }
}

@external(javascript, "../../element_ffi.mjs", "insertAdjacentElement")
fn do_insert_adjacent_element(
  target: Element,
  position: String,
  element: Element,
) -> Result(Element, String)

pub fn insert_adjacent_element(
  target: Element,
  position: Position,
  element: Element,
) -> Result(Element, String) {
  let position = position_to_string(position)
  do_insert_adjacent_element(target, position, element)
}

@external(javascript, "../../element_ffi.mjs", "insertAdjacentHTML")
fn do_insert_adjacent_html(
  target: Element,
  position: String,
  html: String,
) -> Result(Element, String)

pub fn insert_adjacent_html(
  target: Element,
  position: Position,
  html: String,
) -> Result(Element, String) {
  let position = position_to_string(position)
  do_insert_adjacent_html(target, position, html)
}

@external(javascript, "../../element_ffi.mjs", "insertAdjacentText")
fn do_insert_adjacent_text(
  target: Element,
  position: String,
  text: String,
) -> Result(Element, String)

pub fn insert_adjacent_text(
  target: Element,
  position: Position,
  text: String,
) -> Result(Element, String) {
  let position = position_to_string(position)
  do_insert_adjacent_text(target, position, text)
}

@external(javascript, "../../element_ffi.mjs", "nextElementSibling")
pub fn next_element_sibling(element: Element) -> Result(Element, Nil)

@external(javascript, "../../element_ffi.mjs", "closest")
pub fn closest(element: Element, selector: String) -> Result(Element, Nil)

@external(javascript, "../../element_ffi.mjs", "requestFullscreen")
pub fn request_fullscreen(element: Element) -> Promise(Result(Nil, String))

@external(javascript, "../../element_ffi.mjs", "scrollIntoView")
pub fn scroll_into_view(element: Element) -> Nil

@external(javascript, "../../element_ffi.mjs", "scrollHeight")
pub fn scroll_height(element: Element) -> Float

@external(javascript, "../../element_ffi.mjs", "scrollLeft")
pub fn scroll_left(element: Element) -> Float

@external(javascript, "../../element_ffi.mjs", "scrollTop")
pub fn scroll_top(element: Element) -> Float

@external(javascript, "../../element_ffi.mjs", "scrollWidth")
pub fn scroll_width(element: Element) -> Float

@external(javascript, "../../element_ffi.mjs", "setScrollHeight")
pub fn set_scroll_height(element: Element, value: Float) -> Nil

@external(javascript, "../../element_ffi.mjs", "setScrollLeft")
pub fn set_scroll_left(element: Element, value: Float) -> Nil

@external(javascript, "../../element_ffi.mjs", "setScrollTop")
pub fn set_scroll_top(element: Element, value: Float) -> Nil

@external(javascript, "../../element_ffi.mjs", "setScrollWidth")
pub fn set_scroll_width(element: Element, value: Float) -> Nil

@external(javascript, "../../element_ffi.mjs", "appendChild")
pub fn append_child(parent: Element, child: Element) -> Nil

@external(javascript, "../../element_ffi.mjs", "remove")
pub fn remove(a: Element) -> Nil

@external(javascript, "../../element_ffi.mjs", "datasetGet")
pub fn dataset_get(element: Element, key: String) -> Result(String, Nil)

// HTMLDataElement
@external(javascript, "../../element_ffi.mjs", "value")
pub fn value(element: Element) -> Result(String, Nil)

@external(javascript, "../../element_ffi.mjs", "setValue")
pub fn set_value(element: Element, value: String) -> Nil

// Inputs
@external(javascript, "../../element_ffi.mjs", "focus")
pub fn focus(element: Element) -> Nil

@external(javascript, "../../element_ffi.mjs", "selectionStart")
pub fn selection_start(element: Element) -> Result(Int, Nil)

@external(javascript, "../../element_ffi.mjs", "setSelectionRange")
pub fn set_selection_range(element: Element, start: Int, end: Int) -> Nil

@external(javascript, "../../element_ffi.mjs", "setTextContent")
pub fn set_text_content(element: Element, text: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "getChecked")
pub fn get_checked(element: Element) -> Bool
