import plinth/browser/element.{type Element}

@external(javascript, "../../dialog_ffi.mjs", "showModal")
pub fn show_modal(element: Element) -> Nil

@external(javascript, "../../dialog_ffi.mjs", "closeModal")
pub fn close_modal(element: Element) -> Nil