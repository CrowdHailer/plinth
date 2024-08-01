import process from "node:process";

export function get_platform_string() {
  if ("bun" in process.versions) return "bun";
  if ("deno" in process.versions) return "deno";
  // node is always supplied for bun and deno, so this check must come after bun and deno
  if ("node" in process.versions) return "node";
  if (typeof window !== "undefined") return "browser";
  return "unknown";
}