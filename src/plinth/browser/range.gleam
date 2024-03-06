import plinth/browser/element.{type Element}

pub type Range

@external(javascript, "../../range_ffi.mjs", "startContainer")
pub fn start_container(range: Range) -> Element

@external(javascript, "../../range_ffi.mjs", "startOffset")
pub fn start_offset(range: Range) -> Element

@external(javascript, "../../range_ffi.mjs", "endContainer")
pub fn end_container(range: Range) -> Element

@external(javascript, "../../range_ffi.mjs", "endOffset")
pub fn end_offset(range: Range) -> Element
