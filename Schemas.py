
from pydantic import BaseModel
from typing import Optional
from datetime import date

class BookBase(BaseModel):
    title: str
    isbn: str
    author_id: int
    category_id: Optional[int]
    copies_available: int

class BookCreate(BookBase): pass

class Book(BookBase):
    book_id: int
    class Config:
        orm_mode = True
