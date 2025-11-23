import gleam/dynamic/decode
import gleam/int

pub fn float_or_int() {
  decode.one_of(decode.float, [decode.map(decode.int, int.to_float)])
}
