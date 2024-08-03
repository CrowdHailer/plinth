import plinth/javascript/console

pub fn log_test() {
  console.log("This is a plain log")
}

pub fn warn_test() {
  console.warn("This is a warning!")
}

pub fn error_test() {
  console.error("This is an error!")
}

pub fn info_test() {
  console.info("This is some info…")
}

pub fn debug_test() {
  console.debug(#("Debug", 3, 5, Ok(7)))
}

pub fn assert_pass_test() {
  console.assert_(True, "You should NOT see this!")
}

pub fn assert_fail_test() {
  console.assert_(False, "You should see this!")
}
