from fastapi import FastAPI
from models import Product
app = FastAPI()

@app.get("/")
def greet():
    return"Welcome!"

products = [
    Product(id=1,name="phone",description="Budget phone",price=299.99,quantity=100),
    Product(id=2,name="laptop",description="Budget laptop",price=999.99,quantity=25),
    Product(id=3,name="tablet",description="Budget tablet",price=499.99,quantity=80),
    Product(id=4,name="headphone",description="Budget headphone",price=99.99,quantity=300),
    Product(id=5,name="monitor",description="Budget monitor",price=199.99,quantity=15)
]

@app.get("/products")
def get_all_products():
    return products


@app.get("/product/{id}")
def get_product_by_id(id:int):
    for product in products:
        if product.id == id:
            return product
    return "Product not found"

@app.post("/product")
def add_product(product: Product):
    products.append(product)
    return product

@app.put("/products")
def update_product(id:int,product:Product):
    for i in range(len(products)):
        if products[i].id == id:
            products[i] = product
            return "Changes successful!"
    return "There's an error!"

@app.delete("/products")
def delete_product(id:int):
    for i in range(len(products)):
        if products[i].id == id:
            del products[i]
            return "Removed successfly!"
    return "Not removed!"