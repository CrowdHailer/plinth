import gleam/list
import gleeunit/should
import plinth/javascript/storage

pub fn get_throw_test() {
  use <- run(True, False)
  should.be_error(storage.local())
  should.be_error(storage.session())
}

pub fn get_undef_test() {
  use <- run(False, True)
  should.be_error(storage.local())
  should.be_error(storage.session())
}

pub fn get_set_test() {
  use <- run(False, False)
  let assert Ok(local) = storage.local()
  should.be_ok(storage.set_item(local, "Foo", "Bar"))
  should.equal(storage.get_item(local, "Foo"), Ok("Bar"))
}

pub fn set_limit_test() {
  use <- run(False, False)
  let assert Ok(session) = storage.session()
  should.be_ok(storage.set_item(session, "Foo1", "Bar"))
  should.be_ok(storage.set_item(session, "Foo2", "Bar"))
  should.be_ok(storage.set_item(session, "Foo3", "Bar"))
  should.be_ok(storage.set_item(session, "Foo4", "Bar"))
  should.be_ok(storage.set_item(session, "Foo5", "Bar"))
  should.be_error(storage.set_item(session, "Foo6", "Bar"))
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
  should.be_error(storage.get_item(local, "Foo"))
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
