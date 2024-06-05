export function dataTransfer(event) {
  return event.dataTransfer
}
export function files(dt) {
  return[...dt.files]
}