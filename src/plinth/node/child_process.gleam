pub type ChildProcess {
  ChildProcess(stdin: Stdin)
}

pub type Stdin {
  Stdin(write: fn(String) -> Nil)
}

@external(javascript, "child_process", "exec")
pub fn exec(command: String) -> ChildProcess

@external(javascript, "../../child_process_ffi.mjs", "spawn")
pub fn spawn(command: String, arguments: List(String)) -> ChildProcess

@external(javascript, "../../child_process_ffi.mjs", "kill")
pub fn kill(child_process: ChildProcess) -> Nil
