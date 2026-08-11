import { Result$Ok, Result$Error } from "./gleam.mjs";
import { Option$Some, Option$None } from "../gleam_stdlib/gleam/option.mjs";

export function localStorage() {
  try {
    // accessing .localStorage can throw `SecurityError`
    const storage = globalThis.localStorage;
    if (globalThis.Storage && storage instanceof globalThis.Storage) {
      return Result$Ok(storage);
    } else {
      return Result$Error("localStorage is not available");
    }
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function sessionStorage() {
  // accessing .sessionStorage can throw `SecurityError`
  try {
    const storage = globalThis.sessionStorage;
    if (globalThis.Storage && storage instanceof globalThis.Storage) {
      return Result$Ok(storage);
    } else {
      return Result$Error("sessionStorage is not available");
    }
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function length(storage) {
  return storage.length;
}

export function key(storage, index) {
  const value = storage.key(index);
  if (value !== null) {
    return Result$Ok(value);
  } else {
    return Result$Error();
  }
}

export function getItem(storage, keyName) {
  try {
    const value = storage.getItem(keyName);
    const option = value === null ? Option$None() : Option$Some(value);
    return Result$Ok(option);
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function setItem(storage, keyName, keyValue) {
  try {
    storage.setItem(keyName, keyValue);
    return Result$Ok(null);
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function removeItem(storage, keyName) {
  storage.removeItem(keyName);
}

export function clear(storage) {
  storage.clear();
}
