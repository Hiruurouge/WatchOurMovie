from fastapi import APIRouter,Depends, HTTPException, status
from ..auth.controller import get_current_user
from typing import Annotated
from schema import TokenData, UserBase, GroupBase
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