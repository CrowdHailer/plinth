import { toBitArray } from "../gleam_stdlib/gleam.mjs"

export const compress = async (data, encoding) => {
  const ds = new CompressionStream(encoding);
  const blob = new Blob([data.buffer])
  const compressedStream = blob.stream().pipeThrough(ds)

  const compressed = await new Response(compressedStream).blob()
  const ab = await compressed.arrayBuffer()
  return toBitArray(new Uint8Array(ab))
}
