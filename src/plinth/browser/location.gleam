pub type Location

@external(javascript, "../../location_ffi.mjs", "origin")
pub fn origin(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "pathname")
pub fn pathname(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "reload")
pub fn reload(location: Location) -> Nil

@external(javascript, "../../location_ffi.mjs", "href")
pub fn href(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "hash")
pub fn hash(location: Location) -> Result(String, Nil)

@external(javascript, "../../location_ffi.mjs", "search")
pub fn search(location: Location) -> Result(String, Nil)
