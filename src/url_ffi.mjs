import { Result$Ok, Result$Error } from "./gleam.mjs";
import { unwrap, is_some, Option$Some, Option$None } from "../gleam_stdlib/gleam/option.mjs";

export function new_(url, base ) {
  try {
    if (is_some(base)) {
      return Result$Ok(new URL(url, unwrap(base, undefined)));
    } else {
      return Result$Ok(new URL(url))
    }
  } catch (error) {
    return Result$Error(error.toString())
  }
}

export function to_json(url) {
  return url.toJSON();
}

export function to_string(url) {
  return url.toString();
}

export function host(url) {
  if (url.host === "") {
    return Option$None();
  } else {
    return Option$Some(url.host)
  }
}

export function hostname(url) {
  if (url.hostname === "") {
    return Option$None();
  } else {
    return Option$Some(url.hostname)
  }
}

export function href(url) {
  return url.href;
}

export function origin(url) {
  if (url.origin === "null") {
    return Option$None();
  } else {
    return Option$Some(url.origin)
  }
}

export function password(url) {
  if (url.password === "") {
    return Option$None();
  } else {
    return Option$Some(url.password)
  }
}

export function pathname(url) {
  if (url.pathname === "") {
    return Option$None();
  } else {
    return Option$Some(url.pathname)
  }
}

export function protocol(url) {
  return url.protocol;
}

export function search(url) {
  if (url.search === "") {
    return Option$None();
  } else {
    return Option$Some(url.search)
  }
}

export function search_params(url) {
  if (url.searchParams === "") {
    return Option$None();
  } else {
    return Option$Some(url.searchParams)
  }
}

export function username(url) {
  if (url.username === "") {
    return Option$None();
  } else {
    return Option$Some(url.username)
  }
}
