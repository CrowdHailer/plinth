import { BitArray$BitArray } from "./gleam.mjs";

export function new_(strings, arg) {
  return new Blob(strings, {
    type: arg,
  });
}

export async function bytes(blob) {
  return BitArray$BitArray(new Uint8Array(await blob.arrayBuffer()))
}

export function text(blob) {
  return blob.text();
}

export function mime(blob) {
  return blob.type;
}

export function size(blob) {
  return blob.size;
}
