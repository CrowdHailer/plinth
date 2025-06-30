import gleam/bit_array
import gleam/javascript/promise
import gleeunit/should
import plinth/javascript/compression_stream.{compress}
import plinth/javascript/decompression_stream.{decompress}

pub fn gzip_round_trip_test() {
  use compressed <- promise.await(compress(hello(), "gzip"))
  use decompressed <- promise.await(decompress(compressed, "gzip"))
  decompressed
  |> should.equal(hello())

  promise.resolve(Ok(Nil))
}

pub fn gunzip_test() {
  use data <- promise.await(decompress(gzipped_hello(), "gzip"))
  data
  |> should.equal(hello())

  promise.resolve(Ok(Nil))
}

fn hello() {
  bit_array.from_string("Hello")
}

fn gzipped_hello() {
  <<
    31, 139, 8, 0, 0, 0, 0, 0, 0, 3, 243, 72, 205, 201, 201, 7, 0, 130, 137, 209,
    247, 5, 0, 0, 0,
  >>
}
