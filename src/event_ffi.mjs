import { Ok, Error } from "./gleam.mjs";

export function cast(raw) {
  if (raw instanceof Event) {
    return new Ok(raw)
  } else {
    return new Error()
  }
}

export function target(event) {
  return event.target;
}

export function key(event) {
  return event.key;
}

export function keyCode(event) {
  return event.keyCode;
}

export function preventDefault(event) {
  return event.preventDefault();
}

export function stopPropagation(event) {
  return event.stopPropagation();
}
