pub type Location

@external(javascript, "../../location_ffi.mjs", "origin")
pub fn origin(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "host")
pub fn host(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "hostname")
pub fn hostname(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "port")
pub fn port(location: Location) -> String

@external(javascript, "../../location_ffi.mjs", "protocol")
pub fn protocol(location: Location) -> String

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
