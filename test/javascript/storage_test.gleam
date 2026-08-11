import gleam/list
import gleam/option.{None, Some}
import gleeunit/should
import plinth/javascript/storage

pub fn get_throw_test() {
  use <- run(True, False)
  should.equal(storage.local(), Error("Error: ARGBL"))
  should.equal(storage.session(), Error("Error: ARGBL"))
}

pub fn get_undef_test() {
  use <- run(False, True)
  should.equal(storage.local(), Error("localStorage is not available"))
  should.equal(storage.session(), Error("sessionStorage is not available"))
}

pub fn get_set_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.be_ok(storage.set_item(local, "Foo", "Bar"))
  should.equal(storage.get_item(local, "Foo"), Ok(Some("Bar")))
}

pub fn get_empty_string_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.be_ok(storage.set_item(local, "empty", ""))
  should.equal(storage.get_item(local, "empty"), Ok(Some("")))
  should.equal(storage.get_item(local, "missing"), Ok(None))
}

pub fn item_error_test() {
  use denied_storage <- run_with_throwing_storage
  should.equal(
    storage.get_item(denied_storage, "Foo"),
    Error("Error: Get denied!"),
  )
  should.equal(
    storage.set_item(denied_storage, "Foo", "Bar"),
    Error("Error: Set denied!"),
  )
}

pub fn set_limit_test() {
  use <- run(False, False)
  let assert Ok(session) = storage.session()
  should.be_ok(storage.set_item(session, "Foo1", "Bar"))
  should.be_ok(storage.set_item(session, "Foo2", "Bar"))
  should.be_ok(storage.set_item(session, "Foo3", "Bar"))
  should.be_ok(storage.set_item(session, "Foo4", "Bar"))
  should.be_ok(storage.set_item(session, "Foo5", "Bar"))
  should.equal(storage.set_item(session, "Foo6", "Bar"), Error("Error: Full!"))
}

pub fn length_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.be_ok(storage.set_item(local, "Foo", "Bar"))
  should.be_ok(storage.set_item(local, "Foo2", "Bar"))
  should.equal(storage.length(local), 2)
}

pub fn key_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.be_ok(storage.set_item(local, "Foo1", "Bar1"))
  should.be_ok(storage.set_item(local, "Foo2", "Bar2"))
  should.be_ok(storage.set_item(local, "Foo3", "Bar3"))
  should.be_ok(storage.set_item(local, "Foo4", "Bar4"))
  should.be_ok(storage.set_item(local, "Foo5", "Bar5"))

  let indexes = [0, 1, 2, 3, 4]
  let keys = list.try_map(indexes, fn(i) { storage.key(local, i) })
  should.equal(keys, Ok(["Foo1", "Foo2", "Foo3", "Foo4", "Foo5"]))
}

pub fn key_fail_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.be_error(storage.key(local, 1))
}

pub fn remove_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.equal(storage.remove_item(local, "not here"), Nil)
  should.be_ok(storage.set_item(local, "Foo", "Bar"))
  should.equal(storage.remove_item(local, "Foo"), Nil)
  should.equal(storage.get_item(local, "Foo"), Ok(None))
}

pub fn clear_test() {
  use <- run(False, False)
  let assert Ok(session) = storage.session()
  should.be_ok(storage.set_item(session, "Foo1", "Bar"))
  should.be_ok(storage.set_item(session, "Foo2", "Bar"))
  should.be_ok(storage.set_item(session, "Foo3", "Bar"))
  should.be_ok(storage.set_item(session, "Foo4", "Bar"))
  should.be_ok(storage.set_item(session, "Foo5", "Bar"))
  storage.clear(session)
  should.equal(storage.length(session), 0)
}

@external(javascript, "../storage_test_ffi.mjs", "runWithMockStorage")
fn run(should_throw: Bool, should_undef: Bool, callback: fn() -> a) -> Nil

@external(javascript, "../storage_test_ffi.mjs", "runWithThrowingStorage")
fn run_with_throwing_storage(callback: fn(storage.Storage) -> a) -> Nil
