import { BitArray } from "./gleam.mjs";

export function new_(fileBits, fileName) {
  return new File([fileBits.buffer], fileName);
}

export async function bytes(file) {
  return new BitArray(new Uint8Array(await file.arrayBuffer()))
}

export function text(file) {
  return file.text();
}

export function name(file) {
  return file.name;
}

export function mime(file) {
  return file.type;
}

export function size(file) {
  return file.size;
}

export function createObjectURL(file) {
  return URL.createObjectURL(file);
}

