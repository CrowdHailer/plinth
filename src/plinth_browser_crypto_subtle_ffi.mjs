import { Result$Ok, Result$Error, BitArray$BitArray } from "./gleam.mjs";
import * as mod from "./plinth/browser/crypto/subtle.mjs"

export async function digest(algorithm, data) {
  try {
    let hashed = await globalThis.crypto.subtle.digest(algorithm, data.rawBuffer);
    return Result$Ok(BitArray$BitArray(new Uint8Array(hashed)))
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function exportKey(format, key) {
  try {
    let exported = await globalThis.crypto.subtle.exportKey(format, key);
    return Result$Ok(exported)
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function exportJwk(key) {
  try {
    let exported = await globalThis.crypto.subtle.exportKey("jwk", key);
    return Result$Ok(exported)
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

function generateKeyAlgorithm(algorithm) {
  if (algorithm instanceof mod.RsaHashedKeyGenParams) {
    return {
      name: algorithm.name,
      modulusLength: algorithm.modulus_length,
      publicExponent: algorithm.public_exponent.rawBuffer,
      hash: digestAlgorithm(algorithm.hash)
    }
  } else if (algorithm instanceof EcKeyGenParams) {
    return {
      name: algorithm.name,
      namedCurve: algorithm.named_curve
    }
  }
}

function digestAlgorithm(hash) {
  if (hash instanceof mod.SHA1) {
    return "SHA-1"
  } else if (hash instanceof mod.SHA256) {
    return "SHA-256"
  } else if (hash instanceof mod.SHA384) {
    return "SHA-384"
  } else if (hash instanceof mod.SHA512) {
    return "SHA-512"
  }
}

export async function generateKey(algorithm, extractable, keyUsages) {
  try {
    let { publicKey, privateKey } = await globalThis.crypto.subtle.generateKey(generateKeyAlgorithm(algorithm), extractable, keyUsages);
    return Result$Ok([publicKey, privateKey])
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function importKey(format, keyData, algorithm, extractable, keyUsages) {
  try {
    let imported = await globalThis.crypto.subtle.importKey(format, keyData.rawBuffer, algorithm, extractable, keyUsages);
    return Result$Ok(imported)
  } catch (error) {
    return Result$Error(`${error}`)
  }
}


export async function importJwk(keyData, algorithm, extractable, keyUsages) {
  try {
    let imported = await globalThis.crypto.subtle.importKey("jwk", keyData, algorithm, extractable, keyUsages);
    return Result$Ok(imported)
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function sign(algorithm, key, data) {
  try {
    let signed = await globalThis.crypto.subtle.sign(algorithm, key, data.rawBuffer);
    return Result$Ok(BitArray$BitArray(new Uint8Array(signed)))
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function verify(algorithm, key, signature, data) {
  try {
    let valid = await globalThis.crypto.subtle.verify(algorithm, key, signature.rawBuffer, data.rawBuffer);
    return Result$Ok(valid)
  } catch (error) {
    return Result$Error(`${error}`)
  }
}