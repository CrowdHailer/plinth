import gleam/json.{type Json}
import plinth/browser/message.{type Message}

pub type BroadcastChannel

@external(javascript, "../../broadcast_channel_ffi.mjs", "new_")
pub fn new(channel_name: String) -> Result(BroadcastChannel, String)

@external(javascript, "../../broadcast_channel_ffi.mjs", "postMessage")
pub fn post_message(
  channel: BroadcastChannel,
  message: Json,
) -> Result(Nil, String)

@external(javascript, "../../broadcast_channel_ffi.mjs", "onMessage")
pub fn on_message(worker: BroadcastChannel, handle: fn(Message) -> Nil) -> Nil
