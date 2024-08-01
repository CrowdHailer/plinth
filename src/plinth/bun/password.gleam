import gleam/option.{type Option}
import gleam/javascript/promise.{type Promise}

pub type Algorithm

@external(javascript, "../../bun_password_ffi.mjs", "bun_password_hash")
pub fn bun_password_hash(password: input, algorithm: Option(Algorithm)) -> Promise(String)

@external(javascript, "../../bun_password_ffi.mjs", "bun_password_verify")
pub fn bun_password_verify(password: input, hash: input_2, algorithm: Option(Algorithm)) -> Promise(Bool)

@external(javascript, "../../bun_password_ffi.mjs", "bun_password_hash")
pub fn bun_password_hash_sync(password: input, algorithm: Option(Algorithm)) -> String

@external(javascript, "../../bun_password_ffi.mjs", "bun_password_verify")
pub fn bun_password_verify_sync(password: input, hash: input_2, algorithm: Option(Algorithm)) -> Bool

@external(javascript, "../../bun_password_ffi.mjs", "bun_argon2i_algorithm")
pub fn bun_argon2i_algorithm(memory_cost: Option(Int), time_cost: Option(Int)) -> Algorithm

@external(javascript, "../../bun_password_ffi.mjs", "bun_argon2id_algorithm")
pub fn bun_argon2id_algorithm(memory_cost: Option(Int), time_cost: Option(Int)) -> Algorithm

@external(javascript, "../../bun_password_ffi.mjs", "bun_argon2d_algorithm")
pub fn bun_argon2d_algorithm(memory_cost: Option(Int), time_cost: Option(Int)) -> Algorithm

@external(javascript, "../../bun_password_ffi.mjs", "bun_bcrypt_algorithm")
pub fn bun_bcrypt_algorithm(cost: Option(Int)) -> Algorithm

