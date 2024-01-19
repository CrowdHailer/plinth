export function blob(strings, arg) {
  return new Blob(strings, {
    type: arg,
  });
}
