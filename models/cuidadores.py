from db import db

class Cuidadores(db.Model):
   id = db.Column(db.Integer, primary_key=True) 
   nombre = db.Column(db.String(80), nullable=False)
   telefono = db.Column(db.String(12), nullable=False)
   ID_Guarderia = db.Column(db.Integer, db.ForeignKey('guarderias.id'), nullable=False)
   
   perros =db.relationship('Perros', backref='cuidadores',lazy=True)