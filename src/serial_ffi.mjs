import { Result$Ok, Result$Error, BitArray$BitArray } from "./gleam.mjs";

export async function requestPort() {
  try {
    const port = await globalThis.navigator.serial.requestPort({ filters: [] });
    return Result$Ok(port);
  } catch (error) {
    console.warn(error);
    return Result$Error();
  }
}

export async function getPorts() {
  try {
    const ports = await globalThis.navigator.serial.getPorts();
    return Result$Ok(ports);
  } catch (error) {
    console.warn(error);
    return Result$Error();
  }
}

export function getInfo(port) {
  try {
    const { usbVendorId, usbProductId } = port.getInfo();
    return Result$Ok([usbVendorId, usbProductId]);
  } catch (error) {
    console.warn(error);
    return Result$Error();
  }
}

export async function open(port, baudRate) {
  try {
    await port.open({ baudRate });
    return Result$Ok();
  } catch (error) {
    console.warn(error);
    return Result$Error();
  }
}

export async function read(port, callback) {
  while (port.readable) {
    const reader = port.readable.getReader();
    try {
      while (true) {
        const { value, done } = await reader.read();
        if (done) {
          // |reader| has been canceled.
          break;
        }
        callback(BitArray$BitArray(value));
        // Do something with |value|…
      }
      return Result$Ok();
    } catch (error) {
      return Result$Error();
    } finally {
      reader.releaseLock();
    }
  }
}
