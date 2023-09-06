const ITEM_LIMIT = 5;

class Storage {
  #items;

  constructor() {
    this.#items = new Map();
  }

  get length() {
    return this.#items.size;
  }

  key(index) {
    let i = 0;
    for (const k of this.#items.keys()) {
      if (i === index) {
        return k;
      }

      ++i;
    }

    return null;
  }

  getItem(k) {
    return this.#items.get(k) || null;
  }

  setItem(k, v) {
    if (this.#items.size === ITEM_LIMIT) {
      throw new Error("Full!");
    }

    this.#items.set(k, v);
  }

  removeItem(k) {
    this.#items.delete(k);
  }

  clear() {
    this.#items.clear();
  }
}

function getter(type, shouldThrow, shouldUndef) {
  if (shouldThrow) {
    throw new Error("ARGBL");
  } else if (shouldUndef) {
    return undefined;
  } else {
    return new Storage();
  }
}

export function runWithMockStorage(shouldThrow, shouldUndef, callback) {
  const oldStorage = globalThis.Storage;
  const oldLocal = globalThis.localStorage;
  const oldSession = globalThis.sessionStorage;

  Object.defineProperty(globalThis, "Storage", {
    value: Storage,
    configurable: true,
  });
  Object.defineProperty(globalThis, "localStorage", {
    get() {
      return getter("localStorage", shouldThrow, shouldUndef);
    },
    configurable: true,
  });
  Object.defineProperty(globalThis, "sessionStorage", {
    get() {
      return getter("sessionStorage", shouldThrow, shouldUndef);
    },
    configurable: true,
  });

  try {
    callback();
  } finally {
    Object.defineProperty(globalThis, "Storage", {
      value: oldStorage,
      configurable: true,
    });
    Object.defineProperty(globalThis, "localStorage", {
      value: oldLocal,
      configurable: true,
    });
    Object.defineProperty(globalThis, "sessionStorage", {
      value: oldSession,
      configurable: true,
    });
  }
}
