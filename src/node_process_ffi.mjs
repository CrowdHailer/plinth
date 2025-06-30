export function env() {
  return Object.entries(process.env)
}

export function argv() {
  return process.argv;
}
