/// Returns the contents of the path as a string.
@external(javascript, "../../fs_ffi.mjs", "readFileSync")
pub fn read_file_sync(path: String) -> Result(String, String)

/// Write a string to a file.
@external(javascript, "../../fs_ffi.mjs", "writeFileSync")
pub fn write_file_sync(
  path path: String,
  content content: String,
) -> Result(Nil, String)
