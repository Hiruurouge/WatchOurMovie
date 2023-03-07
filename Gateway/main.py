from fastapi import FastAPI
from typing import List
import requests

app = FastAPI()

@app.post("/api/predict")
async def predict(preferences: dict):
    prefix:str = "http://0.0.0.0:8080"
    url:str = prefix + "/ia/predict"
    r:requests.Response = requests.post(url, json=preferences)
    content:List[str] = r.json()
    return content

@app.get("/api/test/ia")
async def test():
    r:requests.Response = requests.get("http://0.0.0.0:8080/ia/test", verify=False)
    return r.json()