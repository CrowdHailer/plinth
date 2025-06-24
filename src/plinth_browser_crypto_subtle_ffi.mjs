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

export async function exportKey(format, key) {
  try {
    let exported = await globalThis.crypto.subtle.exportKey(format, key);
    return new Ok(exported)
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function exportJwk(key) {
  try {
    let exported = await globalThis.crypto.subtle.exportKey("jwk", key);
    return new Ok(exported)
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function generateKey(algorithm, extractable, keyUsages) {
  try {
    let { publicKey, privateKey } = await globalThis.crypto.subtle.generateKey(algorithm, extractable, keyUsages);
    return new Ok([publicKey, privateKey])
  } catch (error) {
    return new Error(`${error}`)
  }
}
export async function sign(algorithm, key, { buffer }) {
  try {
    let signed = await globalThis.crypto.subtle.sign(algorithm, key, buffer);
    return new Ok(toBitArray(new Uint8Array(signed)))
  } catch (error) {
    return new Error(`${error}`)
  }
}