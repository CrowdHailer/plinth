import gleam/json.{type Json}

pub type Message

pub type Client

@external(javascript, "../../message_ffi.mjs", "data")
pub fn data(message: Message) -> Json

@external(javascript, "../../message_ffi.mjs", "origin")
pub fn origin(message: Message) -> String

// I think this is a client id
@external(javascript, "../../message_ffi.mjs", "source")
pub fn source(message: Message) -> Client

// I think this is a client id
@external(javascript, "../../message_ffi.mjs", "client_id")
pub fn client_id(client: Client) -> String
