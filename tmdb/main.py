from fastapi import FastAPI
from sqlalchemy.orm import Session

from .tmdb import get_and_put_movie_and_all

app = FastAPI()

@app.get("/tmdb/movie")
async def put_tmdb_movie_cast_prod_in_db(title: str):
    # TODO c'est quoi cette Session de ses morts ?
    db = Session()
    get_and_put_movie_and_all(db,title)