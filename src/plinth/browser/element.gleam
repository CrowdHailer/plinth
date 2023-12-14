pub type Element

@external(javascript, "../../element_ffi.mjs", "getAttribute")
pub fn get_attribute(element: Element, name: String) -> Result(String, Nil)

@external(javascript, "../../element_ffi.mjs", "setAttribute")
pub fn set_attribute(element: Element, name: String, value: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "setInnerHTML")
pub fn set_inner_html(element: Element, value: String) -> Nil

@external(javascript, "../../element_ffi.mjs", "innerText")
pub fn inner_text(element: Element) -> String

@external(javascript, "../../element_ffi.mjs", "closest")
pub fn closest(element: Element, selector: String) -> Result(Element, Nil)
