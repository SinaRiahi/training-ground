from datetime import datetime
from sqlalchemy import String, Text
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column

class Base(DeclarativeBase):
    pass

class Project(Base):
    __tablename__ = "projects"
    id : Mapped[int] = mapped_column(primary_key=True)
    name : Mapped[str] = mapped_column(String(100))
    description : Mapped[str] = mapped_column(Text)
    priority : Mapped[int]
    created_at : Mapped[datetime]