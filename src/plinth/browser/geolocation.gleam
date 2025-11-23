import gleam/dynamic.{type Dynamic}
import gleam/dynamic/decode
import gleam/javascript/promise
import gleam/option.{type Option}
import gleam/string
import plinth/decodex

pub type GeolocationPosition {
  GeolocationPosition(
    latitude: Float,
    longitude: Float,
    altitude: Option(Float),
    accuracy: Float,
    altitude_accuracy: Option(Float),
    heading: Option(Float),
    speed: Option(Float),
    // separate timestamp field in native object
    timestamp: Float,
  )
}

pub fn decoder() {
  use timestamp <- decode.field("timestamp", decodex.float_or_int())
  use n <- decode.field("coords", {
    use latitude <- decode.field("latitude", decodex.float_or_int())
    use longitude <- decode.field("longitude", decodex.float_or_int())
    use altitude <- decode.field(
      "altitude",
      decode.optional(decodex.float_or_int()),
    )
    use accuracy <- decode.field("accuracy", decodex.float_or_int())
    use altitude_accuracy <- decode.field(
      "altitudeAccuracy",
      decode.optional(decodex.float_or_int()),
    )
    use heading <- decode.field(
      "heading",
      decode.optional(decodex.float_or_int()),
    )
    use speed <- decode.field("speed", decode.optional(decodex.float_or_int()))
    decode.success(GeolocationPosition(
      latitude,
      longitude,
      altitude,
      accuracy,
      altitude_accuracy,
      heading,
      speed,
      timestamp,
    ))
  })
  decode.success(n)
}

@external(javascript, "../../geolocation_ffi.mjs", "getCurrentPosition")
pub fn get_current_position(
  success: fn(Dynamic) -> Nil,
  error: fn(Dynamic) -> Nil,
) -> Nil

pub fn current_position() {
  promise.new(fn(resolve) {
    get_current_position(
      fn(position) {
        case decode.run(position, decoder()) {
          Ok(position) -> Ok(position)
          Error(reason) -> Error(string.inspect(reason))
        }
        |> resolve()
      },
      fn(error) { resolve(Error(string.inspect(error))) },
    )
  })
}
