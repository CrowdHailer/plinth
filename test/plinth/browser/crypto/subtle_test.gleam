import gleam/bit_array
import gleam/javascript/promise
import gleam/string
import gleeunit/should
import plinth/browser/crypto/subtle

fn import_key() {
  let secret = <<"opensesame":utf8>>
  subtle.import_key(
    "raw",
    secret,
    subtle.HmacImportParams(subtle.SHA256),
    True,
    [subtle.Sign, subtle.Verify],
  )
}

pub fn hmac_sign_test() {
  let data = <<"hello world":utf8>>

  use key <- promise.await(import_key())
  let key = should.be_ok(key)
  use check <- promise.await(subtle.sign(subtle.Hmac, key, data))
  let check = should.be_ok(check)
  check
  |> bit_array.base16_encode
  |> string.lowercase
  |> should.equal(
    "05af2e32367f185f8bf71705c84a2d8cd2754195826316aed3cd0fd760d4d083",
  )
  promise.resolve(Nil)
}

pub fn hmac_verify_test() {
  let signature =
    bit_array.base16_decode(
      "05af2e32367f185f8bf71705c84a2d8cd2754195826316aed3cd0fd760d4d083",
    )
    |> should.be_ok
  let data = <<"hello world":utf8>>

  use key <- promise.await(import_key())
  let key = should.be_ok(key)
  use check <- promise.await(subtle.verify(subtle.Hmac, key, signature, data))
  check
  |> should.be_ok
  |> should.be_true
  promise.resolve(Nil)
}
