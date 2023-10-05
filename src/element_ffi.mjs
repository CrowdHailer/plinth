import { Ok, Error } from "./gleam.mjs";

export function setInnerHTML(element, content) {
  element.innerHTML = content;
}

export function innerText(element) {
  return element.innerText;
}

export function closest(element, selector) {
  let ancestor = element.closest(selector);
  if (ancestor) {
    return new Ok(ancestor);
  }
  return new Error();
}
