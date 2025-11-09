import { Result$Ok, Result$Error } from "./gleam.mjs";
import { Mode$isOpen } from "./plinth/browser/shadow.mjs"

export function appendChild(root, element) {
  root.appendChild(element)
}

export function attachShadow(element, mode) {
  const shadowMode = Mode$isOpen(mode) ? "open" : "closed"
  return element.attachShadow({ mode: shadowMode })
}

export function shadowRoot(element) {
  let shadowRoot = element.shadowRoot;
  if (shadowRoot) {
    return Result$Ok(shadowRoot);
  }
  return Result$Error();
}

export function querySelector(shadowRoot, selector) {
  let element = shadowRoot.querySelector(selector);
  if (element) {
    return Result$Ok(element);
  }
  return Result$Error();
}

export function querySelectorAll(shadowRoot, selector) {
  return shadowRoot.querySelectorAll(selector);
}