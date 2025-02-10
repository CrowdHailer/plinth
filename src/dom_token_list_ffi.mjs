import { unwrap } from "../gleam_stdlib/gleam/option.mjs";

export function add(domTokenList, tokens) {
  domTokenList.add(...tokens);
}

export function remove(domTokenList, tokens) {
  domTokenList.remove(...tokens);
}

export function toggle(domTokenList, token, force) {
  domTokenList.toggle(token, unwrap(force, undefined));
}

export function replace(domTokenList, from, to) {
  domTokenList.replace(from, to);
}
