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

export async function verify(algorithm, key, signature, data) {
  try {
    let k= await globalThis.crypto.subtle.importKey('raw',key.buffer,{ name: "ECDSA","namedCurve": "P-256" },false,[])
    console.log(k)
    let algorithm = 'ECDSA'
    let r = await globalThis.crypto.subtle.verify(algorithm, key.buffer, signature.buffer, data.buffer);
    console.log(r)
    return new Ok(r)
  } catch (error) {
    return new Error(`${error}`)
  }
}