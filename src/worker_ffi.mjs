import { Result$Ok, Result$Error } from "./gleam.mjs";

export function newWorker(script) {
  try {
    return Result$Ok(new Worker(script));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export function postMessage(worker, message) {
  worker.postMessage(message);
}

export function onMessage(worker, callback) {
  worker.addEventListener("message", function (message) {
    callback(message.data);
  });
}
