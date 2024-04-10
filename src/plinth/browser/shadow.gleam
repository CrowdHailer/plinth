import plinth/browser/element.{type Element}

pub type ShadowRoot

pub type Mode {
  Open
  Closed
}

@external(javascript, "../../shadow_ffi.mjs", "appendChild")
pub fn append_child(root: ShadowRoot, element: Element) -> Nil

@external(javascript, "../../shadow_ffi.mjs", "attachShadow")
pub fn attach_shadow(element: Element, mode: Mode) -> ShadowRoot
