from fastapi import FastAPI, Depends
from fastapi.middleware.cors import CORSMiddleware
from database import SessionLocal, engine
import models
from sqlalchemy.orm import Session
import db_models
app = FastAPI()

app.add_middleware(
     CORSMiddleware,
     allow_origins=["http://localhost:5173"],
     allow_methods=['*']
)
db_models.Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    except:
        print("Could not reach database!")
    finally:
        db.close()


@app.get("/products", response_model=list[models.product_response])
def read_products(db: Session=Depends(get_db)):
    return db.query(db_models.Product).all()


@app.post("/products", response_model=models.product_response)
def create_products(product: models.product_create, db: Session = Depends(get_db)):
    target = db_models.Product(**product.model_dump())
    db.add(target)
    db.commit()
    db.refresh(target)
    return target


@app.put("/products/{id}")
def update_products(id:int,product: models.product_create, db: Session=Depends(get_db)):
    target = db.query(db_models.Product).filter(db_models.Product.id == id).first()
    if target:
        target.name = product.name
        target.description = product.description
        target.price = product.price
        target.stock = product.stock
        target.category = product.category
        db.commit()
        return product
    else:
        return "Unsuccessful!"

@app.delete("/products/{id}")
def delete_products(id:int, db: Session=Depends(get_db)):
    target = db.query(db_models.Product).filter(db_models.Product.id == id).first()
    if target:
        db.delete(target)
        db.commit()
        return target
    else:
        return "Unsuccessful!"