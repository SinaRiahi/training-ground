# 🐍 Python Backend Cheat Sheet

## Project Structure

``` text
project/
│
├── main.py          # FastAPI application
├── database.py      # Database connection
├── models.py        # SQLAlchemy models
├── schemas.py       # Pydantic models
├── crud.py          # Database operations
├── requirements.txt
└── .venv/
```

------------------------------------------------------------------------

# FastAPI

## Create an app

``` python
from fastapi import FastAPI

app = FastAPI()
```

Creates the FastAPI application object.

## GET Endpoint

``` python
@app.get("/")
def root():
    return {"message": "Hello World"}
```

## POST Endpoint

``` python
@app.post("/products")
def create_product():
    return {"status": "created"}
```

## PUT Endpoint

``` python
@app.put("/products/{id}")
```

Updates existing data.

## DELETE Endpoint

``` python
@app.delete("/products/{id}")
```

Deletes existing data.

## Path Parameters

``` python
@app.get("/products/{id}")
def get_product(id: int):
    return id
```

`/products/5` → `id = 5`

## Query Parameters

``` python
@app.get("/products")
def get_products(limit: int = 10):
    return limit
```

`/products?limit=20` → `limit = 20`

## Request Body

``` python
from pydantic import BaseModel

class Product(BaseModel):
    name: str
    price: float

@app.post("/products")
def create_product(product: Product):
    return product
```

------------------------------------------------------------------------

# Uvicorn

Runs your FastAPI application.

## Start server

``` bash
uvicorn main:app --reload
```

Meaning:

-   `main` → `main.py`
-   `app` → `app = FastAPI()`
-   `--reload` → restart automatically when files change

## Other useful options

``` bash
uvicorn main:app --reload --port 8080
```

Run on another port.

``` bash
uvicorn main:app --host 0.0.0.0
```

Allow access from other devices.

------------------------------------------------------------------------

# SQLAlchemy

## Imports

``` python
from sqlalchemy import Column, Integer, String, Float
from sqlalchemy.orm import declarative_base
```

## Base class

``` python
Base = declarative_base()
```

All database models inherit from this.

## Create a model

``` python
class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    price = Column(Float)
```

Each class represents a table.

Each attribute represents a column.

## Common column types

-   `Integer`
-   `String`
-   `Float`
-   `Boolean`
-   `DateTime`

## Useful column options

``` python
primary_key=True
index=True
unique=True
nullable=False
default=0
```

## Create database engine

``` python
from sqlalchemy import create_engine

DATABASE_URL = "sqlite:///database.db"

engine = create_engine(DATABASE_URL)
```

## Create session

``` python
from sqlalchemy.orm import sessionmaker

SessionLocal = sessionmaker(bind=engine)
```

Open:

``` python
db = SessionLocal()
```

Close:

``` python
db.close()
```

## Create tables

``` python
Base.metadata.create_all(bind=engine)
```

------------------------------------------------------------------------

# CRUD

## Create

``` python
product = Product(name="Keyboard", price=49.99)

db.add(product)
db.commit()
db.refresh(product)
```

## Read all

``` python
products = db.query(Product).all()
```

## Read one

``` python
product = db.query(Product).filter(Product.id == 5).first()
```

## Update

``` python
product.price = 25
db.commit()
```

## Delete

``` python
db.delete(product)
db.commit()
```

------------------------------------------------------------------------

# Terminal Commands

Create virtual environment

``` bash
python -m venv .venv
```

Windows

``` bash
.venv\Scripts\activate
```

macOS/Linux

``` bash
source .venv/bin/activate
```

Install packages

``` bash
pip install fastapi sqlalchemy uvicorn
```

Freeze requirements

``` bash
pip freeze > requirements.txt
```

Install from requirements

``` bash
pip install -r requirements.txt
```

------------------------------------------------------------------------

# Mental Model

``` text
Browser / Postman
        │
        ▼
     FastAPI
        │
        ▼
    SQLAlchemy
        │
        ▼
     Database
```

-   **FastAPI** → Defines API routes and business logic.
-   **Uvicorn** → Runs the web server.
-   **SQLAlchemy** → Maps Python objects to database tables.
