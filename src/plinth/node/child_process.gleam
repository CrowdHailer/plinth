import plinth/node/stream

pub type ChildProcess

@external(javascript, "child_process", "exec")
pub fn exec(command: String) -> ChildProcess

@external(javascript, "../../child_process_ffi.mjs", "spawn")
pub fn spawn(command: String, arguments: List(String)) -> ChildProcess

@external(javascript, "../../child_process_ffi.mjs", "kill")
pub fn kill(child_process: ChildProcess) -> Nil

@external(javascript, "../../child_process_ffi.mjs", "stdin")
pub fn stdin(child_process: ChildProcess) -> Result(stream.Writable, Nil)
