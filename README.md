# 🛒 Shopping List

A simple shopping list that runs entirely in your browser. No install, no server, no account.

## Features

- **Add** items by typing and pressing Enter or clicking **Add** (blank entries are ignored)
- **Check** items off as you buy them; checked items are crossed out
- **Delete** a single item with ✕, or remove all checked items with **Clear checked**
- A counter shows how many items are checked, e.g. "2 of 5 checked"
- Your list is **saved automatically** in the browser (localStorage), so it's still there after a refresh

## How to run

Download or clone the repo, then open `index.html` in any modern browser:

```bash
git clone https://github.com/demirtasokan/shopping-list-app.git
cd shopping-list-app
# Windows
start index.html
# macOS
open index.html
```

## Notes

- Everything is in one file: HTML, CSS and JavaScript.
- The list is stored per browser and isn't synced between devices.
