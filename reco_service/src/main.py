from fastapi import FastAPI, HTTPException
from pyparsing import Optional

from schema.prediction import Prediction
from .controller import recommander_films
app = FastAPI()

@app.post("/ia/predict")
async def predict(preferences:Prediction, groupId=None, userId=None):
    if groupId is not None:
        return recommander_films(preferences.json(), groupId=groupId)
    elif userId is not None:
        return recommander_films(preferences.json(), userId=userId)
    else:
        raise HTTPException(status_code=400, detail="Invalid payload")

@app.get("/ia/test")
async def test():
    return "ça marche"