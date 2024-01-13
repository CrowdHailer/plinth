import { Ok, Error } from "./gleam.mjs";

export function newAudio(url) {
  return new Audio(url);
}

export async function play(audio) {
  try {
    await audio.play();
    return new Ok();
  } catch (error) {
    return new Error(error.toString());
  }
}
