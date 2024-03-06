import { toBitArray } from "../gleam_stdlib/gleam.mjs"

export const decompress = async (data, encoding) => {
  const ds = new DecompressionStream(encoding);
  const blob = new Blob([data.buffer])
  const decompressedStream = blob.stream().pipeThrough(ds)

  return await new Response(decompressedStream)
        .blob()
        .then(blob => blob.arrayBuffer())
        .then(ab => toBitArray(new Uint8Array(ab)))
}
