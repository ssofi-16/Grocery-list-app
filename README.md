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

### 1. Create The Supabase Project

1. Go to `https://supabase.com`.
2. Click **Start your project** or **Sign in**.
3. Sign in with GitHub or email.
4. Click **New project**.
5. Choose your organization. If Supabase asks you to create one, use your name.
6. For **Project name**, enter `grocery-list`.
7. Create a database password and save it somewhere private.
8. Choose a region close to you.
9. Click **Create new project**.
10. Wait for Supabase to finish setting it up.

### 2. Create The Tables

1. In your Supabase project, look at the left sidebar.
2. Click **SQL Editor**.
3. Click **New query**.
4. Do **not** type `supabase/schema.sql` into Supabase.
5. Open the local file named `supabase/schema.sql` in this project.
6. Copy all of the SQL code inside that file.
7. Paste the copied SQL code into the Supabase SQL editor.
8. Click **Run**.

### 3. Copy The App Keys

1. In Supabase, click the **Connect** button near the top of the project page, or go to **Project Settings > API**.
2. Copy the **Project URL**.
3. Copy the **anon public key** or **publishable key**.
4. Open `OPEN_GROCERY_LIST.html`.
5. Find this section:

```js
const SUPABASE_URL = "https://your-project-ref.supabase.co";
const SUPABASE_ANON_KEY = "your-supabase-anon-key";
```

6. Replace the first value with your Project URL.
7. Replace the second value with your anon public key or publishable key.

The Supabase anon key is designed to be public in browser apps. Access is controlled by the database policies in `supabase/schema.sql`.

## Publish

Publish the repo with GitHub Pages. Then users only need the website link.

1. Push `index.html`, `OPEN_GROCERY_LIST.html`, and the other files to GitHub.
2. Open the GitHub repo.
3. Go to **Settings > Pages**.
4. Set **Source** to `Deploy from a branch`.
5. Set **Branch** to `main`.
6. Set the folder to `/root`.
7. Click **Save**.
8. Wait a few minutes.

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
