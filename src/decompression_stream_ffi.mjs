import { toBitArray } from "../gleam_stdlib/gleam.mjs"

export const decompress = async (data, encoding) => {
  const ds = new DecompressionStream(encoding);
  const blob = new Blob([data.buffer])
  const decompressedStream = blob.stream().pipeThrough(ds)

  const decompressed = await new Response(decompressedStream).blob()
  const ab = await decompressed.arrayBuffer()
  return toBitArray(new Uint8Array(ab))
}
