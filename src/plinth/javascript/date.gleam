pub type Date {
    Date
}

@external(javascript, "../../date_ffi.mjs", "now")
pub fn now() -> Date


@external(javascript, "../../date_ffi.mjs", "hours")
pub fn hours(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "minutes")
pub fn minutes(date: Date) -> Int

@external(javascript, "../../date_ffi.mjs", "seconds")
pub fn seconds(date: Date) -> Int
