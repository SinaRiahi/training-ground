import { useState, useEffect } from 'react'

const emptyProduct = {
  name: '',
  description: '',
  price: '',
  stock: '',
  category: '',
}

// This form is used for BOTH adding a new product and editing an existing one.
// If "editingProduct" is passed in, we pre-fill the fields and switch to edit mode.
export default function ProductForm({ editingProduct, onSave, onCancel }) {
  const [form, setForm] = useState(emptyProduct)
  const [error, setError] = useState('')

  useEffect(() => {
    if (editingProduct) {
      setForm(editingProduct)
    } else {
      setForm(emptyProduct)
    }
  }, [editingProduct])

  function handleChange(e) {
    const { name, value } = e.target
    setForm((prev) => ({ ...prev, [name]: value }))
  }

  function handleSubmit(e) {
    e.preventDefault()
    setError('')

    if (!form.name.trim()) {
      setError('Product name is required.')
      return
    }
    if (form.price === '' || Number(form.price) < 0) {
      setError('Please enter a valid price.')
      return
    }
    if (form.stock === '' || Number(form.stock) < 0) {
      setError('Please enter a valid stock quantity.')
      return
    }

    // Convert to correct types before sending to the backend
    onSave({
      ...form,
      price: Number(form.price),
      stock: Number(form.stock),
    })
  }

  return (
    <form className="product-form" onSubmit={handleSubmit}>
      <h2>{editingProduct ? 'Edit Product' : 'Add New Product'}</h2>

      {error && <p className="form-error">{error}</p>}

      <label>
        Name
        <input
          type="text"
          name="name"
          value={form.name}
          onChange={handleChange}
          placeholder="e.g. Wireless Mouse"
        />
      </label>

      <label>
        Description
        <textarea
          name="description"
          value={form.description}
          onChange={handleChange}
          placeholder="Short description of the product"
          rows={3}
        />
      </label>

      <div className="form-row">
        <label>
          Price ($)
          <input
            type="number"
            name="price"
            value={form.price}
            onChange={handleChange}
            step="0.01"
            min="0"
            placeholder="0.00"
          />
        </label>

        <label>
          Stock
          <input
            type="number"
            name="stock"
            value={form.stock}
            onChange={handleChange}
            min="0"
            placeholder="0"
          />
        </label>
      </div>

      <label>
        Category
        <input
          type="text"
          name="category"
          value={form.category}
          onChange={handleChange}
          placeholder="e.g. Electronics"
        />
      </label>

      <div className="form-actions">
        <button type="submit" className="btn-primary">
          {editingProduct ? 'Save Changes' : 'Add Product'}
        </button>
        {editingProduct && (
          <button type="button" className="btn-secondary" onClick={onCancel}>
            Cancel
          </button>
        )}
      </div>
    </form>
  )
}
