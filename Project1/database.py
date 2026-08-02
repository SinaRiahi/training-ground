from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

db_url = "postgresql://sina:sina@localhost:5432/project1"
engine = create_engine(db_url, echo=True)
SessionLocal = sessionmaker(
    autoflush=False,
    bind=engine
)