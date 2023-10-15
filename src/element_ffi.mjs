import { Ok, Error } from "./gleam.mjs";

export function getAttribute(element, name) {
  let attribute = element.getAttribute(name);
  if (attribute) {
    return new Ok(attribute);
  }
  return new Error();
}

export function setAttribute(element, name, value) {
  element.setAttribute(name, value);
}

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
