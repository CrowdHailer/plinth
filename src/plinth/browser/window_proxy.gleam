//// This is a module for Window like objects
//// 
//// Functions such as window.opener return a WindowProxy.
//// This is not part of the inheritance chain of Window.
//// To type the API of window.gleam well proxy needs to be
//// in a separate module, this module.
//// 
//// https://developer.mozilla.org/en-US/docs/Glossary/WindowProxy
//// 
//// Most implementations call into window_ffi.

import gleam/json.{type Json}
import plinth/browser/location.{type Location}
import plinth/browser/message_event

pub type WindowProxy

@external(javascript, "../../window_ffi.mjs", "close")
pub fn close(proxy: WindowProxy) -> Nil

@external(javascript, "../../window_ffi.mjs", "location")
pub fn location(proxy: WindowProxy) -> Location

/// Post a message to the proxied window.
/// handle messages in the target window by listening for "message" events.
/// 
/// Data is sent in as Json because this is a useful subset for structured clone values
@external(javascript, "../../window_ffi.mjs", "postMessage")
pub fn post_message(proxy: WindowProxy, message: Json, origin: String) -> Nil

@external(javascript, "../../window_ffi.mjs", "onMessage")
pub fn on_message(
  worker: WindowProxy,
  handle: fn(message_event.MessageEvent) -> Nil,
) -> Nil
