import { Ok, Error } from "./gleam.mjs";

export function querySelector(query) {
  let found = document.querySelector(query);
  if (!found) {
    return new Error();
  }
  return new Ok(found);
}

export function querySelectorAll(query) {
  return Array.from(document.querySelectorAll(query));
}

export function addEventListener(type, listener) {
  return document.addEventListener(type, listener);
}

export function createElement(tagName) {
  return document.createElement(tagName)
}

export function createTextNode(content) {
  return document.createTextNode(content)
}

export function body() {
  return document.body
}
