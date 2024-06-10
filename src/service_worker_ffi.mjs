import { Ok, Error } from "./gleam.mjs";

export function self() {
  const s = globalThis
  if (s.ServiceWorkerGlobalScope && s instanceof ServiceWorkerGlobalScope) {
    return new Ok(s)
  }
  return new Error("nope")
}

export async function skipWaiting(self) {
  return await self.skipWaiting()
}

export function scriptURL(self) {
  return self.serviceWorker.scriptURL;
}

export function origin(self) {
  return self.origin;
}

export function addFetchListener(self, handler) {
  self.addEventListener("fetch", handler)
}

export function addActivateListener(self, handler) {
  self.addEventListener("activate", handler)
}

export async function doClaim(self) {
  self.addEventListener("activate", (event) => {
    event.waitUntil(self.clients.claim());
  });
}

export function fetchEventClient(event) {
  return event.client
}

export function onFullMessage(thing, callback) {
  thing.addEventListener("message", function (message) {
    callback(message);
  });
}

export function onMessage(callback) {
  window.navigator.serviceWorker.addEventListener("message", function (message) {
    callback(message.data);
  });
}

export function clientId(event) {
  return event.clientId
}

export function request(event) {
  return event.request
}

export function respondWith(event, response) {
  try {
    return new Ok(event.respondWith(response))
  } catch (error) {
    return new Error(error.toString())
  }
}

export function resultingClientId(event) {
  return event.resultingClientId
}

export function frameType(client) {
  return client.frameType
}

export async function clientGet(self, id) {
  const client = await self.clients.get(id)
  if (client) {
    return new Ok(client)
  }
  return new Error()
}

export async function openWindow(self, url) {
  return await self.clients.openWindow(url)
}

export async function register(scriptURL) {
  try {
    return new Ok(await navigator.serviceWorker.register(scriptURL))
  } catch (error) {
    return new Error(error.toString())
  }
}

export async function ready() {
  return navigator.serviceWorker.ready
}

export function active(registration) {
  const serviceWorker = registration.active
  if (serviceWorker) {
    return new Ok(serviceWorker)
  } else {
    return new Error()
  }
}

export function installing(registration) {
  const serviceWorker = registration.installing
  if (serviceWorker) {
    return new Ok(serviceWorker)
  } else {
    return new Error()
  }
}

export function waiting(registration) {
  const serviceWorker = registration.waiting
  if (serviceWorker) {
    return new Ok(serviceWorker)
  } else {
    return new Error()
  }
}

// TODO remove

export function requestURL(request) {
  return request.url
}


export function redirectResponse(url) {
  return Response.redirect(url)
}

export function okResponse(body) {
  return new Response(body)
}

