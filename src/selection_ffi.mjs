import { Result$Ok, Result$Error } from "./gleam.mjs";

export function getSelection() {
  const selection = window.getSelection();
  if (!selection) {
    return Result$Error();
  }
  return Result$Ok(selection);
}

export function getRangeAt(selection, index) {
  const range = selection.getRangeAt(index);
  if (!range) {
    return Result$Error();
  }
  return Result$Ok(range);
}
