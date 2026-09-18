from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from .database import get_db
from .models import Question

router = APIRouter(
    prefix="/questions",
    tags=["Questions"]
)


@router.get("/")
def get_questions(
    db: Session = Depends(get_db)
):
    questions = db.query(Question).all()

    return questions
