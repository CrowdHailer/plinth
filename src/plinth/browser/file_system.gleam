import gleam/javascript/array.{type Array}
import gleam/javascript/promise.{type Promise}
import plinth/browser/file.{type File}

pub type Handle(a)

pub type D

pub type F

pub type DirectoryHandle =
  Handle(D)

pub type FileHandle =
  Handle(F)

@external(javascript, "../../file_system_ffi.mjs", "showDirectoryPicker")
pub fn show_directory_picker() -> Promise(Result(DirectoryHandle, String))

@external(javascript, "../../file_system_ffi.mjs", "name")
pub fn name(handle: Handle(a)) -> String

@external(javascript, "../../file_system_ffi.mjs", "getDirectoryHandle")
pub fn get_directory_handle(
  handle: DirectoryHandle,
  name: String,
  create: Bool,
) -> Promise(Result(DirectoryHandle, String))

@external(javascript, "../../file_system_ffi.mjs", "getFileHandle")
pub fn get_file_handle(
  handle: DirectoryHandle,
  name: String,
  create: Bool,
) -> Promise(Result(FileHandle, String))

@external(javascript, "../../file_system_ffi.mjs", "removeEntry")
pub fn remove_entry(
  handle: DirectoryHandle,
  name: String,
  create: Bool,
) -> Promise(Result(Nil, String))

@external(javascript, "../../file_system_ffi.mjs", "allEntries")
pub fn all_entries(
  handle: DirectoryHandle,
) -> Promise(Result(#(Array(DirectoryHandle), Array(FileHandle)), String))

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
