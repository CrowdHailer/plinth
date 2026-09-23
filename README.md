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

### Error handling

Gleam does not expect to handle exceptions and all fallible functions must return a `Result`.
Construct failures with `Result$Error(...)`.

Use a custom Gleam type for structured errors or the string representation of the thrown value.

Use `String(error)` to convert the thrown value to a string, see [spec](https://tc39.es/ecma262/multipage/text-processing.html#sec-string-constructor-string-value).
Template interpolation `${error}` throws in the case of symbols and `error.toString()` will fail certain cases.

```js
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