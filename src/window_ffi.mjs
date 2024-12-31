import { Ok, Error } from "./gleam.mjs";

export function self() {
  return globalThis;
}

export function alert(message) {
  window.alert(message);
}

export function prompt(message, defaultValue) {
  let text = window.prompt(message, defaultValue);
  if (text !== null) {
    return new Ok(text);
  } else {
    return new Error();
  }
}

export function addEventListener(type, listener) {
  return window.addEventListener(type, listener);
}

export function document(window) {
  return window.document;
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
  try {
    return new Ok(w.location.href);
  } catch (error) {
    return new Error(error.toString());
  }
}

export function setLocation(w, url) {
  w.location.href = url;
}

export function origin() {
  return window.location.origin;
}

export function pathname() {
  return window.location.pathname;
}

export function reload() {
  return window.location.reload();
}

export function reloadOf(w) {
  return w.location.reload();
}

export function focus(w) {
  return w.focus();
}

export function getHash() {
  const hash = window.location.hash;
  if (hash == "") {
    return new Error();
  }

  return new Ok(decodeURIComponent(hash.slice(1)));
}

export function getSearch() {
  const search = window.location.search;
  if (search == "") {
    return new Error();
  }

  return new Ok(decodeURIComponent(search.slice(1)));
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

export function screenX(w) {
  return w.screenX;
}

export function screenY(w) {
  return w.screenY;
}

export function screenTop(w) {
  return w.screenTop;
}

export function screenLeft(w) {
  return w.screenLeft;
}

export function scrollX(w) {
  return w.scrollX;
}

export function scrollY(w) {
  return w.scrollY;
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

export function queueMicrotask(callback) {
  return window.queueMicrotask(callback);
}

export function requestAnimationFrame(callback) {
  return window.requestAnimationFrame(callback);
}

export function cancelAnimationFrame(callback) {
  return window.cancelAnimationFrame(callback);
}

export function eval_(string) {
  try {
    return new Ok(eval(string));
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function import_(string) {
  try {
    return new Ok(await import(string));
  } catch (error) {
    return new Error(error.toString());
  }
}
