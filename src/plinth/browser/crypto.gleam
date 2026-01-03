pub type Crypto

@external(javascript, "../../plinth_browser_crypto_ffi.mjs", "getRandomValues")
pub fn get_random_values(
  crypto: Crypto,
  length: Int,
) -> Result(BitArray, String)

@external(javascript, "../../plinth_browser_crypto_ffi.mjs", "randomUUID")
pub fn random_uuid(crypto: Crypto) -> String
