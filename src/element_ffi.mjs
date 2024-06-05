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

export async function requestFullscreen(element) {
  try {
    await element.requestFullscreen();
    return new Ok();
  } catch (error) {
    return new Error(error.toString());
  }
}

export function scrollIntoView(element) {
  element.scrollIntoView({ behavior: "smooth", block: "nearest" });
}

export function scrollHeight(element) {
  return element.scrollHeight;
}

export function scrollLeft(element) {
  return element.scrollLeft;
}

export function scrollTop(element) {
  return element.scrollTop;
}

export function scrollWidth(element) {
  return element.scrollWidth;
}

export function setScrollHeight(element, value) {
  element.scrollHeight = value;
}

export function setScrollLeft(element, value) {
  element.scrollLeft = value;
}

export function setScrollTop(element, value) {
  element.scrollTop = value;
}

export function setScrollWidth(element, value) {
  element.scrollWidth = value;
}

export function value(element) {
  let value = element.value;
  if (value != undefined) {
    return new Ok(value);
  }
  return new Error();
}

export function setValue(element, value) {
  element.value = value;
}

export function selectionStart(element) {
  let value = element.selectionStart;
  if (value != undefined) {
    return new Ok(value);
  }
  return new Error();
}

export function setSelectionRange(element, start, end) {
  element.setSelectionRange(start, end);
}

export function focus(element) {
  element.focus();
}

export function appendChild(parent, child) {
  parent.appendChild(child)
}
