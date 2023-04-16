from fastapi import FastAPI
from typing import List
import tmdb

app = FastAPI()

@app.get("/api/movie")
async def movie_details(title: str):
    return tmdb.get_movie_details(tmdb.get_movie_id(title))