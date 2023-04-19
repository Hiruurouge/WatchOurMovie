import os
from dotenv import load_dotenv
from fastapi import FastAPI, Depends
from sqlalchemy import create_engine
from sqlalchemy.orm import Session, sessionmaker

from .tmdb import get_and_put_movie_and_all

load_dotenv()

MYSQL_DATABASE_URL= os.getenv('MYSQL_DATABASE_URL')

engine = create_engine(MYSQL_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/tmdb/movie")
async def put_tmdb_movie_cast_prod_in_db(title: str, db: Session=Depends(get_db)):
    get_and_put_movie_and_all(db,title)