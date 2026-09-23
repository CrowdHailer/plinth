import { Result$Ok, Result$Error } from "./gleam.mjs";

export function getPerformance() {
  const performance = globalThis.performance;
  if (globalThis.Performance && performance instanceof globalThis.Performance) {
    return Result$Ok(performance);
  }
  return Result$Error();
}

export function now(performance) {
  return performance.now();
}
