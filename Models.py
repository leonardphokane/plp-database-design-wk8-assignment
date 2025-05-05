from sqlalchemy import Column, Integer, String, Date, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

class Book(Base):
    __tablename__ = "books"
    book_id = Column(Integer, primary_key=True, index=True)
    title = Column(String(255), nullable=False)
    isbn = Column(String(20), unique=True, nullable=False)
    author_id = Column(Integer, nullable=False)
    category_id = Column(Integer)
    copies_available = Column(Integer, default=0)

class Member(Base):
    __tablename__ = "members"
    member_id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    join_date = Column(Date)

class Loan(Base):
    __tablename__ = "loans"
    loan_id = Column(Integer, primary_key=True, index=True)
    book_id = Column(Integer, ForeignKey("books.book_id"))
    member_id = Column(Integer, ForeignKey("members.member_id"))
    loan_date = Column(Date)
    return_date = Column(Date)






