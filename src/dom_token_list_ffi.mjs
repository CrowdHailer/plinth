import { unwrap } from "../gleam_stdlib/gleam/option.mjs";

export function add(domTokenList, tokens) {
  domTokenList.add(...tokens);
}

export function remove(domTokenList, tokens) {
  domTokenList.remove(...tokens);
}

export function toggle(domTokenList, token, force) {
  return domTokenList.toggle(token, unwrap(force, undefined));
}

export function replace(domTokenList, from, to) {
  return domTokenList.replace(from, to);
}
