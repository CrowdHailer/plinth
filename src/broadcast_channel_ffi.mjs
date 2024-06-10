import { Ok, Error } from "./gleam.mjs";

export function new_(channelName) {
  try {
    return new Ok(new BroadcastChannel(channelName));
  } catch (error) {
    return new Error(error.toString());
  }
}

export function postMessage(worker, message) {
  try {
    return new Ok(worker.postMessage(message));
  } catch (error) {
    return new Error(error.toString());
  }
}

export function onMessage(worker, callback) {
  worker.addEventListener("message", function (message) {
    callback(message);
  });
}
