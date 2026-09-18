from sqlalchemy import Column, Integer, String, Text, ForeignKey
from sqlalchemy.orm import relationship

from .database import Base


class Technology(Base):
    __tablename__ = "technologies"

    id = Column(Integer, primary_key=True)
    name = Column(String(100), unique=True, nullable=False)
    description = Column(Text)

    categories = relationship(
        "Category",
        back_populates="technology"
    )


class Category(Base):
    __tablename__ = "categories"

    id = Column(Integer, primary_key=True)
    technology_id = Column(
        Integer,
        ForeignKey("technologies.id"),
        nullable=False
    )
    name = Column(String(100), nullable=False)
    description = Column(Text)

    technology = relationship(
        "Technology",
        back_populates="categories"
    )

    questions = relationship(
        "Question",
        back_populates="category"
    )


class Question(Base):
    __tablename__ = "questions"

    id = Column(Integer, primary_key=True)
    category_id = Column(
        Integer,
        ForeignKey("categories.id"),
        nullable=False
    )
    question = Column(Text, nullable=False)
    answer = Column(Text)
    explanation = Column(Text)
    difficulty = Column(String(20), nullable=False)

    category = relationship(
        "Category",
        back_populates="questions"
    )
