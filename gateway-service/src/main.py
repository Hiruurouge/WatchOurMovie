from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordRequestForm
from .auth import auth
from .user import user
from .tmdb import tmdb
from .recommendation import recommendation
from .preference import preference
from .recommendation import recommendation
from fastapi.middleware.cors import CORSMiddleware

from .group import group

app = FastAPI()
subapi = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

subapi.include_router(auth.router)
subapi.include_router(recommendation.router)
subapi.include_router(user.router)
subapi.include_router(preference.router)
subapi.include_router(group.router)
subapi.include_router(tmdb.router)
app.mount("/api", subapi)