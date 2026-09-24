import { Result$Ok, Result$Error } from "./gleam.mjs";

export function origin(location) {
  return location.origin;
}

export function host(location) {
  return location.host;
}

export function hostname(location) {
  return location.hostname;
}

export function port(location) {
  return location.port;
}

export function protocol(location) {
  return location.protocol;
}

export function pathname(location) {
  return location.pathname;
}

export function reload(location) {
  return location.reload();
}

export function href(location) {
  return location.href;
}


export function hash(location) {
  const hash = location.hash;
  if (hash == "") {
    return Result$Error();
  }

  return Result$Ok(decodeURIComponent(hash.slice(1)));
}

export function search(location) {
  const search = location.search;
  if (search == "") {
    return Result$Error();
  }

  return Result$Ok(decodeURIComponent(search.slice(1)));
}
