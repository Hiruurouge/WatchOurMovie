from fastapi import APIRouter,Depends, HTTPException, status
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData, GenreBase, Preferences, ProductionBase, LikeProduction, LikeStaff, StaffBase, UserBase, GroupBase
from dotenv import load_dotenv
from typing import List
import os
import requests
import json
load_dotenv()

GENRE_URL = os.getenv("GENRE_URL")
PRODUCTION_URL= os.getenv("PRODUCTION_URL")
STAFF_URL = os.getenv("STAFF_URL")
GROUP_URL = os.getenv("GROUP_URL")

router = APIRouter(
    prefix="/like",
    tags=['preferences']
)

@router.get('/genre')
def get_genre_preference(token: Annotated[TokenData,Depends(get_current_user)]):
    db_preferences = requests.get(f"{GENRE_URL}/like/all", params={"uid":token.uid})
    db_preferences.raise_for_status()
    return db_preferences.json()

@router.post("/genre")
def create_genre_preference(genres: List[GenreBase], token: Annotated[TokenData,Depends(get_current_user)]):
    preferences = [Preferences(id_user=int(token.uid), id_genre=genre.uid).dict() for genre in genres]
    result = requests.post(f"{GENRE_URL}/like", data=json.dumps(preferences))
    result.raise_for_status()
    return result.json()

@router.delete("/genre")
def delete_genre_preference(genre: GenreBase,token: Annotated[TokenData,Depends(get_current_user)]):
    preference= Preferences(id_user=int(token.uid),id_genre=genre.uid)
    result = requests.delete(f"{GENRE_URL}/like",data=preference.json())
    result.raise_for_status()
    return result.json()

@router.get("/production")
def get_production_preference(token: Annotated[TokenData,Depends(get_current_user)]):
    db_preferences = requests.get(f"{PRODUCTION_URL}/like/all", params={"uid":token.uid})
    db_preferences.raise_for_status()
    return db_preferences.json()

@router.post("/production")
def create_production_preference(productions: List[ProductionBase], token: Annotated[TokenData,Depends(get_current_user)]):
    preferences = [LikeProduction(id_user=int(token.uid), id_production=production.uid).dict() for production in productions]
    result = requests.post(f"{PRODUCTION_URL}/like", data=json.dumps(preferences))
    result.raise_for_status()
    return result.json()

@router.delete("/production")
def delete_production_preference(production: ProductionBase,token: Annotated[TokenData,Depends(get_current_user)]):
    preference= LikeProduction(id_user=int(token.uid),id_production=production.uid)
    result = requests.delete(f"{PRODUCTION_URL}/like",data=preference.json())
    result.raise_for_status()
    return result.json()

@router.get("/staff")
def get_staff_preference(token: Annotated[TokenData,Depends(get_current_user)]):
    db_preferences = requests.get(f"{STAFF_URL}/like/all", params={"uid":token.uid})
    db_preferences.raise_for_status()
    return db_preferences.json()

@router.post("/staff")
def create_staff_preference(staffs: List[StaffBase], token: Annotated[TokenData,Depends(get_current_user)]):
    preferences = [LikeStaff(id_user=int(token.uid), id_staff=staff.uid).dict() for staff in staffs]
    result = requests.post(f"{STAFF_URL}/like", data=json.dumps(preferences))
    result.raise_for_status()
    return result.json()

@router.delete("/staff")
def delete_staff_preference(staff: StaffBase,token: Annotated[TokenData,Depends(get_current_user)]):
    preference= LikeStaff(id_user=int(token.uid),id_staff=staff.uid)
    result = requests.delete(f"{STAFF_URL}/like",data=preference.json())
    result.raise_for_status()
    return result.json()

@router.post("/group")
def get_group_preference(group: GroupBase,token: Annotated[TokenData,Depends(get_current_user)]):
    users_response = requests.get(f"{GROUP_URL}/users" ,params={"uid":group.uid}) 
    users = users_response.json()
    users_id: List[UserBase] = [UserBase(uid = int(x['uid'])) for x in users]
    if not (int(token.uid) in users_id):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Access Denied.")
    
    result = requests.post(f"{GROUP_URL}/like", data=users_id)
    result.raise_for_status()
    return result.json()