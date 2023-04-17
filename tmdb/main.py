from fastapi import FastAPI
from tmdb import get_movie


app = FastAPI()

@app.get("/api/movie")
async def movie(title: str):
    return get_movie(title)