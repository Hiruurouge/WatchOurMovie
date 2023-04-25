from fastapi import FastAPI

from schema.prediction import Prediction
from .controller import recommander_films
app = FastAPI()

@app.post("/ia/predict")
async def predict(preferences: Prediction):
    return recommander_films(preferences.json())

@app.get("/ia/test")
async def test():
    return "ça marche"