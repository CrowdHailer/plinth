import plinth/javascript/big_int
import gleeunit/should

pub fn add_test() {
  big_int.from_int(1)
  |> should.equal(big_int.from_string("1"))
}
