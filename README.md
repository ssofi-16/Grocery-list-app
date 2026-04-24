# Grocery Together

A simple collaborative grocery list website.

Users open the website, add groceries, tap **Share**, and send the link to someone else. The shared online database stays invisible to users.

## Features

- Automatically creates a grocery list when the website opens.
- Creates a unique share link for each list.
- Anyone with the link can view and edit the same list.
- Add, check, uncheck, edit, and delete items.
- Updates appear live for everyone on the same list.
- Mobile-friendly, simple UI.

## App Owner Setup

Users do not need to know about Supabase. The app owner only needs to connect the online database once.

1. Create a Supabase project.
2. Open the SQL editor in Supabase.
3. Run `supabase/schema.sql`.
4. In Supabase, go to **Project Settings > API**.
5. Copy the Project URL and anon public key.
6. Paste them into `OPEN_GROCERY_LIST.html`:

```js
const SUPABASE_URL = "https://your-project-ref.supabase.co";
const SUPABASE_ANON_KEY = "your-supabase-anon-key";
```

The Supabase anon key is designed to be public in browser apps. Access is controlled by the database policies in `supabase/schema.sql`.

## Publish

Publish the repo with GitHub Pages or another static web host. Then users only need the website link.

The normal user flow is:

1. Open the grocery list website.
2. Add items.
3. Tap **Share**.
4. Send the link.

## GitHub Pages Link

For this repo, the GitHub Pages link should be:

```text
https://ssofi-16.github.io/Gricery-list-app/
```
