import gleam/dynamic
import gleam/javascript/promise
import gleam/option.{type Option}
import gleam/string

pub type JSGeolocationPosition

pub type JSGeolocationPositionError

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

pub fn decode(raw) {
  dynamic.decode8(
    GeolocationPosition,
    dynamic.field("coords", dynamic.field("latitude", dynamic.float)),
    dynamic.field("coords", dynamic.field("longitude", dynamic.float)),
    dynamic.field(
      "coords",
      dynamic.field("altitude", dynamic.optional(dynamic.float)),
    ),
    dynamic.field("coords", dynamic.field("accuracy", dynamic.float)),
    dynamic.field(
      "coords",
      dynamic.field("altitudeAccuracy", dynamic.optional(dynamic.float)),
    ),
    dynamic.field(
      "coords",
      dynamic.field("heading", dynamic.optional(dynamic.float)),
    ),
    dynamic.field(
      "coords",
      dynamic.field("speed", dynamic.optional(dynamic.float)),
    ),
    dynamic.field("timestamp", dynamic.float),
  )(raw)
}

@external(javascript, "../../geolocation_ffi.mjs", "getCurrentPosition")
pub fn get_current_position(
  success: fn(JSGeolocationPosition) -> Nil,
  error: fn(JSGeolocationPositionError) -> Nil,
) -> Nil

pub fn current_position() {
  promise.new(fn(resolve) {
    get_current_position(
      fn(position) {
        case decode(dynamic.from(position)) {
          Ok(position) -> Ok(position)
          Error(reason) -> Error(string.inspect(reason))
        }
        |> resolve()
      },
      fn(error) { resolve(Error(string.inspect(error))) },
    )
  })
}
