import gleeunit/should
import plinth/bun/password
import gleam/option.{None, Some}
import gleam/javascript/promise
import gleam/string

pub fn empty_password_hash_test() {
  let algorithm = None
  use hash <- promise.map(password.bun_password_hash("some_password", algorithm))
  hash
  |> string.starts_with("$argon2id$v=19$m=65536,t=2,p=1$")
  |> should.be_true

  use valid <- promise.map(password.bun_password_verify("some_password", hash, algorithm))
  valid |> should.be_true
}

pub fn argon2id_password_hash_test() {
  let algorithm = Some(password.bun_argon2id_algorithm(Some(65536), Some(2)))
  use hash <- promise.map(password.bun_password_hash("argon2id_password", algorithm))
  hash
  |> string.starts_with("$argon2id$v=19$m=65536,t=2,p=1$")
  |> should.be_true

  use valid <- promise.map(password.bun_password_verify("argon2id_password", hash, algorithm))
  valid |> should.be_true
}

pub fn argon2d_password_hash_test() {
  let algorithm = Some(password.bun_argon2d_algorithm(Some(65536),Some(2)))
  use hash <- promise.map(password.bun_password_hash("argon2d_password", algorithm))
  hash
  |> string.starts_with("$argon2d$v=19$m=65536,t=2,p=1$")
  |> should.be_true

  use valid <- promise.map(password.bun_password_verify("argon2d_password", hash, algorithm))
  valid |> should.be_true
}

pub fn argon2i_password_hash_test() {
  let algorithm = Some(password.bun_argon2i_algorithm(Some(65536), Some(2)))
  use hash <- promise.map(password.bun_password_hash("argon2i_password", algorithm))
  hash
  |> string.starts_with("$argon2i$v=19$m=65536,t=2,p=1$")
  |> should.be_true

  use valid <- promise.map(password.bun_password_verify("argon2i_password", hash, algorithm))
  valid |> should.be_true
}

pub fn empty_bcrypt_password_hash_test() {
  let algorithm = Some(password.bun_bcrypt_algorithm(None))
  use hash <- promise.map(password.bun_password_hash("bcrypt_password", algorithm))
  hash
  |> string.starts_with("$2b$10$")
  |> should.be_true

  use valid <- promise.map(password.bun_password_verify("bcrypt_password", hash, algorithm))
  valid |> should.be_true
}

pub fn bcrypt_password_hash_test() {
  let algorithm = Some(password.bun_bcrypt_algorithm(Some(5)))
  use hash <- promise.map(password.bun_password_hash("bcrypt5_password", algorithm))
  hash
  |> string.starts_with("$2b$05$")
  |> should.be_true

  use valid <- promise.map(password.bun_password_verify("bcrypt5_password", hash, algorithm))
  valid |> should.be_true
}
