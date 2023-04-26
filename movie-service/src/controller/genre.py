import model
from schema import Genre, GenreBase
from sqlalchemy.orm import Session
from typing import List
from sqlalchemy.exc import IntegrityError
from fastapi import HTTPException, status

def create_genre(genre:Genre, db:Session):
    db_genre= model.Genre(uid=genre.uid, name=genre.name)
    try: 
        db.add(db_genre)
    except IntegrityError:
        db.rollback()
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Genre already exists.")
    else: 
        db.commit()
        db.refresh(db_genre)
        return db_genre.uid

def create_genres(genres:List[Genre],db:Session):
    db_genres = [model.Genre(uid=genre.uid, name=genre.name) for genre in genres]
    db.add_all(db_genres)
    db.commit()

    
def get_all_genres(db:Session):
    result = db.query(model.Genre).all()
    return result

def get_genre(genre: GenreBase, db:Session):
    result = db.query(model.Genre).filter(model.Genre.uid==genre.uid).first()
    return result

def delete_genre(genre: GenreBase, db:Session):
    db.query(model.Genre).filter(model.Genre.uid==genre.uid).delete()
    db.commit()

def update_genre(genre: Genre, db:Session):
    db_genre = get_genre(GenreBase(uid=genre.uid),db)
    if db_genre: 
        genre_data = genre.dict(exclude_unset=True)
        for key,value in genre_data.items():
            setattr(db_genre, key,value)
    db.add(db_genre)
    db.commit()
    db.refresh(db_genre)
    return db_genre
