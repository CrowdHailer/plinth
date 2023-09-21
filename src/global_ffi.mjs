export function setTimeout(callback, delay) {
  globalThis.setTimeout(callback, delay);
}

export function log(value) {
  console.log(value);
}
