import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}
import gleam/json
import gleam/list

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

pub type CryptoKey

/// export Jwk is separate because it returns JSON, other formats return array buffer 
@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "exportJwk")
pub fn export_jwk(key: CryptoKey) -> Promise(Result(json.Json, String))

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "generateKey")
fn do_generate_key(
  algorithm: json.Json,
  extractable: Bool,
  key_usages: Array(String),
) -> Promise(Result(#(CryptoKey, CryptoKey), String))

pub fn generate_key(algorithm, extractable, key_usages) {
  let algorithm = public_key_algorithm_to_json(algorithm)

  let key_usages =
    key_usages
    |> list.map(key_usage_to_string)
    |> array.from_list
  do_generate_key(algorithm, extractable, key_usages)
}

pub type PublicKeyAlgorithm {
  EcKeyGenParams(name: String, named_curve: String)
}

fn public_key_algorithm_to_json(key_algorithm) {
  case key_algorithm {
    EcKeyGenParams(name:, named_curve:) ->
      json.object([
        #("name", json.string(name)),
        #("namedCurve", json.string(named_curve)),
      ])
  }
}

pub type KeyUsage {
  Encrypt
  Decrypt
  Sign
  Verify
  DeriveKey
  DeriveBits
  WrapKey
  UnwrapKey
}

fn key_usage_to_string(key_usage) {
  case key_usage {
    Encrypt -> "encrypt"
    Decrypt -> "decrypt"
    Sign -> "sign"
    Verify -> "verify"
    DeriveKey -> "deriveKey"
    DeriveBits -> "deriveBits"
    WrapKey -> "wrapKey"
    UnwrapKey -> "unwrapKey"
  }
}

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "sign")
fn do_sign(
  algorithm: json.Json,
  key: CryptoKey,
  data: BitArray,
) -> Promise(Result(BitArray, String))

pub fn sign(algorithm, key, data) {
  let algorithm = sign_algorithm_to_json(algorithm)
  do_sign(algorithm, key, data)
}

pub type SignAlgorithm {
  EcdsaParams(hash: DigestAlgorithm)
}

fn sign_algorithm_to_json(key_algorithm) {
  case key_algorithm {
    EcdsaParams(hash) ->
      json.object([
        #("name", json.string("ECDSA")),
        #("hash", json.string(digest_algorithm_to_string(hash))),
      ])
  }
}
