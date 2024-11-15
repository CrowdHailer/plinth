import { Ok, Error } from "./gleam.mjs";

export async function readText() {
    try {
      return new Ok(await globalThis.navigator.clipboard.readText());
    } catch (error) {
      return new Error(error.toString());
    }
  }
  
export async function writeText(clipText) {
  try {
    return new Ok(await globalThis.navigator.clipboard.writeText(clipText));
  } catch (error) {
    return new Error(error.toString());
  }
}

