import gleam.{type Result}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type Url

@external(javascript, "../../url_ffi.mjs", "new_")
pub fn new(url: String, base: Option(String)) -> Result(Url, String)

@external(javascript, "../../url_ffi.mjs", "to_json")
pub fn to_json(url: Url) -> Json

@external(javascript, "../../url_ffi.mjs", "to_string")
pub fn to_string(url: Url) -> String

@external(javascript, "../../url_ffi.mjs", "host")
pub fn host(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "hostname")
pub fn hostname(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "href")
pub fn href(url: Url) -> String

@external(javascript, "../../url_ffi.mjs", "origin")
pub fn origin(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "password")
pub fn password(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "pathname")
pub fn pathname(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "protocol")
pub fn protocol(url: Url) -> String

@external(javascript, "../../url_ffi.mjs", "search")
pub fn search(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "search_params")
pub fn search_params(url: Url) -> Option(String)

@external(javascript, "../../url_ffi.mjs", "username")
pub fn username(url: Url) -> Option(String)
