import { Result$Ok, Result$Error, BitArray$BitArray } from "./gleam.mjs";

export function getRandomValues(crypto, length) {
  try {
    const array = new Uint8Array(length);
    crypto.getRandomValues(array)
    return Result$Ok(BitArray$BitArray(array))
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export function randomUUID(crypto) {
  return crypto.randomUUID()
}