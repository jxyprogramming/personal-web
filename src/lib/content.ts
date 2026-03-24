import { getCollection, type CollectionEntry } from "astro:content";

type EntryType = "notes" | "posts" | "photos";

const byDate = <T extends CollectionEntry<EntryType>>(a: T, b: T) =>
  b.data.publishedAt.getTime() - a.data.publishedAt.getTime();

export async function getPublishedCollection<T extends EntryType>(name: T) {
  const entries = await getCollection(name, ({ data }) => !data.draft);
  return entries.sort(byDate);
}
