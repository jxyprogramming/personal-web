import { defineCollection } from "astro:content";
import { glob } from "astro/loaders";
import { z } from "astro/zod";

const baseSchema = z.object({
  title: z.string(),
  description: z.string(),
  publishedAt: z.coerce.date(),
  draft: z.boolean().default(false),
  tags: z.array(z.string()).default([])
});

const notes = defineCollection({
  loader: glob({ base: "./src/content/notes", pattern: "**/*.md" }),
  schema: baseSchema.extend({
    course: z.string(),
    semester: z.string(),
    pdfUrl: z.string().optional()
  })
});

const posts = defineCollection({
  loader: glob({ base: "./src/content/posts", pattern: "**/*.md" }),
  schema: baseSchema.extend({
    mood: z.string().optional()
  })
});

const photos = defineCollection({
  loader: glob({ base: "./src/content/photos", pattern: "**/*.md" }),
  schema: baseSchema.extend({
    image: z.string(),
    takenAt: z.coerce.date().optional(),
    location: z.string().optional(),
    camera: z.string().optional()
  })
});

export const collections = { notes, posts, photos };
