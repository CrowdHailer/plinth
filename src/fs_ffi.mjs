import { Result$Ok, Result$Error } from "./gleam.mjs";
import fs from "node:fs";

export function readFileSync(path) {
  try {
    return Result$Ok(fs.readFileSync(path, "utf8"))
  } catch (error) {
    return Result$Error(String(error))
  }
}

export function writeFileSync(path, content) {
  try {
    return Result$Ok(fs.writeFileSync(path, content))
  } catch (error) {
    return Result$Error(String(error))
  }
}
