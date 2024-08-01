import gleeunit/should
import plinth/bun/password
import gleam/option.{type Option, None, Some}
import gleam/javascript/promise
import gleam/string
import platform.{Bun}

fn round_trip_validate(password: String, starts_with: String, algorithm: Option(password.Algorithm)) {
  case platform.get_platform() {
    Bun -> {
      use hash <- promise.await(password.bun_password_hash(password, algorithm))

      hash
      |> string.starts_with(starts_with)
      |> should.be_true

      use valid <- promise.map(password.bun_password_verify(password, hash, algorithm))
      valid |> should.be_true
    }
    _ -> promise.resolve(Nil)
  }
}

fn round_trip_validate_sync(password: String, starts_with: String, algorithm: Option(password.Algorithm)) {
  case platform.get_platform() {
    Bun -> {
      let hash = password.bun_password_hash_sync(password, algorithm)
      hash
      |> string.starts_with(starts_with)
      |> should.be_true

      password.bun_password_verify_sync(password, hash, algorithm)
      |> should.be_true
    }
    _ -> Nil
  }
}

pub fn argon2id_password_hash_test() {
  round_trip_validate_sync("argon2id_password", "$argon2id$v=19$m=65536,t=2,p=1$", Some(password.bun_argon2id_algorithm(Some(65536), Some(2))))
  round_trip_validate("argon2id_password", "$argon2id$v=19$m=65536,t=2,p=1$", Some(password.bun_argon2id_algorithm(Some(65536), Some(2))))
}

pub fn argon2d_password_hash_test() {
  round_trip_validate_sync("argon2d_password", "$argon2d$v=19$m=65536,t=2,p=1$", Some(password.bun_argon2d_algorithm(Some(65536),Some(2))))
  round_trip_validate("argon2d_password", "$argon2d$v=19$m=65536,t=2,p=1$", Some(password.bun_argon2d_algorithm(Some(65536),Some(2))))
}

pub fn argon2i_password_hash_test() {
  round_trip_validate_sync("argon2i_password", "$argon2i$v=19$m=65536,t=2,p=1$", Some(password.bun_argon2i_algorithm(Some(65536), Some(2))))
  round_trip_validate("argon2i_password", "$argon2i$v=19$m=65536,t=2,p=1$", Some(password.bun_argon2i_algorithm(Some(65536), Some(2))))
}

pub fn empty_bcrypt_password_hash_test() {
  round_trip_validate_sync("bcrypt_password", "$2b$10$", Some(password.bun_bcrypt_algorithm(None)))
  round_trip_validate("bcrypt_password", "$2b$10$", Some(password.bun_bcrypt_algorithm(None)))
}

pub fn bcrypt_password_hash_test() {
  round_trip_validate_sync("bcrypt5_password", "$2b$05$", Some(password.bun_bcrypt_algorithm(Some(5))))
  round_trip_validate("bcrypt5_password", "$2b$05$", Some(password.bun_bcrypt_algorithm(Some(5))))
}
