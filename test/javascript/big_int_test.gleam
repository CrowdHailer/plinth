import gleeunit/should
import plinth/javascript/big_int

pub fn add_test() {
  big_int.from_int(1)
  |> should.equal(big_int.from_string("1"))
}
