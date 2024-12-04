import gleam/javascript/promise.{type Promise}
import gleam/json.{type Json}

pub type DigestAlgorithm {
  SHA1
  SHA256
  SHA384
  SHA512
}

pub fn digest_algorithm_to_string(algorithm) {
  case algorithm {
    SHA1 -> "SHA-1"
    SHA256 -> "SHA-256"
    SHA384 -> "SHA-384"
    SHA512 -> "SHA-512"
  }
}

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "digest")
fn do_digest(
  algorithm: String,
  data: BitArray,
) -> Promise(Result(BitArray, String))

pub fn digest(algorithm, data) {
  do_digest(digest_algorithm_to_string(algorithm), data)
}

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "verify")
pub fn verify(
  alg: BitArray,
  key: Json,
  signature: BitArray,
  data: BitArray,
) -> Promise(Bool)
