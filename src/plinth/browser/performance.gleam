//// Bindings to the [High Resolution Time API](https://www.w3.org/TR/hr-time/),
//// available in window and worker contexts.

pub type Performance

/// Returns the current global's performance object if available.
@external(javascript, "../../performance_ffi.mjs", "getPerformance")
pub fn get() -> Result(Performance, Nil)

/// Milliseconds since this performance object's time origin.
/// The browser may reduce the clock's precision for privacy reasons.
/// The clock is monotonic, unlike JavaScript's `Date.now()`.
@external(javascript, "../../performance_ffi.mjs", "now")
pub fn now(performance: Performance) -> Float
