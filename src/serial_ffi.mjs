import { Ok, Error, BitArray } from "./gleam.mjs";

export async function requestPort() {
  try {
    const port = await globalThis.navigator.serial.requestPort({ filters: [] });
    return new Ok(port);
  } catch (error) {
    console.warn(error);
    return new Error();
  }
}

export async function getPorts() {
  try {
    const ports = await globalThis.navigator.serial.getPorts();
    return new Ok(ports);
  } catch (error) {
    console.warn(error);
    return new Error();
  }
}

export function getInfo(port) {
  try {
    const { usbVendorId, usbProductId } = port.getInfo();
    return new Ok([usbVendorId, usbProductId]);
  } catch (error) {
    console.warn(error);
    return new Error();
  }
}

export async function open(port, baudRate) {
  try {
    await port.open({ baudRate });
    return new Ok();
  } catch (error) {
    console.warn(error);
    return new Error();
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
        callback(new BitArray(value));
        // Do something with |value|…
      }
      return new Ok();
    } catch (error) {
      return new Error();
    } finally {
      reader.releaseLock();
    }
  }
}
