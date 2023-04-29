from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import OAuth2PasswordRequestForm
from .auth import auth
from .user import user
from .tmdb import tmdb
from .recommendation import recommendation
from .preference import preference
from .visualize import visualize
from .recommendation import recommendation
from .group import group
from .production import production
from .staff import staff
from .movie import movie
from .genre import genre

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
subapi.include_router(visualize.router)
subapi.include_router(production.router)
subapi.include_router(genre.router)
subapi.include_router(staff.router)
subapi.include_router(movie.router)
app.mount("/api", subapi)