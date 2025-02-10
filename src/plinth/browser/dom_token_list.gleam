import gleam/javascript/array.{type Array}
import gleam/option.{type Option}

pub type DomTokenList

@external(javascript, "../../dom_token_list_ffi.mjs", "add")
pub fn add(dom_token_list: DomTokenList, tokens: Array(String)) -> Nil

@external(javascript, "../../dom_token_list_ffi.mjs", "remove")
pub fn remove(dom_token_list: DomTokenList, tokens: Array(String)) -> Nil

@external(javascript, "../../dom_token_list_ffi.mjs", "toggle")
pub fn toggle(
  dom_token_list: DomTokenList,
  token: String,
  force force: Option(Bool),
) -> Nil

@external(javascript, "../../dom_token_list_ffi.mjs", "replace")
pub fn replace(
  dom_token_list: DomTokenList,
  from_token: String,
  to_token: String,
) -> Nil
