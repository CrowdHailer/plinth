pub type Date {
  Date
}

@external(javascript, "../../date_ffi.mjs", "now")
pub fn now() -> Date

@external(javascript, "../../date_ffi.mjs", "toISOString")
pub fn to_iso_string(string: Date) -> String

@external(javascript, "../../date_ffi.mjs", "new_")
pub fn new(string: String) -> Date

@external(javascript, "../../date_ffi.mjs", "year")
pub fn year(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "month")
pub fn month(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "date")
pub fn date(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "day")
pub fn day(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "hours")
pub fn hours(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "minutes")
pub fn minutes(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "seconds")
pub fn seconds(date: Date) -> Int
