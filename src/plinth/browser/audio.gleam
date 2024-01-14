import gleam/javascript/promise.{type Promise}

// Media is described as being only Audio or Video so this might be an occasion to use an Enum type.

pub type Audio

@external(javascript, "../../audio_ffi.mjs", "newAudio")
pub fn new(url: String) -> Audio

@external(javascript, "../../audio_ffi.mjs", "play")
pub fn play(audio: Audio) -> Promise(Result(Nil, String))
