export function getCurrentPosition(success, error) {
  globalThis.navigator.geolocation.getCurrentPosition(success, error)
}