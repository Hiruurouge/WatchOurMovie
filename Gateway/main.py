from fastapi import FastAPI
from typing import List,Set
import requests

app = FastAPI()

@app.get("/api/predict")
async def predict(user: Set[dict]):
    url:str = ""
    r = requests.get(url, user)
    content:List[dict] = r.json()
    return content