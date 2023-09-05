import { Ok, Error } from "./gleam.mjs";

export function localStorage() {
  try {
    if (
      globalThis.Storage &&
      globalThis.localStorage instanceof globalThis.Storage
    ) {
      return new Ok(globalThis.localStorage);
    } else {
      return new Error(null);
    }
  } catch {
    return new Error(null);
  }
}

export function sessionStorage() {
  try {
    if (
      globalThis.Storage &&
      globalThis.sessionStorage instanceof globalThis.Storage
    ) {
      return new Ok(globalThis.sessionStorage);
    } else {
      return new Error(null);
    }
  } catch {
    return new Error(null);
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
    return new Ok(null);
  } catch {
    return new Error(null);
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
    return new Ok(val);
  } else {
    return new Error(null);
  }
}
