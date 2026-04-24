# Grocery Together

A real-time collaborative grocery list app built with React and Supabase.

This version is a standalone browser app. Nobody needs to install anything to use it once `index.html` is hosted online.

## Features

- Create a grocery list from the home page.
- Redirects to `/list/:shareCode` after creation.
- Anyone with the share link can view and edit the same list.
- Add, check, uncheck, rename, and delete items.
- Supabase Realtime keeps every open copy of the list in sync.
- Mobile-friendly layout with a simple sharing flow.

## Supabase Setup

1. Create a Supabase project.
2. Open the SQL editor in Supabase.
3. Run the SQL in `supabase/schema.sql`.
4. In your Supabase project, go to **Project Settings > API**.
5. Copy your Project URL and anon public key.

The schema enables row-level security with public list and item access so anonymous users can collaborate by link. Treat the share code as the access secret.

## Environment Variables

No local environment variables are required for the standalone app.

Open `index.html` and replace these values near the top of the file:

```js
window.GROCERY_SUPABASE = {
  url: "https://your-project-ref.supabase.co",
  anonKey: "your-supabase-anon-key",
};
```

The Supabase anon key is designed to be public in browser apps. Access is controlled by your database policies.

## Open The App

After adding your Supabase values, upload the project folder to any static web host, such as Netlify, Vercel, GitHub Pages, Cloudflare Pages, or Supabase Storage. The app only needs `index.html`, `styles.css`, and the optional routing files.

Then anyone can open the hosted app URL in a normal web browser. The app link itself is the home page; list links are created inside the app.

## Share Links

The app accepts both `/list/:shareCode` and `/#/list/:shareCode`.

The copy button uses `/#/list/:shareCode` because hash links work on simple static hosting without any special server routing. For deployed static hosting, this project also includes:

- `public/_redirects` for Netlify-style hosts.
- `vercel.json` for Vercel.

If you deploy somewhere else and want the clean `/list/:shareCode` format to work when opened directly, configure all routes to serve `index.html`.

## Database Tables

`lists`

- `id` UUID primary key
- `name` text
- `share_code` text unique
- `created_at` timestamp

`items`

- `id` UUID primary key
- `list_id` UUID foreign key referencing `lists(id)`
- `text` text
- `checked` boolean default false
- `created_at` timestamp
