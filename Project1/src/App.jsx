import { useState, useEffect } from 'react'
import ProductForm from './components/ProductForm.jsx'
import ProductList from './components/ProductList.jsx'
import { getProducts, createProduct, updateProduct, deleteProduct } from './api/products.js'

export default function App() {
  const [products, setProducts] = useState([])
  const [editingProduct, setEditingProduct] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState('')

  // Load products from the backend once when the page first opens
  useEffect(() => {
    loadProducts()
  }, [])

  async function loadProducts() {
    setLoading(true)
    setError('')
    try {
      const data = await getProducts()
      setProducts(data)
    } catch (err) {
      setError(`Could not load products. Is your FastAPI server running? (${err.message})`)
    } finally {
      setLoading(false)
    }
  }

  async function handleSave(productData) {
    setError('')
    try {
      if (editingProduct) {
        const updated = await updateProduct(editingProduct.id, productData)
        setProducts((prev) =>
          prev.map((p) => (p.id === editingProduct.id ? updated : p))
        )
        setEditingProduct(null)
      } else {
        const created = await createProduct(productData)
        setProducts((prev) => [...prev, created])
      }
    } catch (err) {
      setError(`Could not save product. (${err.message})`)
    }
  }

  async function handleDelete(id) {
    const confirmed = window.confirm('Delete this product? This cannot be undone.')
    if (!confirmed) return

    setError('')
    try {
      await deleteProduct(id)
      setProducts((prev) => prev.filter((p) => p.id !== id))
      // If we were editing the product we just deleted, clear the form
      if (editingProduct?.id === id) setEditingProduct(null)
    } catch (err) {
      setError(`Could not delete product. (${err.message})`)
    }
  }

  return (
    <div className="page">
      <header className="page-header">
        <h1>Product Management</h1>
        <p>Add, edit, and remove products in your store.</p>
      </header>

      {error && <div className="alert">{error}</div>}

      <ProductForm
        editingProduct={editingProduct}
        onSave={handleSave}
        onCancel={() => setEditingProduct(null)}
      />

      <section className="product-section">
        <div className="section-header">
          <h2>All Products ({products.length})</h2>
          <button className="btn-secondary" onClick={loadProducts}>
            Refresh
          </button>
        </div>

        {loading ? (
          <p>Loading products...</p>
        ) : (
          <ProductList
            products={products}
            onEdit={setEditingProduct}
            onDelete={handleDelete}
          />
        )}
      </section>
    </div>
  )
}
