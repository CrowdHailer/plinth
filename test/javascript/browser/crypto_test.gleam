//// crypto API is implemented in node

import gleam/bit_array
import plinth/browser/crypto
import plinth/browser/window

pub fn get_random_values_test() {
  let assert Ok(crypto) = window.crypto(window.self())

  let assert Ok(bytes) = crypto.get_random_values(crypto, 10)
  assert 10 == bit_array.byte_size(bytes)
  assert <<0:80>> != bytes

  let assert Ok(<<>>) = crypto.get_random_values(crypto, 0)

  let assert Error("RangeError: Invalid typed array length: -1") =
    crypto.get_random_values(crypto, -1)
}
