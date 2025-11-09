import { Result$Ok, Result$Error } from "./gleam.mjs";

export function new_(channelName) {
  try {
    return Result$Ok(new BroadcastChannel(channelName));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export function postMessage(worker, message) {
  try {
    return Result$Ok(worker.postMessage(message));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export function onMessage(worker, callback) {
  worker.addEventListener("message", function (message) {
    callback(message);
  });
}
