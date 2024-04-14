export function now() {
  return new Date();
}

export function new_(string) {
  return new Date(string);
}

export function toISOString(d) {
  return d.toISOString();
}

export function year(d) {
  return d.getYear();
}

export function month(d) {
  return d.getMonth();
}

export function day(d) {
  return d.getDay();
}

export function date(d) {
  return d.getDate();
}

export function hours(d) {
  return d.getHours();
}

export function minutes(d) {
  return d.getMinutes();
}

export function seconds(d) {
  return d.getSeconds();
}
