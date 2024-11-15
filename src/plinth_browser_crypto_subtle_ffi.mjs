import { toBitArray } from "../gleam_stdlib/gleam.mjs"
import { Ok, Error } from "./gleam.mjs";

export async function digest(algorithm, data) {
  try {
    let hashed = await globalThis.crypto.subtle.digest(algorithm, data.buffer);
    return new Ok(toBitArray(new Uint8Array(hashed)))
  } catch (error) {
    return new Error(`${error}`)
  }
}