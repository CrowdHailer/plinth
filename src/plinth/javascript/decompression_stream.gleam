import gleam/javascript/promise.{type Promise}

/// For encoding, pass "gzip" or "deflate"
@target(javascript)
@external(javascript, "../../decompression_stream_ffi.mjs", "decompress")
pub fn decompress(data: BitArray, encoding: String) -> Promise(BitArray)
