import gleam/javascript/promise.{type Promise}

/// For encoding, pass "gzip" or "deflate"
@target(javascript)
@external(javascript, "../../compression_stream_ffi.mjs", "compress")
pub fn compress(data: BitArray, encoding: String) -> Promise(BitArray)
