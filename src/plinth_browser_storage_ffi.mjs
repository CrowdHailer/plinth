import { Result$Ok, Result$Error } from "./gleam.mjs";

export function getStorage() {
  const storage = globalThis?.navigator?.storage
  if (globalThis.StorageManager && storage instanceof StorageManager) {
    return Result$Ok(storage)
  } else {
    return Result$Error()
  }
}

export async function estimate(storageManager) {
  try {
    const { quota, usage } = await storageManager.estimate()
    return Result$Ok([quota, usage])
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function getDirectory(storageManager) {
  try {
    return Result$Ok(await storageManager.getDirectory())
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function persist(storageManager) {
  try {
    return Result$Ok(await storageManager.persist())
  } catch (error) {
    return Result$Error(`${error}`)
  }
}

export async function persisted(storageManager) {
  try {
    return Result$Ok(await storageManager.persisted())
  } catch (error) {
    return Result$Error(`${error}`)
  }
}