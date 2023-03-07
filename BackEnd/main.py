from fastapi import FastAPI
from getMovie import *

app = FastAPI()

@app.get("/ia/predict")
async def predict(preferences: dict):

    return recommander_films(preferences)