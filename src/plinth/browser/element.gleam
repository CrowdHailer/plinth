pub type Element

@external(javascript, "../../element_ffi.mjs", "setInnerHTML")
pub fn set_inner_html(el: Element, value: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "innerText")
pub fn inner_text(el: Element) -> String

@external(javascript, "../../element_ffi.mjs", "closest")
pub fn closest(element: Element, selector: String) -> Result(Element, Nil)