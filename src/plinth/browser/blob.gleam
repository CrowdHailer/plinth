import gleam/javascript/promise.{type Promise}

pub type Blob

@external(javascript, "../../blob_ffi.mjs", "new_")
pub fn new(content: BitArray, mime: String) -> Blob

@external(javascript, "../../blob_ffi.mjs", "text")
pub fn text(blob: Blob) -> Promise(String)

@external(javascript, "../../blob_ffi.mjs", "bytes")
pub fn bytes(blob: Blob) -> Promise(BitArray)

@external(javascript, "../../blob_ffi.mjs", "mime")
pub fn mime(blob: Blob) -> String

@external(javascript, "../../blob_ffi.mjs", "size")
pub fn size(blob: Blob) -> Int
