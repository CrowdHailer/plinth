import gleam/javascript/promise.{type Promise}

@target(javascript)
/// For encoding, pass "gzip" or "deflate"
@external(javascript, "../../compression_stream_ffi.mjs", "compress")
pub fn compress(data: BitArray, encoding: String) -> Promise(BitArray)
