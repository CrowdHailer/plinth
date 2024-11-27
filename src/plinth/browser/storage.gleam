import gleam/javascript/promise.{type Promise}
import plinth/browser/file_system.{type DirectoryHandle}

pub type StorageManager

@external(javascript, "../../plinth_browser_storage_ffi.mjs", "getStorage")
pub fn get() -> Result(StorageManager, Nil)

pub type Estimate {
  Estimate(quota: Int, usage: Int)
}

@external(javascript, "../../plinth_browser_storage_ffi.mjs", "estimate")
fn do_estimate(storage: StorageManager) -> Promise(Result(#(Int, Int), String))

pub fn estimate(storage) {
  use #(quota, usage) <- promise.map_try(do_estimate(storage))
  Ok(Estimate(quota, usage))
}

@external(javascript, "../../plinth_browser_storage_ffi.mjs", "getDirectory")
pub fn get_directory(
  storage: StorageManager,
) -> Promise(Result(DirectoryHandle, String))

@external(javascript, "../../plinth_browser_storage_ffi.mjs", "persist")
pub fn persist(storage: StorageManager) -> Promise(Result(Bool, String))

@external(javascript, "../../plinth_browser_storage_ffi.mjs", "persisted")
pub fn persisted(storage: StorageManager) -> Promise(Result(Bool, String))
