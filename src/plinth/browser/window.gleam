import gleam/javascript/promise.{type Promise}
import plinth/browser/event.{type Event}

pub type Window

@external(javascript, "../../window_ffi.mjs", "self")
pub fn self() -> Window

@external(javascript, "../../window_ffi.mjs", "addEventListener")
pub fn add_event_listener(type_: String, listener: fn(Event) -> Nil) -> Nil

pub type WakeLockSentinal

// part of the navigator API as navigators are not valuable to pass around moved to window module
@external(javascript, "../../window_ffi.mjs", "requestWakeLock")
pub fn request_wake_lock() -> Promise(Result(WakeLockSentinal, Nil))

@external(javascript, "../../window_ffi.mjs", "location")
pub fn location() -> String

@external(javascript, "../../window_ffi.mjs", "locationOf")
pub fn location_of(window: Window) -> String

// reload exists on the location object but exposed at top level here
@external(javascript, "../../window_ffi.mjs", "reload")
pub fn reload() -> Nil

// I'm not sure how much value there is in specific hash/search function

@external(javascript, "../../window_ffi.mjs", "getHash")
pub fn get_hash() -> Result(String, Nil)

@external(javascript, "../../window_ffi.mjs", "getSearch")
pub fn get_search() -> Result(String, Nil)

@external(javascript, "../../window_ffi.mjs", "innerHeight")
pub fn inner_height(window: Window) -> Int

@external(javascript, "../../window_ffi.mjs", "innerWidth")
pub fn inner_width(window: Window) -> Int

@external(javascript, "../../window_ffi.mjs", "outerHeight")
pub fn outer_height(window: Window) -> Int

@external(javascript, "../../window_ffi.mjs", "outerWidth")
pub fn outer_width(window: Window) -> Int

@external(javascript, "../../window_ffi.mjs", "open")
pub fn open(
  url: String,
  name: String,
  features: String,
) -> Result(Window, String)

@external(javascript, "../../window_ffi.mjs", "close")
pub fn close(window: Window) -> Bool

@external(javascript, "../../window_ffi.mjs", "closed")
pub fn closed(window: Window) -> Bool
