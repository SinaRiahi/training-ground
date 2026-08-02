export default function ProductList({ products, onEdit, onDelete }) {
  if (products.length === 0) {
    return <p className="empty-state">No products yet. Add your first one above.</p>
  }

  return (
    <table className="product-table">
      <thead>
        <tr>
          <th>Name</th>
          <th>Category</th>
          <th>Price</th>
          <th>Stock</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        {products.map((product) => (
          <tr key={product.id}>
            <td>
              <div className="product-name">{product.name}</div>
              {product.description && (
                <div className="product-desc">{product.description}</div>
              )}
            </td>
            <td>{product.category || '—'}</td>
            <td>${Number(product.price).toFixed(2)}</td>
            <td>
              <span className={product.stock === 0 ? 'stock-badge out' : 'stock-badge'}>
                {product.stock}
              </span>
            </td>
            <td className="actions-cell">
              <button className="btn-small" onClick={() => onEdit(product)}>
                Edit
              </button>
              <button className="btn-small btn-danger" onClick={() => onDelete(product.id)}>
                Delete
              </button>
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  )
}
