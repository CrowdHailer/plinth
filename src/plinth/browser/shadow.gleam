import gleam/dynamic
import gleam/dynamic/decode.{type Dynamic, DecodeError}
import gleam/javascript/array.{type Array}
import plinth/browser/element.{type Element}

pub type ShadowRoot

pub type Mode {
  Open
  Closed
}

@external(javascript, "../../shadow_ffi.mjs", "cast")
fn do_cast(raw: Dynamic) -> Result(ShadowRoot, Nil)

pub fn cast(raw) {
  case do_cast(raw) {
    Ok(shadow_root) -> Ok(shadow_root)
    Error(Nil) -> Error(DecodeError("ShadowRoot", dynamic.classify(raw), []))
  }
}

@external(javascript, "../../shadow_ffi.mjs", "appendChild")
pub fn append_child(root: ShadowRoot, element: Element) -> Nil

@external(javascript, "../../shadow_ffi.mjs", "attachShadow")
pub fn attach_shadow(element: Element, mode: Mode) -> ShadowRoot

/// Returns the shadow root attached to the given element, if any.
@external(javascript, "../../shadow_ffi.mjs", "shadowRoot")
pub fn shadow_root(element: Element) -> Result(ShadowRoot, Nil)

/// Returns the element that the shadow root is attached to.
@external(javascript, "../../shadow_ffi.mjs", "host")
pub fn host(root: ShadowRoot) -> Element

/// Returns the first element that matches the given selector in the given
/// shadow root, if any.
@external(javascript, "../../shadow_ffi.mjs", "querySelector")
pub fn query_selector(
  shadow_root: ShadowRoot,
  selector: String,
) -> Result(Element, Nil)

/// Returns all elements that match the given selector in the given shadow root.
@external(javascript, "../../shadow_ffi.mjs", "querySelectorAll")
pub fn query_selector_all(
  shadow_root: ShadowRoot,
  selector: String,
) -> Array(Element)
