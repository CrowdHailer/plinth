import gleam/javascript/promise.{type Promise}

@target(javascript)
/// For encoding, pass "gzip" or "deflate"
@external(javascript, "../../decompression_stream_ffi.mjs", "decompress")
pub fn decompress(data: BitArray, encoding: String) -> Promise(BitArray)
