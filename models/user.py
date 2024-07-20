from flask_login import UserMixin # type: ignore
from db import db

class User(UserMixin, db.Model):
    
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(45), nullable=False)
    password = db.Column(db.String(45), nullable=False)
    
    def __init__(self,id, username:str, password:str):
        self.id = id
        self.username = username
        self.password = password