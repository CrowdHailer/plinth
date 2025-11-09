import { Result$Ok, Result$Error } from "./gleam.mjs";

export function cast(raw) {
  if (raw instanceof Element) {
    return Result$Ok(raw);
  } else {
    return Result$Error();
  }
}

export function getAttribute(element, name) {
  let attribute = element.getAttribute(name);
  if (attribute) {
    return Result$Ok(attribute);
  }
  return Result$Error();
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
    return Result$Ok(target.insertAdjacentElement(position, element));
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function insertAdjacentHTML(target, position, element) {
  try {
    return Result$Ok(target.insertAdjacentHTML(position, element));
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function insertAdjacentText(target, position, element) {
  try {
    return Result$Ok(target.insertAdjacentText(position, element));
  } catch (error) {
    return Result$Error(`${error}`);
  }
}

export function nextElementSibling(element) {
  let sibling = element.nextElementSibling;
  if (sibling) {
    return Result$Ok(sibling);
  }
  return Result$Error();
}

export function closest(element, selector) {
  let ancestor = element.closest(selector);
  if (ancestor) {
    return Result$Ok(ancestor);
  }
  return Result$Error();
}

export async function requestFullscreen(element) {
  try {
    await element.requestFullscreen();
    return Result$Ok();
  } catch (error) {
    return Result$Error(error.toString());
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
    return Result$Ok(value);
  }
  return Result$Error();
}

export function setValue(element, value) {
  element.value = value;
}

export function selectionStart(element) {
  let value = element.selectionStart;
  if (value != undefined) {
    return Result$Ok(value);
  }
  return Result$Error();
}

export function setSelectionRange(element, start, end) {
  element.setSelectionRange(start, end);
}

export function focus(element) {
  element.focus();
}

export function blur(element) {
  element.blur();
}

export function appendChild(parent, child) {
  parent.appendChild(child);
}

export function remove(element) {
  element.remove();
}

export function datasetGet(el, key) {
  if (key in el.dataset) {
    return Result$Ok(el.dataset[key]);
  }
  return Result$Error(undefined);
}

export function getChecked(el) {
  return el.checked;
}

export function setTextContent(element, text) {
  element.textContent = text;
}

export function contains(element, other) {
  return element.contains(other);
}

export function classList(element) {
  return element.classList;
}
