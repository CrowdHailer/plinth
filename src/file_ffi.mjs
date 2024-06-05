export function new_(fileBits, fileName) {
  return new File([fileBits.buffer], fileName);
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

export function createObjectURL(file) {
  return URL.createObjectURL(file);
}

