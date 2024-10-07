export function setTimeout(delay, callback) {
  return globalThis.setTimeout(callback, delay);
}

export function clearTimeout(timer) {
  globalThis.clearTimeout(timer);
}

export function setInterval(delay, callback) {
  return globalThis.setInterval(callback, delay);
}

export function clearInterval(timer) {
  globalThis.clearInterval(timer);
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
