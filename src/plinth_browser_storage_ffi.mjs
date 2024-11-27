import { Ok, Error } from "./gleam.mjs";

export function getStorage() {
  const storage = globalThis?.navigator?.storage
  if (globalThis.StorageManager && storage instanceof StorageManager) {
    return new Ok(storage)
  } else {
    return new Error()
  }
}

export async function estimate(storageManager) {
  try {
    const { quota, usage } = await storageManager.estimate()
    return new Ok([quota, usage])
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function getDirectory(storageManager) {
  try {
    return new Ok(await storageManager.getDirectory())
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function persist(storageManager) {
  try {
    return new Ok(await storageManager.persist())
  } catch (error) {
    return new Error(`${error}`)
  }
}

export async function persisted(storageManager) {
  try {
    return new Ok(await storageManager.persisted())
  } catch (error) {
    return new Error(`${error}`)
  }
}