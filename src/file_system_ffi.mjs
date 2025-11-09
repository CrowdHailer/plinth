import { Result$Ok, Result$Error } from "./gleam.mjs";

export async function showDirectoryPicker() {
  try {
    return Result$Ok(await window.showDirectoryPicker());
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export function name(handle) {
  return handle.name
}

export async function getDirectoryHandle(directoryHandle, name, create) {
  try {
    return Result$Ok(await directoryHandle.getDirectoryHandle(name, { create }));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function getFileHandle(directoryHandle, name, create) {
  try {
    return Result$Ok(await directoryHandle.getFileHandle(name, { create }));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function removeEntry(directoryHandle, name, recursive) {
  try {
    return Result$Ok(await directoryHandle.removeEntry(name, { recursive }));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function allEntries(directoryHandle) {
  try {
    const dirs = [];
    const files = [];
    for await (const entry of directoryHandle.values()) {
      if (entry.kind === "file") {
        files.push(entry);
      } else {
        dirs.push(entry);
      }
    }
    return Result$Ok([dirs, files]);
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function showOpenFilePicker() {
  try {
    return Result$Ok(await window.showOpenFilePicker());
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function showSaveFilePicker() {
  try {
    return Result$Ok(await window.showSaveFilePicker());
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function getFile(fileHandle) {
  try {
    return Result$Ok(await fileHandle.getFile());
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function createWritable(fileHandle) {
  try {
    return Result$Ok(await fileHandle.createWritable());
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function write(writableStream, bitArray) {
  try {
    return Result$Ok(await writableStream.write(bitArray.rawBuffer));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function close(writableStream) {
  try {
    return Result$Ok(await writableStream.close());
  } catch (error) {
    return Result$Error(error.toString());
  }
}
