from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine

db_url = "postgresql://postgres:sina1382riahi@localhost:5432/FastAPI"
engine = create_engine(db_url)
SessionLocal = sessionmaker(
    autoflush=False,
    bind=engine
)
