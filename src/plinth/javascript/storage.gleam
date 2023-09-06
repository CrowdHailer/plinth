//// Bindings to local and session storage.

/// A Storage object (local or session).
/// 
/// See [https://developer.mozilla.org/en-US/docs/Web/API/Storage](https://developer.mozilla.org/en-US/docs/Web/API/Storage).
pub type Storage

/// Attempts to get the local storage object, fails if it's not available.
@external(javascript, "../../storage_ffi.mjs", "localStorage")
pub fn local() -> Result(Storage, Nil)

/// Attempts to get the session storage object, fails if it's not available.
@external(javascript, "../../storage_ffi.mjs", "sessionStorage")
pub fn session() -> Result(Storage, Nil)

/// Returns the amount of items in the storage.
@external(javascript, "../../storage_ffi.mjs", "length")
pub fn length(storage: Storage) -> Int

/// Returns the key of the item with the index `index`, if it exists.
@external(javascript, "../../storage_ffi.mjs", "key")
pub fn key(storage: Storage, index: Int) -> Result(String, Nil)

/// Returns the item with the specified key, if it exists.
@external(javascript, "../../storage_ffi.mjs", "getItem")
pub fn get_item(storage: Storage, key: String) -> Result(String, Nil)

/// Adds or updates an item with the specified key. If the storage is full, an error is returned.
@external(javascript, "../../storage_ffi.mjs", "setItem")
pub fn set_item(
  storage: Storage,
  key: String,
  value: String,
) -> Result(Nil, Nil)

/// Removes an item with the specified key.
@external(javascript, "../../storage_ffi.mjs", "removeItem")
pub fn remove_item(storage: Storage, key: String) -> Nil

/// Clears the storage of all items.
@external(javascript, "../../storage_ffi.mjs", "clear")
pub fn clear(storage: Storage) -> Nil
