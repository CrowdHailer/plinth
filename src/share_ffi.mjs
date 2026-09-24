
import { Result$Ok, Result$Error } from "./gleam.mjs";
import { unwrap } from "../gleam_stdlib/gleam/option.mjs";

export async function share(data) {
  try {
    const shareData = {
      title: unwrap(data.title, undefined),
      text:  unwrap(data.text, undefined),
      url:   unwrap(data.url, undefined),
    };
    if (data.files && data.files.length > 0) {
      shareData.files = data.files;
    }
    return Result$Ok(await navigator.share(shareData));
  } catch (error) {
    return Result$Error(error.toString());
  }
}

export function canShare(data) {
  return navigator.canShare({
    title: unwrap(data.title, undefined),
    text:  unwrap(data.text, undefined),
    url:   unwrap(data.url, undefined),
  });
}
