import { Ok, Error } from "./gleam.mjs";

export async function getUserMedia(params) {
  try {
    return new Ok(
      await window.navigator.mediaDevices.getUserMedia({ video: true })
    );
  } catch (error) {
    return new Error(error.toString());
  }
}

export async function getDisplayMedia(params) {
  try {
    return new Ok(
      await window.navigator.mediaDevices.getDisplayMedia({ video: true })
    );
  } catch (error) {
    return new Error(error.toString());
  }
}
