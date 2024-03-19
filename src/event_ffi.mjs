export function target(event) {
  return event.target;
}

export function constructorName(value) {
  return value.constructor.name;
}

export function toKeyboardEventUnsafe(event) {
  return {
    event,
    alt_key: event.altKey,
    code: event.code,
    ctrl_key: event.ctrlKey,
    is_composing: event.isComposing,
    key: event.key,
    location: event.location,
    meta_key: event.meta_key,
    repeat: event.repeat,
    shift_key: event.shift_key,
  };
}
