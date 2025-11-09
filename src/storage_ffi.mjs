import { Result$Ok, Result$Error } from "./gleam.mjs";

export function localStorage() {
  try {
    if (
      globalThis.Storage &&
      globalThis.localStorage instanceof globalThis.Storage
    ) {
      return Result$Ok(globalThis.localStorage);
    } else {
      return Result$Error(null);
    }
  } catch {
    return Result$Error(null);
  }
}

export function sessionStorage() {
  try {
    if (
      globalThis.Storage &&
      globalThis.sessionStorage instanceof globalThis.Storage
    ) {
      return Result$Ok(globalThis.sessionStorage);
    } else {
      return Result$Error(null);
    }
  } catch {
    return Result$Error(null);
  }
}

export function length(storage) {
  return storage.length;
}

export function key(storage, index) {
  return null_or(storage.key(index));
}

export function getItem(storage, keyName) {
  return null_or(storage.getItem(keyName));
}

export function setItem(storage, keyName, keyValue) {
  try {
    storage.setItem(keyName, keyValue);
    return Result$Ok(null);
  } catch {
    return Result$Error(null);
  }
}

export function removeItem(storage, keyName) {
  storage.removeItem(keyName);
}

export function clear(storage) {
  storage.clear();
}

function null_or(val) {
  if (val !== null) {
    return Result$Ok(val);
  } else {
    return Result$Error(null);
  }
}
