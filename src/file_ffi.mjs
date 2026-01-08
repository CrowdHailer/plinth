import { BitArray$BitArray } from "./gleam.mjs";

export function new_(fileBits, fileName) {
  return new File([fileBits.rawBuffer], fileName);
}

export function slice(file, start, end) {
  return file.slice(start, end);
}

export async function bytes(file) {
  return BitArray$BitArray(new Uint8Array(await file.arrayBuffer()))
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

