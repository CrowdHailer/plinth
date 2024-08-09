import child_process from "node:child_process"

export const spawn = (cmd, args) =>
  child_process.spawn(cmd, args.toArray())

export const kill = (childProcess) =>
  childProcess.kill()
