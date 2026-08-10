# Product Admin — Frontend

A simple React app for managing products: list, add, edit, and delete.
Built with [Vite](https://vitejs.dev/) + React (no extra UI libraries, just plain CSS)

## Running it

```bash
npm install
npm run dev
```

This starts the app at **http://localhost:5173**.

## What it expects from your FastAPI backend

The app assumes your API is running at `http://localhost:8000` and exposes
these routes (see `src/api/products.js` — that's the only file that talks
to your backend, so it's the one place to edit if your routes differ):

| Method | Route            | Purpose                  |
|--------|------------------|---------------------------|
| GET    | `/products`      | Return a list of products |
| POST   | `/products`      | Create a product          |
| PUT    | `/products/{id}` | Update a product          |
| DELETE | `/products/{id}` | Delete a product           |

### Expected product shape (JSON)

```json
{
  "id": 1,
  "name": "Wireless Mouse",
  "description": "Compact 2.4GHz wireless mouse",
  "price": 19.99,
  "stock": 42,
  "category": "Electronics"
}
```

`id` is only sent back by the server — the form never sends it when
creating a product.

### CORS

Since the frontend (port 5173) and backend (port 8000) run on different
ports, your FastAPI app needs CORS enabled or the browser will block the
requests. In your FastAPI app:

```python
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_methods=["*"],
    allow_headers=["*"],
)
```

## Project structure

```
src/
  api/products.js       -> all fetch() calls to your backend
  components/
    ProductForm.jsx      -> add/edit form
    ProductList.jsx       -> table of products
  App.jsx                 -> page layout + state management
  index.css                -> all styling
```

## Notes for adapting it

- If your backend uses different field names (e.g. `title` instead of
  `name`), update `ProductForm.jsx` and `ProductList.jsx` to match, and
  the `emptyProduct` object in `ProductForm.jsx`.
- If your backend returns errors in a different shape than FastAPI's
  default `{"detail": "..."}`, update `handleResponse()` in
  `src/api/products.js`.
- There's no auth/login here — it's just the product management page,
  as requested.
