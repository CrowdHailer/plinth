import { Ok, Error } from "./gleam.mjs";

export function fromNavigator() {
  const credentials = globalThis?.navigator?.credentials
  if (globalThis.CredentialsContainer && credentials instanceof CredentialsContainer) {
    return new Ok(credentials)
  } else {
    return new Error()
  }
}

export async function isConditionalMediationAvailable() {
  if (
    globalThis.PublicKeyCredential &&
    PublicKeyCredential.isConditionalMediationAvailable
  ) {
    return await PublicKeyCredential.isConditionalMediationAvailable();
  }
  return false
}

export async function isUserVerifyingPlatformAuthenticatorAvailable() {
  if (
    globalThis.PublicKeyCredential &&
    PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable
  ) {
    return await PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable();
  }
  return false
}


export function parseCreationOptionsFromJSON(options) {
  try {
    return new Ok(globalThis.PublicKeyCredential.parseCreationOptionsFromJSON(options))
  } catch (error) {
    return new Error(`${error}`)
  }
}

export function parseRequestOptionsFromJSON(options) {
  try {
    return new Ok(globalThis.PublicKeyCredential.parseRequestOptionsFromJSON(options))
  } catch (error) {
    return new Error(`${error}`)
  }
}

export function authenticatorAttachment(credential) {
  return credential.authenticatorAttachment
}

export function id(credential) {
  return credential.id
}

export function rawId(credential) {
  return credential.rawId
}

// on response
export function clientDataJSON(credential) {
  return credential.response.clientDataJSON
}

export function attestationObject(credential) {
  return credential.response.attestationObject
}

export function getAuthenticatorData(credential) {
  return credential.response.getAuthenticatorData()
}

export function getPublicKey(credential) {
  return credential.response.getPublicKey()
}

export function getPublicKeyAlgorithm(credential) {
  return credential.response.getPublicKeyAlgorithm()
}

export function getTransports(credential) {
  return credential.response.getTransports()
}

export function authenticatorData(credential) {
  return credential.response.authenticatorData
}

export function signature(credential) {
  return credential.response.signature
}

export function userHandle(credential) {
  return credential.response.userHandle
}

export function toJSON(credential) {
  return credential.toJSON()
}

export async function createForPublicKey(container, options) {
  try {
    return new Ok(await container.create({ publicKey: options }))
  } catch (error) {
    return new Error(`${error}`)
  }
}

export function JSONObject(entries) {
  const output = {}
  for (const [k, v] of entries) {
    if (v == null || v == undefined) {
      continue
    } else {
      output[k] = v
    }
  }
  return output
}

export async function getForPublicKey(container, options) {
  try {
    return new Ok(await container.get({ publicKey: options }))
  } catch (error) {
    return new Error(`${error}`)
  }
}