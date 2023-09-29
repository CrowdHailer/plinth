import { Ok, Error } from "./gleam.mjs";
import fs from "node:fs";

export function readFileSync(path) {
  try {
    return new Ok(fs.readFileSync(path, "utf8"))
  } catch (error) {
    return new Error(error.toString())
  }
}

export function writeFileSync(path, content) {
  try {
    return new Ok(fs.writeFileSync(path, content))
  } catch (error) {
    return new Error(error.toString())
  }
}
