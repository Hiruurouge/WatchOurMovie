from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from .auth import auth
from .user import user
from .tmdb import tmdb
from .recommendation import recommendation
app = FastAPI()
subapi = FastAPI()


subapi.include_router(auth.router)
subapi.include_router(recommendation.router)
subapi.include_router(user.router)
subapi.include_router(tmdb.router)
app.mount("/api", subapi)