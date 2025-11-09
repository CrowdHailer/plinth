import { Result$Ok, Result$Error } from "./gleam.mjs";

export async function readText() {
  try {
    return Result$Ok(await globalThis.navigator.clipboard.readText());
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export async function writeText(clipText) {
  try {
    return Result$Ok(await globalThis.navigator.clipboard.writeText(clipText));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

