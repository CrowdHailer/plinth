import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/io
import gleam/javascript/promise.{type Promise}
import gleam/json.{type Json}
import gleam/option.{type Option, None}
import plinth/browser/credentials

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "isConditionalMediationAvailable")
pub fn is_conditional_mediation_available() -> Promise(Bool)

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "isUserVerifyingPlatformAuthenticatorAvailable")
pub fn is_user_verifying_platform_authenticator_available() -> Promise(Bool)

// flattened so using ..overwrite syntax works
pub type CreationOptions {
  CreationOptions(
    // Default value is NoAttestation("none")
    attestation: Attestation,
    attestation_formats: List(String),
    // --- under authenticatorSelection
    authenticator_attachement: Option(AuthenticatorAttachement),
    // default is "discouraged"
    resident_key: Requirement,
    // default is "preferred"
    user_verification: Requirement,
    // ---
    challenge: BitArray,
    exclude_credentials: List(#(BitArray, List(Transport))),
    // extensions not supported
    public_key_credential_parameters: List(Algorithm),
    // --- under rp
    relaying_party_id: Option(String),
    relaying_party_name: String,
    // ---
    // milliseconds
    timeout: Option(Int),
    // --- under user
    user_id: BitArray,
    user_name: String,
    user_display_name: String,
    // ---
    hints: List(Hint),
  )
}

pub fn creation(
  challenge,
  algorithm,
  relaying_party_name,
  user_id,
  user_name,
  user_display_name,
) {
  CreationOptions(
    NoAttestation,
    [],
    None,
    Discouraged,
    Preferred,
    challenge,
    [],
    [algorithm],
    None,
    relaying_party_name,
    None,
    user_id,
    user_name,
    user_display_name,
    [],
  )
}

pub type RequestOptions {
  RequestOptions(
    allow_credentials: List(#(BitArray, List(Transport))),
    challenge: BitArray,
    hints: List(Hint),
    relaying_party_id: Option(String),
    timeout: Option(Int),
    user_verification: Requirement,
  )
}

// request is for the options, passed to get action, returns an assertion.
pub fn request(challenge) {
  RequestOptions([], challenge, [], None, None, Preferred)
}

pub type Attestation {
  NoAttestation
  Direct
  Enterprise
  Indirect
}

fn attestation_to_string(attestation) {
  case attestation {
    NoAttestation -> "none"
    Direct -> "direct"
    Enterprise -> "enterprise"
    Indirect -> "indirect"
  }
}

pub type AuthenticatorAttachement {
  Platform
  CrossPlatform
}

fn authenticator_attachment_to_string(authenticator_attachment) {
  case authenticator_attachment {
    Platform -> "platform"
    CrossPlatform -> "cross-platform"
  }
}

pub type Algorithm {
  Ed25519
  ES256
  RS256
}

pub fn algorithm_to_number(algorithm) {
  case algorithm {
    Ed25519 -> -8
    ES256 -> -7
    RS256 -> -257
  }
}

pub type Requirement {
  Required
  Preferred
  Discouraged
}

fn requirement_to_string(requirement) {
  case requirement {
    Required -> "required"
    Preferred -> "preferred"
    Discouraged -> "discouraged"
  }
}

pub type Transport {
  Ble
  // string is just hybrid
  HybridTransport
  Internal
  Nfc
  Usb
}

fn transport_to_string(transport) {
  case transport {
    Ble -> "ble"
    HybridTransport -> "hybrid"
    Internal -> "internal"
    Nfc -> "nfc"
    Usb -> "usb"
  }
}

pub type Hint {
  SecurityKey
  ClientDevice
  // string is just hybrid
  HybridHint
}

fn hint_to_string(hint) {
  case hint {
    SecurityKey -> "security-key"
    ClientDevice -> "client-device"
    HybridHint -> "hybrid"
  }
}

pub type NativeCreationOptions

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "parseCreationOptionsFromJSON")
pub fn parse_creation_options_from_json(
  options: Dynamic,
) -> Result(NativeCreationOptions, String)

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "createForPublicKey")
pub fn do_create(
  container: credentials.CredentialsContainer,
  options: NativeCreationOptions,
) -> Promise(Result(Credential(Attest), String))

fn json_bitarry(bytes) {
  json.string(bit_array.base64_url_encode(bytes, False))
}

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "JSONObject")
fn json_object(entries: List(#(String, Json))) -> Json

fn creation_options_to_native(options: CreationOptions) -> NativeCreationOptions {
  let options =
    json_object([
      #("attestation", json.string(attestation_to_string(options.attestation))),
      #(
        "attestation_formats",
        json.array(options.attestation_formats, json.string),
      ),
      #(
        "authenticatorSelection",
        json.object([
          #(
            "authenticatorAttachement",
            json.nullable(options.authenticator_attachement, fn(x) {
              json.string(authenticator_attachment_to_string(x))
            }),
          ),
          #(
            "residentKey",
            json.string(requirement_to_string(options.resident_key)),
          ),
          #(
            "userVerification",
            json.string(requirement_to_string(options.user_verification)),
          ),
        ]),
      ),
      #("challenge", json_bitarry(options.challenge)),
      #(
        "excludeCredentials",
        json.array(
          options.exclude_credentials,
          allow_exclude_credential_to_json,
        ),
      ),
      #(
        "pubKeyCredParams",
        json.array(options.public_key_credential_parameters, fn(a) {
          json.object([
            #("alg", json.int(algorithm_to_number(a))),
            #("type", json.string("public-key")),
          ])
        }),
      ),
      #(
        "rp",
        json_object([
          #("id", json.nullable(options.relaying_party_id, json.string)),
          #("name", json.string(options.relaying_party_name)),
        ]),
      ),
      #("timeout", json.nullable(options.timeout, json.int)),
      #(
        "user",
        json.object([
          #("displayName", json.string(options.user_display_name)),
          #("id", json_bitarry(options.user_id)),
          #("name", json.string(options.user_name)),
        ]),
      ),
      #(
        "hints",
        json.array(options.hints, fn(h) { json.string(hint_to_string(h)) }),
      ),
    ])
  case parse_creation_options_from_json(dynamic.from(options)) {
    Ok(options) -> options
    Error(reason) -> {
      io.debug(reason)
      panic as "should be valid by construction"
    }
  }
}

pub fn create(container, options) {
  do_create(container, creation_options_to_native(options))
}

pub type NativeRequestOptions

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "parseRequestOptionsFromJSON")
pub fn parse_request_options_from_json(
  options: Dynamic,
) -> Result(NativeRequestOptions, String)

fn allow_exclude_credential_to_json(credential_id) {
  let #(id, transports) = credential_id
  json.object([
    #("id", json_bitarry(id)),
    #(
      "transports",
      json.array(transports, fn(x) { json.string(transport_to_string(x)) }),
    ),
    #("type", json.string("public-key")),
  ])
}

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "getForPublicKey")
pub fn do_get(
  container: credentials.CredentialsContainer,
  options: NativeRequestOptions,
) -> Promise(Result(Credential(Assertion), String))

fn request_options_to_native(options: RequestOptions) -> NativeRequestOptions {
  let options =
    json_object([
      #(
        "allowCredentials",
        json.array(options.allow_credentials, allow_exclude_credential_to_json),
      ),
      #("challenge", json_bitarry(options.challenge)),
      #(
        "hints",
        json.array(options.hints, fn(h) { json.string(hint_to_string(h)) }),
      ),
      #("rpId", json.nullable(options.relaying_party_id, json.string)),
      #("timeout", json.nullable(options.timeout, json.int)),
      #(
        "userVerification",
        json.string(requirement_to_string(options.user_verification)),
      ),
    ])
  case parse_request_options_from_json(dynamic.from(options)) {
    Ok(options) -> options
    Error(reason) -> {
      io.debug(reason)
      panic as "should be valid by construction"
    }
  }
}

pub fn get(container, options) {
  do_get(container, request_options_to_native(options))
}

pub type Credential(t)

pub type Attest

pub type Assertion

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "toJSON")
pub fn to_json(credential: Credential(t)) -> Json

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "authenticatorAttachment")
fn do_authenticator_attachment(credential: Credential(t)) -> String

pub fn authenticator_attachment(credential) {
  case do_authenticator_attachment(credential) {
    "platform" -> Platform
    "cross-platform" -> CrossPlatform
    _ ->
      panic as "An invalid value of authenticator attachement was returned from the credential."
  }
}

/// This property is a base64url encoded version of PublicKeyCredential.rawId.
@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "id")
pub fn id(credential: Credential(t)) -> String

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "rawId")
pub fn raw_id(credential: Credential(t)) -> BitArray

// same content on either create or get requests
@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "clientDataJSON")
pub fn client_data_json(credential: Credential(t)) -> BitArray

// --------- on attestation credential

// CBOR encoding of athenticator data, format and attestation statement
@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "attestationObject")
pub fn attestation_object(credential: Credential(Attest)) -> BitArray

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "getAuthenticatorData")
pub fn get_authenticator_data(credential: Credential(Attest)) -> BitArray

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "getPublicKey")
pub fn get_public_key(credential: Credential(Attest)) -> BitArray

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "getPublicKeyAlgorithm")
pub fn get_public_key_algorithm(credential: Credential(Attest)) -> BitArray

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "getTransports")
pub fn get_transports(credential: Credential(Attest)) -> BitArray

// -------- on assertion credential

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "authenticatorData")
pub fn authenticator_data(credential: Credential(Assertion)) -> BitArray

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "signature")
pub fn signature(credential: Credential(Assertion)) -> BitArray

@external(javascript, "../../../plinth_browser_credentials_ffi.mjs", "userHandle")
pub fn user_handle(credential: Credential(Assertion)) -> BitArray
