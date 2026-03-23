import { Result$Ok, Result$Error } from "./gleam.mjs";

export function cast(raw) {
  if (raw instanceof HTMLSlotElement) {
    return Result$Ok(raw);
  } else {
    return Result$Error();
  }
}

export function assignedElements(slot) {
  return Array.from(slot.assignedElements());
}
