export function log(value) {
  console.log(value);
}

export function warn(value) {
  console.warn(value);
}

export function error(value) {
  console.error(value);
}

export function debug(value) {
  console.debug(value);
}

export function info(value) {
  console.info(value);
}

export function assert(assertion, value) {
  console.assert(assertion, value);
}

export function clear() {
  console.clear();
}

export function group(label) {
  console.group(label);
}

export function group_collapsed(label) {
  console.groupCollapsed(label);
}

export function group_end() {
  console.groupEnd();
}
