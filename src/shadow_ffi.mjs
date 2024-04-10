import { Open } from "./plinth/browser/shadow.mjs"

export function appendChild(root, element) {
  root.appendChild(element)
}

export function attachShadow(element, mode) {
  const shadowMode = mode instanceof Open ? "open" : "closed"
  return element.attachShadow({ mode: shadowMode })
}
