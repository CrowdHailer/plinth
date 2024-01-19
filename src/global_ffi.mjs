export function setTimeout(callback, delay) {
  globalThis.setTimeout(callback, delay);
}

export function encodeURI(value) {
  return globalThis.encodeURI(value);
}

export function decodeURI(value) {
  return globalThis.decodeURI(value);
}

export function decodeURIComponent(value) {
  return globalThis.decodeURIComponent(value);
}

export function log(value) {
  console.log(value);
}
