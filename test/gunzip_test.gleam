import gleam/bit_array
import gleam/javascript/promise
import gleeunit/should
import simplifile
import plinth/javascript/decompression_stream.{decompress}

pub fn gunzip_test() {
  let assert Ok(gzipped_data) = simplifile.read_bits("test/hello.txt.gz")

  use data <- promise.await(decompress(gzipped_data, "gzip"))
  data
  |> bit_array.to_string
  |> should.equal(Ok("Hello, world!\n"))

  promise.resolve(Ok(Nil))
}
