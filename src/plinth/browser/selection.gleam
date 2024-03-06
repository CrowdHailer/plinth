import plinth/browser/range.{type Range}

pub type Selection

@external(javascript, "../../selection_ffi.mjs", "getSelection")
pub fn get_selection() -> Result(Selection, Nil)

@external(javascript, "../../selection_ffi.mjs", "getRangeAt")
pub fn get_range_at(selection: Selection, at: Int) -> Result(Range, Nil)
