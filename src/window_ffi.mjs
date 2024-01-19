import { Ok, Error } from "./gleam.mjs";

export function self() {
  return window;
}

export function alert(message) {
  window.alert(message);
}

export function addEventListener(type, listener) {
  return window.addEventListener(type, listener);
}

export async function requestWakeLock() {
  try {
    return new Ok(await window.navigator.wakeLock.request("screen"));
  } catch (error) {
    return new Error(error.toString());
  }
}

export function location() {
  return window.location.href;
}

export function locationOf(w) {
  return w.location.href;
}

export function reload() {
  return window.location.reload();
}

export function getHash() {
  const hash = window.location.hash;
  if (hash == "") {
    return new Error();
  }

  return decodeURIComponent(hash.slice(1));
}

export function getSearch() {
  const search = window.location.search;
  if (search == "") {
    return new Error();
  }

  return decodeURIComponent(search.slice(1));
}

export function innerHeight(w) {
  return w.innerHeight;
}

export function innerWidth(w) {
  return w.innerWidth;
}

export function outerHeight(w) {
  return w.outerHeight;
}

export function outerWidth(w) {
  return w.outerWidth;
}

export function open(url, target, features) {
  try {
    return new Ok(window.open(url, target, features));
  } catch (error) {
    return new Error(error.toString());
  }
}

export function close(w) {
  w.close();
}

export function closed(w) {
  return w.closed;
}
