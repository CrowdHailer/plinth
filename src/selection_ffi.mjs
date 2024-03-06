import { Ok, Error } from "./gleam.mjs";

export function getSelection() {
  const selection = window.getSelection();
  if (!selection) {
    return new Error();
  }
  return new Ok(selection);
}

export function getRangeAt(selection, index) {
  const range = selection.getRangeAt(index);
  if (!range) {
    return new Error();
  }
  return new Ok(range);
}
