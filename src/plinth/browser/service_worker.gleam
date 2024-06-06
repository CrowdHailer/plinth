import conversation
import gleam/json.{type Json}
import plinth/browser/message.{type Client, type Message}

import gleam/javascript/promise.{type Promise}

pub type ServiceWorker

@external(javascript, "../../service_worker_ffi.mjs", "onFullMessage")
pub fn self_on_message(worker: GlobalScope, handle: fn(Message) -> Nil) -> Nil

@external(javascript, "../../service_worker_ffi.mjs", "onMessage")
pub fn service_worker_on_message(handle: fn(Json) -> Nil) -> Nil

pub type GlobalScope

@external(javascript, "../../service_worker_ffi.mjs", "self")
pub fn self() -> Result(GlobalScope, String)

@external(javascript, "../../service_worker_ffi.mjs", "skipWaiting")
pub fn skip_waiting(self: GlobalScope) -> Promise(Nil)

/// self.serviceWorker not available in firefox https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerGlobalScope/serviceWorker
@deprecated("self.serviceWorker not available in firefox.")
@external(javascript, "../../service_worker_ffi.mjs", "scriptURL")
pub fn script_url(self: GlobalScope) -> String

@external(javascript, "../../service_worker_ffi.mjs", "origin")
pub fn origin(self: GlobalScope) -> String

pub type FetchEvent

@external(javascript, "../../service_worker_ffi.mjs", "addFetchListener")
pub fn add_fetch_listener(
  self: GlobalScope,
  listener: fn(FetchEvent) -> Nil,
) -> Nil

pub type ActivateEvent

@external(javascript, "../../service_worker_ffi.mjs", "addActivateListener")
pub fn add_activate_listener(
  self: GlobalScope,
  listener: fn(ActivateEvent) -> Nil,
) -> Nil

@external(javascript, "../../service_worker_ffi.mjs", "doClaim")
pub fn do_claim(self: GlobalScope) -> Promise(Nil)

@external(javascript, "../../service_worker_ffi.mjs", "clientId")
pub fn client_id(event: FetchEvent) -> String

@external(javascript, "../../service_worker_ffi.mjs", "fetchEventClient")
pub fn fetch_event_client(event: FetchEvent) -> Client

type Request =
  conversation.JsRequest

type Response =
  conversation.JsResponse

@external(javascript, "../../service_worker_ffi.mjs", "request")
pub fn request(event: FetchEvent) -> Request

@external(javascript, "../../service_worker_ffi.mjs", "resultingClientId")
pub fn resulting_client_id(event: FetchEvent) -> String

@external(javascript, "../../service_worker_ffi.mjs", "respondWith")
pub fn respond_with(
  event: FetchEvent,
  response: Response,
) -> Result(Nil, String)

@external(javascript, "../../service_worker_ffi.mjs", "respondWith")
pub fn async_respond_with(
  event: FetchEvent,
  response: Promise(Response),
) -> Result(Nil, String)

// clients

@external(javascript, "../../service_worker_ffi.mjs", "frameType")
pub fn frame_type(client: Client) -> String

@external(javascript, "../../service_worker_ffi.mjs", "clientGet")
pub fn client_get(self: GlobalScope, id: String) -> Promise(Result(Client, Nil))

@external(javascript, "../../service_worker_ffi.mjs", "openWindow")
pub fn open_window(self: GlobalScope, url: String) -> Promise(Result(Int, Nil))

@external(javascript, "../../worker_ffi.mjs", "postMessage")
pub fn client_post_message(worker: Client, message: Json) -> Nil

@external(javascript, "../../worker_ffi.mjs", "postMessage")
pub fn service_worker_post_message(worker: ServiceWorker, message: Json) -> Nil

pub type Registration

@external(javascript, "../../service_worker_ffi.mjs", "register")
pub fn register(script_url: String) -> Promise(Result(Registration, String))

// returns a promise that never rejects
@external(javascript, "../../service_worker_ffi.mjs", "ready")
pub fn ready() -> Promise(Registration)

@external(javascript, "../../service_worker_ffi.mjs", "active")
pub fn active(registration: Registration) -> Result(ServiceWorker, Nil)

@external(javascript, "../../service_worker_ffi.mjs", "installing")
pub fn installing(registration: Registration) -> Result(ServiceWorker, Nil)

@external(javascript, "../../service_worker_ffi.mjs", "waiting")
pub fn waiting(registration: Registration) -> Result(ServiceWorker, Nil)
