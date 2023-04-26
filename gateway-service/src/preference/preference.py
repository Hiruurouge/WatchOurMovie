from fastapi import APIRouter,Depends, HTTPException, status
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData, UserBase, GroupBase, GenreBase, Preferences, ProductionBase, LikeProduction, LikeStaff, StaffBase, Staff
from dotenv import load_dotenv
from typing import List
import os
import requests
import json
load_dotenv()

PREFERENCES_URL=os.getenv("PREFERENCES_URL")
GROUP_URL = os.getenv("GROUP_URL")

router = APIRouter(
    prefix="/like",
    tags=['preferences']
)

@router.post("/genre")
def create_genre_preference(genres: List[GenreBase],token: Annotated[TokenData, Depends(get_current_user)]):
    db_preferences = [Preferences(id_user=int(token.uid), id_genre=genre.uid).dict() for genre in genres]
    response =  requests.post(f"{PREFERENCES_URL}/genre/like", data= json.dump(db_preferences))
    response.raise_for_status()
    response.json()

@router.post("/production")
def create_production_preference(productions: List[ProductionBase],token: Annotated[TokenData, Depends(get_current_user)]):
    db_productions = [LikeProduction(id_user=int(token.uid), id_production=production.uid).dict() for production in productions]
    response =  requests.post(f"{PREFERENCES_URL}/production/like", data= json.dump(db_productions))
    response.raise_for_status()
    response.json()

@router.post("/staff")
def create_staff_preference(staffs: List[StaffBase],token: Annotated[TokenData, Depends(get_current_user)]):
    db_staffs = [LikeStaff(id_user=int(token.uid), id_staff=staff.uid).dict() for staff in staffs]
    response =  requests.post(f"{PREFERENCES_URL}/staff/like", data= json.dump(db_staffs))
    response.raise_for_status()
    response.json()

@router.delete("/genre")
def delete_genre_preference(genre:GenreBase, token: Annotated[TokenData, Depends(get_current_user)]):
    db_genre = Preferences(id_user=int(token.uid), id_genre=genre.uid)
    response =  requests.delete(f"{PREFERENCES_URL}/genre/like", data= db_genre.json())
    response.raise_for_status()
    response.json() 

@router.delete("/staff")
def delete_staff_preference(staff: Staff, token: Annotated[TokenData, Depends(get_current_user)]):
    db_staff = LikeStaff(id_user=int(token.uid), id_staff=staff.uid)
    response =  requests.delete(f"{PREFERENCES_URL}/staff/like", data= db_staff.json())
    response.raise_for_status()
    response.json() 

@router.delete("/production")
def delete_production_preference(production: ProductionBase, token: Annotated[TokenData, Depends(get_current_user)]):
    db_production = LikeProduction(id_user=int(token.uid), id_production=production.uid)
    response =  requests.delete(f"{PREFERENCES_URL}/production/like", data= db_production.json())
    response.raise_for_status()
    response.json() 

@router.get("/user")
def get_user_preference(token: Annotated[TokenData,Depends(get_current_user)]):
    response = requests.get(f"{PREFERENCES_URL}/user/like", params={"uid":int(token.uid)})
    response.raise_for_status()
    return response.json()

@router.post("/group")
def get_group_preference(group: GroupBase,token: Annotated[TokenData,Depends(get_current_user)]):
    users_response = requests.get(f"{GROUP_URL}/users" ,params={"uid":group.uid}) 
    users = users_response.json()
    users_id: List[UserBase] = [UserBase(uid = int(x['uid'])).dict() for x in users]
    if not (int(token.uid) in users_id):
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Access Denied.")
    
    result = requests.post(f"{PREFERENCES_URL}/group/like", data=json.dump(users_id))
    result.raise_for_status()
    return result.json()