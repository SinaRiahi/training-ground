// This file is the ONLY place that talks to your FastAPI backend.
// If your backend routes or field names are different, this is where to fix it.

const BASE_URL = 'http://localhost:8000'

async function handleResponse(res) {
  if (!res.ok) {
    // Try to read FastAPI's error detail if it sent one
    let detail = `Request failed with status ${res.status}`
    try {
      const body = await res.json()
      if (body.detail) detail = body.detail
    } catch {
      // response wasn't JSON, ignore
    }
    throw new Error(detail)
  }
  // DELETE often returns no body
  if (res.status === 204) return null
  return res.json()
}

export async function getProducts() {
  const res = await fetch(`${BASE_URL}/products`)
  return handleResponse(res)
}

export async function createProduct(product) {
  const res = await fetch(`${BASE_URL}/products`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(product),
  })
  return handleResponse(res)
}

export async function updateProduct(id, product) {
  const res = await fetch(`${BASE_URL}/products/${id}`, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(product),
  })
  return handleResponse(res)
}

export async function deleteProduct(id) {
  const res = await fetch(`${BASE_URL}/products/${id}`, {
    method: 'DELETE',
  })
  return handleResponse(res)
}
