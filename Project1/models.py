from pydantic import BaseModel
class product(BaseModel):
    name: str
    description: str 
    price: float
    stock: int
    category: str
class product_create(product):
    pass
class product_response(product):
    id: int