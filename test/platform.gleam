@target(javascript)
@external(javascript, "./platform_test_ffi.mjs", "get_platform_string")
fn get_platform_string() -> String

pub type Platform {
  Bun
  Node
  Deno
  Browser
  Unknown
}

pub fn get_platform() -> Platform {
  case get_platform_string() {
    "bun" -> Bun
    "node" -> Node
    "deno" -> Deno
    "browser" -> Browser
    _ -> Unknown
  }
}