# Plinth

[![Package Version](https://img.shields.io/hexpm/v/plinth)](https://hex.pm/packages/plinth)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/plinth/)

Basic bindings to nodejs and browser platform API's.
The aim of this package is to not make any new abstractions, so binding are as near the native platform as is sensible.

## Contributing

This package aims to provide complete low level access to the Web APIs.
It does not:

- hide the OOP nature of accessing the DOM, mutable browser APIs will remain mutable.
- build higher abstractions or opinions on how to use Web APIs.

The following design guidelines should be followed if adding new APIs.

### Module placement

Place bindings according to the specification that defines the API:

- Web APIs belong in `plinth/browser`.
Use the defining Web specification as the source of truth: see the [WHATWG standards](https://spec.whatwg.org/) and [W3C standards and drafts](https://www.w3.org/TR/).
Web APIs are defined across multiple specifications, rather than a single Web API standard.
- ECMAScript APIs belong in `plinth/javascript`.
The source of truth is the [ECMAScript language specification (ECMA-262)](https://tc39.es/ecma262/).

Runtime availability does not determine placement.
A Web API belongs in `plinth/browser` even if it is also implemented by NodeJs or other JS runtime.

**NodeJS** this library includes bindings to nodejs APIs, these will move to a separate library before 1.0 is released.

### Fetching globals

JavaScript API entry points are often a singleton object on `window` that may or may not be present depending on the API being implemented.
This library separates retrieving this singleton (feature-detection) from using it.

Name the Gleam function that fetches the current global's API object `get()`, or `get_<name>()` if multiple exist in a single Web API.
The object's module contains this function, not the `window` or `navigator`.
If fetching the object cannot throw, return `Result(t, Nil)`, if it can throw return `Result(t, String)`.
For example, accessing `localStorage` can throw `SecurityError`.

The JavaScript implementation accesses the singleton through `globalThis` and checks the `instanceof` the value.
The native object is returned and subsequent operations take it as an argument.
When mapping a JavaScript method to a Gleam function the receiver should be the first argument.

Example of global fetching that may throw an exception:

```js
import { Result$Ok, Result$Error } from "./gleam.mjs";

export function sessionStorage() {
  // accessing .sessionStorage can throw `SecurityError`
  try {
    const storage = globalThis.sessionStorage;
    if (globalThis.Storage && storage instanceof globalThis.Storage) {
      return Result$Ok(storage);
    } else {
      return Result$Error("sessionStorage is not available");
    }
  } catch (error) {
    return Result$Error(String(error));
  }
}
```

### Error handling

Gleam does not expect to handle exceptions and all fallible functions must return a `Result`.
Construct failures with `Result$Error(...)`.

Use a custom Gleam type for structured errors or the string representation of the thrown value.

Use `String(error)` to convert the thrown value to a string, see [spec](https://tc39.es/ecma262/multipage/text-processing.html#sec-string-constructor-string-value).
Template interpolation `${error}` throws in the case of symbols and `error.toString()` will fail certain cases.

```js is named 
import { Result$Ok, Result$Error } from "./gleam.mjs";

export function insertAdjacentElement(target, position, element) {
  try {
    return Result$Ok(target.insertAdjacentElement(position, element));
  } catch (error) {
    return Result$Error(String(error));
  }
}
```

### Optional values

When a JavaScript API returns `undefined` or `null` to indicate a missing value, the returned type should be`Result(t, Nil)`.

```js
import { Result$Ok, Result$Error } from "./gleam.mjs";

export function parentElement(element) {
  let parent = element.parentElement;
  if (parent !== null) {
    return Result$Ok(parent);
  }
  return Result$Error();
}
```
