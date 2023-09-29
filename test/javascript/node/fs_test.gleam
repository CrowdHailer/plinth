import plinth/node/fs

pub fn missing_file_test() {
  let assert Error(_) = fs.read_file_sync("nofile")
}

pub fn read_directory_test() {
  let assert Error(_) = fs.read_file_sync("test")
}

pub fn write_directory_test() {
  let assert Error(_) = fs.write_file_sync("test", "")
}
