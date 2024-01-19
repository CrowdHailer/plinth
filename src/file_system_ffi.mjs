import { Ok, Error } from "./gleam.mjs";

export async function showDirectoryPicker() {
  try {
    return new Ok(await window.showDirectoryPicker());
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function showOpenFilePicker() {
  try {
    return new Ok(await window.showOpenFilePicker());
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function showSaveFilePicker() {
  try {
    return new Ok(await window.showSaveFilePicker());
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function getFile(fileHandle) {
  try {
    return new Ok(await fileHandle.getFile());
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function createWritable(fileHandle) {
  try {
    return new Ok(await fileHandle.createWritable());
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function write(writableStream, bitArray) {
  try {
    return new Ok(await writableStream.write(bitArray.buffer));
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function close(writableStream) {
  try {
    return new Ok(await writableStream.close());
  } catch (error) {
    return new Error(error.toString());
  }
}
