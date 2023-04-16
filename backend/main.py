from fastapi import FastAPI
from getMovie import *

app = FastAPI()

@app.post("/ia/predict")
async def predict(preferences: dict):
    return recommander_films(preferences)

@app.get("/ia/test")
async def test():
    return "ça marche"