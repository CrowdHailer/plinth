import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}
import plinth/browser/file.{type File}

pub type DirectoryHandle

pub type FileHandle

@external(javascript, "../../file_system_ffi.mjs", "showDirectoryPicker")
pub fn show_directory_picker() -> Promise(Result(DirectoryHandle, String))

@external(javascript, "../../file_system_ffi.mjs", "showOpenFilePicker")
pub fn show_open_file_picker() -> Promise(Result(Array(FileHandle), String))

@external(javascript, "../../file_system_ffi.mjs", "showSaveFilePicker")
pub fn show_save_file_picker() -> Promise(Result(FileHandle, String))

@external(javascript, "../../file_system_ffi.mjs", "getFile")
pub fn get_file(file_handle: FileHandle) -> Promise(Result(File, String))

pub type WritableFileStream

@external(javascript, "../../file_system_ffi.mjs", "createWritable")
pub fn create_writable(
  file_handle: FileHandle,
) -> Promise(Result(WritableFileStream, String))

@external(javascript, "../../file_system_ffi.mjs", "write")
pub fn write(
  file_handle: WritableFileStream,
  content: BitArray,
) -> Promise(Result(Nil, String))

@external(javascript, "../../file_system_ffi.mjs", "close")
pub fn close(file_handle: WritableFileStream) -> Promise(Result(Nil, String))
