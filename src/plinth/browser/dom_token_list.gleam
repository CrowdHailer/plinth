import gleam/javascript/array.{type Array}
import gleam/option.{type Option}

pub type DomTokenList

/// The `add()` method adds the given tokens to the list, omitting any that are already present
/// https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/add
///
@external(javascript, "../../dom_token_list_ffi.mjs", "add")
pub fn add(dom_token_list: DomTokenList, tokens: Array(String)) -> Nil

/// The `remove()` method removes the specified tokens from the list
/// https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/remove
///
@external(javascript, "../../dom_token_list_ffi.mjs", "remove")
pub fn remove(dom_token_list: DomTokenList, tokens: Array(String)) -> Nil

/// The `toggle()` method removes an existing token from the list and returns false.
/// If the token doesn't exist it's added and the function returns true.
/// https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/toggle
///
/// `force`: If included, turns the toggle into a one way-only operation.
///   If set to false, then token will only be removed, but not added.
///   If set to true, then token will only be added, but not removed.
///
@external(javascript, "../../dom_token_list_ffi.mjs", "toggle")
pub fn toggle(
  dom_token_list: DomTokenList,
  token: String,
  force force: Option(Bool),
) -> Bool

/// The `replace()` method replaces an existing token with a new token.
/// If the first token doesn't exist, `replace()` returns false immediately,
/// without adding the new token to the token list.
/// https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList/replace
@external(javascript, "../../dom_token_list_ffi.mjs", "replace")
pub fn replace(
  dom_token_list: DomTokenList,
  from_token: String,
  to_token: String,
) -> Bool
