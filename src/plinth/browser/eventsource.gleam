import plinth/browser/event
import plinth/browser/message_event

pub type EventSource

/// Returns the EventSource constructor if it's available in the current JavaScript environment.
/// 
/// Starting an event source doesn't return an error any url is accepted.
/// If the url provided is not valid it will be treated as a path of the current origin.
@external(javascript, "../../plinth_browser_eventsource_ffi.mjs", "constructor")
pub fn constructor() -> Result(fn(String, Bool) -> EventSource, Nil)

@external(javascript, "../../plinth_browser_eventsource_ffi.mjs", "on_open")
pub fn on_open(source: EventSource, handle: fn(event.Event(Nil)) -> Nil) -> Nil

@external(javascript, "../../plinth_browser_eventsource_ffi.mjs", "on_close")
pub fn on_close(source: EventSource, handle: fn(event.Event(Nil)) -> Nil) -> Nil

@external(javascript, "../../plinth_browser_eventsource_ffi.mjs", "on_message")
pub fn on_message(
  source: EventSource,
  handle: fn(message_event.MessageEvent) -> Nil,
) -> Nil
