from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .questions import router as questions_router


app = FastAPI(
    title="DevPrep API",
    version="0.1.0"
)


app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:5173"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health")
def health_check():
    return {
        "status": "healthy",
        "service": "devprep-api",
        "version": "0.1.0"
    }


@app.get("/")
def root():
    return {
        "message": "Welcome to DevPrep API"
    }


app.include_router(questions_router)
