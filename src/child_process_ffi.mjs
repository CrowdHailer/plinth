import { Ok, Error } from "./gleam.mjs";
import child_process from "node:child_process"

export const kill = (childProcess) =>
  childProcess.kill()

export const spawn = (cmd, args) =>
  child_process.spawn(cmd, args.toArray())

export const stdin = (childProcess) =>
  childProcess.stdin ? new Ok(childProcess.stdin) : new Error()
