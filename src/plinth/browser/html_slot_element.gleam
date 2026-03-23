import gleam/dynamic
import gleam/dynamic/decode.{type Dynamic, DecodeError}
import gleam/javascript/array.{type Array}
import plinth/browser/element.{type Element}

pub type HTMLSlotElement

@external(javascript, "../../html_slot_element_ffi.mjs", "cast")
fn do_cast(raw: Dynamic) -> Result(HTMLSlotElement, Nil)

pub fn cast(raw) {
  case do_cast(raw) {
    Ok(slot) -> Ok(slot)
    Error(Nil) -> Error(DecodeError("Element", dynamic.classify(raw), []))
  }
}

@external(javascript, "../../html_slot_element_ffi.mjs", "assignedElements")
pub fn assigned_elements(slot: HTMLSlotElement) -> Array(Element)
