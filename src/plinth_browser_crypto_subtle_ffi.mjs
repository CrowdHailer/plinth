import { toBitArray } from "../gleam_stdlib/gleam.mjs"
import { Ok, Error } from "./gleam.mjs";

export async function digest(algorithm, data) {
  try {
    let hashed = await globalThis.crypto.subtle.digest(algorithm, data.rawBuffer);
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

export async function importKey(format, keyData, algorithm, extractable, keyUsages) {
  try {
    let imported = await globalThis.crypto.subtle.importKey(format, keyData.rawBuffer, algorithm, extractable, keyUsages);
    return new Ok(imported)
  } catch (error) {
    return new Error(`${error}`)
  }
}


export async function importJwk(keyData, algorithm, extractable, keyUsages) {
  try {
    let imported = await globalThis.crypto.subtle.importKey("jwk", keyData, algorithm, extractable, keyUsages);
    return new Ok(imported)
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function sign(algorithm, key, data) {
  try {
    let signed = await globalThis.crypto.subtle.sign(algorithm, key, data.rawBuffer);
    return new Ok(toBitArray(new Uint8Array(signed)))
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function verify(algorithm, key, signature, data) {
  try {
    let valid = await globalThis.crypto.subtle.verify(algorithm, key, signature.rawBuffer, data.rawBuffer);
    return new Ok(valid)
  } catch (error) {
    return new Error(`${error}`)
  }
}