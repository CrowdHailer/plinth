import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}
import gleam/json.{type Json}
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
pub fn export_jwk(key: CryptoKey) -> Promise(Result(Json, String))

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "generateKey")
fn do_generate_key(
  algorithm: PublicKeyAlgorithm,
  extractable: Bool,
  key_usages: Array(String),
) -> Promise(Result(#(CryptoKey, CryptoKey), String))

pub fn generate_key(algorithm, extractable, key_usages) {
  let key_usages =
    key_usages
    |> list.map(key_usage_to_string)
    |> array.from_list
  do_generate_key(algorithm, extractable, key_usages)
}

pub type PublicKeyAlgorithm {
  RsaHashedKeyGenParams(
    name: String,
    // This should be at least 2048: see for example see SP 800-131A Rev. 2. Some organizations are now recommending that it should be 4096.
    modulus_length: Int,
    // Unless you have a good reason to use something else, specify 65537 here ([0x01, 0x00, 0x01]).
    public_exponent: BitArray,
    hash: DigestAlgorithm,
  )
  EcKeyGenParams(name: String, named_curve: String)
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

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "importKey")
fn do_import_key(
  format: String,
  key_data: BitArray,
  algorithm: Json,
  extractable: Bool,
  key_usages: Array(String),
) -> Promise(Result(CryptoKey, String))

pub fn import_key(format, key_data, algorithm, extractable, key_usages) {
  let algorithm = import_algorithm_to_json(algorithm)
  let key_usages =
    key_usages
    |> list.map(key_usage_to_string)
    |> array.from_list
  do_import_key(format, key_data, algorithm, extractable, key_usages)
}

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "importJwk")
fn do_import_jwk(
  key_data: Json,
  algorithm: Json,
  extractable: Bool,
  key_usages: Array(String),
) -> Promise(Result(CryptoKey, String))

pub fn import_jwk(key_data, algorithm, extractable, key_usages) {
  let algorithm = import_algorithm_to_json(algorithm)
  let key_usages =
    key_usages
    |> list.map(key_usage_to_string)
    |> array.from_list
  do_import_jwk(key_data, algorithm, extractable, key_usages)
}

pub type ImportAlgorithm {
  RsaHashedImportParams(name: String, hash: DigestAlgorithm)
  EcKeyImportParams(name: String, named_curve: NamedCurve)
  HmacImportParams(hash: DigestAlgorithm)
  OtherImportParams(name: String)
}

fn import_algorithm_to_json(algorithm_parameters) {
  case algorithm_parameters {
    RsaHashedImportParams(name, hash) ->
      json.object([
        #("name", json.string(name)),
        #("hash", json.string(digest_algorithm_to_string(hash))),
      ])
    EcKeyImportParams(name, named_curve) ->
      json.object([
        #("name", json.string(name)),
        #("namedCurve", json.string(named_curve_to_string(named_curve))),
      ])
    HmacImportParams(hash) ->
      json.object([
        #("name", json.string("HMAC")),
        #("hash", json.string(digest_algorithm_to_string(hash))),
      ])
    OtherImportParams(name) -> json.object([#("name", json.string(name))])
  }
}

pub type NamedCurve {
  P256
  P384
  P521
}

fn named_curve_to_string(named_curve) {
  case named_curve {
    P256 -> "P-256"
    P384 -> "P-384"
    P521 -> "P-521"
  }
}

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "sign")
fn do_sign(
  algorithm: Json,
  key: CryptoKey,
  data: BitArray,
) -> Promise(Result(BitArray, String))

pub fn sign(algorithm, key, data) {
  let algorithm = sign_algorithm_to_json(algorithm)
  do_sign(algorithm, key, data)
}

pub type SignAlgorithm {
  RsaSsaPkcs1v15
  RsaPssParams(salt_length: Int)
  EcdsaParams(hash: DigestAlgorithm)
  Hmac
  Ed25519
}

fn sign_algorithm_to_json(key_algorithm) {
  case key_algorithm {
    RsaSsaPkcs1v15 -> json.object([#("name", json.string("RSASSA-PKCS1-v1_5"))])
    RsaPssParams(salt_length) ->
      json.object([
        #("name", json.string("RSA-PSS")),
        #("saltLength", json.int(salt_length)),
      ])
    EcdsaParams(hash) ->
      json.object([
        #("name", json.string("ECDSA")),
        #("hash", json.string(digest_algorithm_to_string(hash))),
      ])
    Hmac -> json.object([#("name", json.string("HMAC"))])
    Ed25519 -> json.object([#("name", json.string("Ed25519"))])
  }
}

@external(javascript, "../../../plinth_browser_crypto_subtle_ffi.mjs", "verify")
fn do_verify(
  algorithm: Json,
  key: CryptoKey,
  signature: BitArray,
  data: BitArray,
) -> Promise(Result(Bool, String))

pub fn verify(algorithm, key, signature, data) {
  let algorithm = sign_algorithm_to_json(algorithm)
  do_verify(algorithm, key, signature, data)
}
