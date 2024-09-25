import { Ok, Error } from "./gleam.mjs";

export function cast(raw) {
  if (raw instanceof Element) {
    return new Ok(raw)
  } else {
    return new Error()
  }
}

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

export function addEventListener(element, type, listener) {
  return element.addEventListener(type, listener);
}

export function setInnerHTML(element, content) {
  element.innerHTML = content;
}

export function innerText(element) {
  return element.innerText;
}

export function setInnerText(element, content) {
  element.innerText = content;
}

export function insertAdjacentElement(target, position, element) {
  try {
    return new Ok(target.insertAdjacentElement(position, element));
  } catch (error) {
    return new Error(`${error}`);
  }
}

export function insertAdjacentHTML(target, position, element) {
  try {
    return new Ok(target.insertAdjacentHTML(position, element));
  } catch (error) {
    return new Error(`${error}`);
  }
}

export function insertAdjacentText(target, position, element) {
  try {
    return new Ok(target.insertAdjacentText(position, element));
  } catch (error) {
    return new Error(`${error}`);
  }
}

export function nextElementSibling(element) {
  let sibling = element.nextElementSibling;
  if (sibling) {
    return new Ok(sibling);
  }
  return new Error();
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
  parent.appendChild(child);
}

export function remove(element) {
  element.remove();
}

export function datasetGet(el, key) {
  if (key in el.dataset) {
    return new Ok(el.dataset[key]);
  }
  return new Error(undefined);
}

export function getChecked(el) {
  return el.checked;
}

export function setTextContent(element, text) {
  element.textContent = text;
}
