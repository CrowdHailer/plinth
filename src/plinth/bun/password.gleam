import gleam/option.{type Option}
import gleam/javascript/promise.{type Promise}

pub type Algorithm

@target(javascript)
@external(javascript, "../../bun_ffi.mjs", "bun_password_hash")
pub fn bun_password_hash(password: input, algorithm: Option(Algorithm)) -> Promise(String)

@target(javascript)
@external(javascript, "../../bun_ffi.mjs", "bun_argon2i_algorithm")
pub fn bun_argon2i_algorithm(memory_cost: Option(Int), time_cost: Option(Int)) -> Algorithm

@target(javascript)
@external(javascript, "../../bun_ffi.mjs", "bun_argon2id_algorithm")
pub fn bun_argon2id_algorithm(memory_cost: Option(Int), time_cost: Option(Int)) -> Algorithm

@target(javascript)
@external(javascript, "../../bun_ffi.mjs", "bun_argon2d_algorithm")
pub fn bun_argon2d_algorithm(memory_cost: Option(Int), time_cost: Option(Int)) -> Algorithm

@target(javascript)
@external(javascript, "../../bun_ffi.mjs", "bun_bcrypt_algorithm")
pub fn bun_bcrypt_algorithm(cost: Option(Int)) -> Algorithm

@target(javascript)
@external(javascript, "../../bun_ffi.mjs", "bun_password_verify")
pub fn bun_password_verify(password: input, hash: input_2, algorithm: Option(Algorithm)) -> Promise(Bool)
