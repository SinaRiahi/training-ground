from fastapi import FastAPI, Depends
from models import Product
from database import SessionLocal, engine
import database_models
from sqlalchemy.orm import Session

app = FastAPI()

database_models.Base.metadata.create_all(bind=engine)

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
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

def init_db():
    db = SessionLocal()
    for product in products:
        db.add(database_models.Product(**product.model_dump()))
    db.commit()
# init_db() # use this to import the products 

@app.get("/products")
def get_all_products(db: Session = Depends(get_db)):
    db_products = db.query(database_models.Product).all()
    # db = Session()
    # db.query()
    return db_products


@app.get("/product/{id}")
def get_product_by_id(id:int, db:Session=Depends(get_db)):
    db_product = db.query(database_models.Product).filter(database_models.Product.id == id).first()
    # for product in products:
    #     if product.id == id:
    if db_product:
            return db_product
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