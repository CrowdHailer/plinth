import { Ok, Error } from "./gleam.mjs";
import { Open } from "./plinth/browser/shadow.mjs"

export function appendChild(root, element) {
  root.appendChild(element)
}

export function attachShadow(element, mode) {
  const shadowMode = mode instanceof Open ? "open" : "closed"
  return element.attachShadow({ mode: shadowMode })
}

export function shadowRoot(element) {
  let shadowRoot = element.shadowRoot;
  if (shadowRoot) {
    return new Ok(shadowRoot);
  }
  return new Error();
}

export function querySelector(shadowRoot, selector) {
  let element = shadowRoot.querySelector(selector);
  if (element) {
    return new Ok(element);
  }
  return new Error();
}

export function querySelectorAll(shadowRoot, selector) {
  return shadowRoot.querySelectorAll(selector);
}