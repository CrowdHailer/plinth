import { Result$Ok, Result$Error } from "./gleam.mjs";

export function newAudio(url) {
  return new Audio(url);
}

export async function play(audio) {
  try {
    await audio.play();
    return Result$Ok();
  } catch (error) {
    return Result$Error(error.toString());
  }
}
