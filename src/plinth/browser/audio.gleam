import gleam/javascript/promise.{type Promise}

pub type Audio

@external(javascript, "../../audio_ffi.mjs", "newAudio")
pub fn new(url: String) -> Audio

@external(javascript, "../../audio_ffi.mjs", "play")
pub fn play(audio: Audio) -> Promise(Result(Nil, String))
