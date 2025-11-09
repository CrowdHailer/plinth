import { Result$Ok, Result$Error } from "./gleam.mjs";

function cast(raw, constructor) {
  if (raw instanceof constructor) {
    return Result$Ok(raw)
  } else {
    return Result$Error()
  }
}

export function castEvent(raw) {
  return cast(raw, Event)
}

export function target(event) {
  return event.target;
}

export function currentTarget(event) {
  return event.currentTarget;
}

export function preventDefault(event) {
  return event.preventDefault();
}

export function stopPropagation(event) {
  return event.stopPropagation();
}

export function castKeyboardEvent(raw) {
  return cast(raw, KeyboardEvent)
}

export function altKey(event) {
  return event.altKey;
}

export function code(event) {
  return event.code;
}

export function ctrlKey(event) {
  return event.ctrlKey;
}

export function isComposing(event) {
  return event.isComposing;
}

export function key(event) {
  return event.key;
}

export function metaKey(event) {
  return event.metaKey;
}

export function shiftKey(event) {
  return event.shiftKey;
}
