import gleam/javascript/promise.{type Promise}

pub type File

// A promise that resolves with a string which contains the blob's data as a text string.
// The data is always presumed to be in UTF-8 format. 
@external(javascript, "../../file_ffi.mjs", "text")
pub fn text(file: File) -> Promise(String)
