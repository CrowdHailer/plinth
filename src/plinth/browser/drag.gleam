import gleam/javascript/array.{type Array}
import plinth/browser/event.{type Event}
import plinth/browser/file.{type File}

pub type DataTransfer

@external(javascript, "../../drag_ffi.mjs", "dataTransfer")
pub fn data_transfer(event: Event(t)) -> DataTransfer

@external(javascript, "../../drag_ffi.mjs", "files")
pub fn files(data_transfer: DataTransfer) -> Array(File)
