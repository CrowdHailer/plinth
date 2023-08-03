pub type BigInt

/// `+` operation
@external(javascript, "../../big_int_ffi.mjs", "add")
pub fn add(a: BigInt, b: BigInt) -> BigInt

/// `*` operation
@external(javascript, "../../big_int_ffi.mjs", "multiply")
pub fn multiply(a: BigInt, b: BigInt) -> BigInt

/// `-` operation
@external(javascript, "../../big_int_ffi.mjs", "subtract")
pub fn subtract(a: BigInt, b: BigInt) -> BigInt

/// `%` operation
@external(javascript, "../../big_int_ffi.mjs", "modulo")
pub fn modulo(a: BigInt, b: BigInt) -> BigInt

/// `**` operation
@external(javascript, "../../big_int_ffi.mjs", "power")
pub fn power(a: BigInt, b: BigInt) -> BigInt

/// `/` operation
@external(javascript, "../../big_int_ffi.mjs", "divide")
pub fn divide(a: BigInt, b: BigInt) -> BigInt

@external(javascript, "../../big_int_ffi.mjs", "from")
pub fn from_int(a: Int) -> BigInt

@external(javascript, "../../big_int_ffi.mjs", "from")
pub fn from_string(a: String) -> BigInt
