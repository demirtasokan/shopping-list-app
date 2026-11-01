# 🛒 Shopping List

A simple shopping list web app. The list is stored in a [Supabase](https://supabase.com) database, so it is still there when you reload the page or open it on another device.

## Features

- **Add** items by typing and pressing Enter or clicking **Add** (blank entries are ignored)
- **Check** items off as you buy them; checked items are crossed out
- **Delete** a single item with ✕, or remove all checked items with **Clear checked**
- A counter shows how many items are checked, e.g. "2 of 5 checked"
- If a request to the database fails, an error message is shown and the list is left unchanged
- A list saved by the earlier localStorage version is imported once, then removed from the browser

## How to run

Download or clone the repo, then open `index.html` in any modern browser. There is no build step and no server to run:

```bash
git clone https://github.com/demirtasokan/shopping-list-app.git
cd shopping-list-app
# Windows
start index.html
# macOS
open index.html
```

## Database

The items live in a single table, `public.shopping_items`. Its SQL is in [`supabase/schema.sql`](supabase/schema.sql).

| Column | Type | Notes |
|---|---|---|
| `id` | uuid | primary key, generated |
| `text` | text | required, 1–100 characters |
| `done` | boolean | defaults to `false` |
| `created_at` | timestamptz | defaults to `now()`; sets the list order |

To use your own Supabase project, run `supabase/schema.sql` in its SQL editor and replace `SUPABASE_URL` and `SUPABASE_KEY` at the top of the script in `index.html` with your project's URL and publishable key.

## Security note

There is no login. The page uses Supabase's publishable key, which is meant to be public, and the table's row-level security policies allow anyone with that key to read, add, change and delete items. That is fine for a shared demo list, but **don't store anything private in it**. To make lists personal, add Supabase Auth and add a `user_id` column with policies that compare it to `auth.uid()`.
