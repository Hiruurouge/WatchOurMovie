from fastapi import FastAPI
from typing import List,Set
import requests

app = FastAPI()

@app.get("/api/predict")
async def predict(genres: Set[str]):
    url:str = ""
    r = requests.get(url)
    content:List[dict] = r.json()
    return content