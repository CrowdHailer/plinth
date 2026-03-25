import { Result$Ok, Result$Error } from "./gleam.mjs";

export function constructor() {
  if (globalThis.EventSource) {
    return Result$Ok(function (url, withCredentials) {
      return new globalThis.EventSource(url, { withCredentials })
    })
  } else {
    return Result$Error()
  }
}

export function on_open(event_source, callback) {
  event_source.onopen = callback
}

export function on_close(event_source, callback) {
  event_source.onclose = callback
}

export function on_message(event_source, callback) {
  event_source.onmessage = callback
}