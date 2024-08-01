import { CustomType as $CustomType } from "./gleam.mjs"
import * as option from "../gleam_stdlib/gleam/option.mjs"

export class Argon2Algorithm extends $CustomType {
  constructor(algorithm, memoryCost, timeCost) {
    super();
    this[0] = algorithm;
    this[1] = memoryCost;
    this[2] = timeCost;
  }

  get algorithm() {
    return this[0];
  }

  get memoryCost() {
    return option.unwrap(this[1], void 0);
  }

  get timeCost() {
    return option.unwrap(this[2], void 0);
  }
}

export function is_argon2_algorithm(algorithm) {
  return algorithm instanceof Argon2Algorithm;
}

export class BCryptAlgorithm extends $CustomType {
  constructor(cost) {
    super();
    this[0] = cost;
  }

  get algorithm() {
    return "bcrypt";
  }

  get cost() {
    return option.unwrap(this[0], void 0);
  }
}

export function is_bcrypt_algorithm(algorithm) {
  return algorithm instanceof BCryptAlgorithm;
}

export function bun_argon2i_algorithm(memory_cost, time_cost) {
  return new Argon2Algorithm("argon2i", memory_cost, time_cost);
}

export function bun_argon2id_algorithm(memory_cost, time_cost) {
  return new Argon2Algorithm("argon2id", memory_cost, time_cost);
}

export function bun_argon2d_algorithm(memory_cost, time_cost) {
  return new Argon2Algorithm("argon2d", memory_cost, time_cost);
}

export function bun_bcrypt_algorithm(cost) {
  return new BCryptAlgorithm(cost);
}

export async function bun_password_hash(password, algorithm) {
  return option.is_some(algorithm)
  ? Bun.password.hash(password, algorithm[0])
  : Bun.password.hash(password);
}

export async function bun_password_verify(password, hash, algorithm) {
  return option.is_some(algorithm)
  ? Bun.password.verify(password, hash, algorithm[0].algorithm)
  : Bun.password.verify(password, hash);
}
