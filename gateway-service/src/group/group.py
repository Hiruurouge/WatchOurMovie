from fastapi import APIRouter,Depends,HTTPException,status
from ..auth.controller import get_current_user
from schema import Group, GroupBase,Belong,TokenData, UserBase
from dotenv import load_dotenv
from typing import Annotated, List
import os
import requests
import json
GROUP_URL = os.getenv('GROUP_URL')
router = APIRouter(
    prefix="/group",
    tags=["group"]
)

@router.get("/")
def get_group(uid:int, token :Annotated[TokenData,Depends(get_current_user)]):
    users_response = requests.get(f"{GROUP_URL}/users", params={"uid":uid})
    users_response.raise_for_status()
    users = users_response.json()
    users_id= [x['uid'] for x in users]
    if int(token.uid) in users_id:
        group_response = requests.get(GROUP_URL,params={"uid":uid})
        group_response.raise_for_status()
    else:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED,detail="Access Denied")
    return group_response.json()
    
@router.delete("/")
def delete_group(group:GroupBase, token :Annotated[TokenData,Depends(get_current_user)]):
    group_response = requests.get(GROUP_URL,params={"uid":group.uid})
    group_response.raise_for_status()
    group_dict =group_response.json()
    if group_dict['uid'] ==token.uid: 
        response = requests.delete(GROUP_URL,data=group.json())
        response.raise_for_status()
        return response.status_code
    else: 
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="You can't delete this group.Please ask to the group's owner.")

@router.patch("/")
def update_group(group:Group, token :Annotated[TokenData,Depends(get_current_user)]):
    group_response = requests.get(GROUP_URL,params={"uid": group.uid})
    group_response.raise_for_status()
    group_db= group_response.json()
    if group_db["owner"]==int(token.uid):
        response = requests.patch(GROUP_URL, data= group.json())
        response.raise_for_status()
    else:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Access Denied.")  
    return response.json()

@router.post("/")
def create_group(group:Group, token: Annotated[TokenData,Depends(get_current_user)]):
    group.owner= token.uid
    response = requests.post(GROUP_URL,data= group.json())
    response.raise_for_status()
    return response.status_code

@router.get("/users")
def get_users_by_group(uid:int, token: Annotated[TokenData,Depends(get_current_user)]):
    users_response = requests.get(f"{GROUP_URL}/users" ,params={"uid":uid}) 
    users = users_response.json()
    users_id= [x['uid'] for x in users]
    if int(token.uid) in users_id:
        return users
    else: 
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Access Denied.")

    
@router.post("/add")
def add_user_to_group(users: List[UserBase], group:GroupBase, token: Annotated[TokenData,Depends(get_current_user)]):
    group_response = requests.get(GROUP_URL,params={"uid":group.uid})
    group_response.raise_for_status()
    group= group_response.json()
    if group['owner']==int(token.uid):
        belong_list=[Belong(id_group=group["uid"], id_user=user.uid).dict() for user in users]
        response = requests.post(f"{GROUP_URL}/add", data=json.dumps(belong_list))
        response.raise_for_status()
    else: 
        raise HTTPException(status_code=400, detail= "You're not the group owner.")
    return response.json()
    
@router.post("/quit")
def quit_group(group: GroupBase,token: Annotated[TokenData,Depends(get_current_user)]):
    response = requests.post(f"{GROUP_URL}/quit", data = Belong(id_group=group.uid, id_user=token.uid).json())
    response.raise_for_status()

@router.get("/all")
def get_groups_by_user(token: Annotated[TokenData,Depends(get_current_user)]):
    response = requests.get(f"{GROUP_URL}/all",params={"uid":int(token.uid)})
    response.raise_for_status()
    return response.json()