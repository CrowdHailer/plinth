import gleam/dynamic.{type Dynamic}
import plinth/browser/event

pub type T

pub type MessageEvent =
  event.Event(T)

/// The data sent by the message emitter.
@external(javascript, "../../message_event_ffi.mjs", "data")
pub fn data(event: MessageEvent) -> Dynamic

/// A string representing the origin of the message emitter.
@external(javascript, "../../message_event_ffi.mjs", "origin")
pub fn origin(event: MessageEvent) -> String

/// A string representing a unique ID for the event.
@external(javascript, "../../message_event_ffi.mjs", "lastEventId")
pub fn last_event_id(event: MessageEvent) -> String
