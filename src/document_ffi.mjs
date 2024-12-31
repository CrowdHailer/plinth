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
  return document.createElement(tagName);
}

export function createTextNode(content) {
  return document.createTextNode(content);
}

export function body() {
  return document.body;
}

export function getElementById(id) {
  let found = document.getElementById(id);
  if (!found) {
    return new Error();
  }
  return new Ok(found);
}

export function getElementsByTagName(tagName) {
  return Array.from(document.getElementsByTagName(tagName));
}

export function readyState() {
  return document.readyState;
}

export function hidden() {
  return document.hidden;
}

export function visibilityState() {
  return document.visibilityState;
}

export function title() {
  return document.title;
}

export function setTitle(title) {
  document.title = title;
}

export function fullscreenElement(document) {
  let found = document.fullscreenElement;
  if (!found) {
    return new Error();
  }
  return new Ok(found);
}

export async function exitFullscreen(document) {
  try {
    return new Ok(await document.exitFullscreen())
  } catch (error) {
    return new Error(`${error}`)
  }
}