from db import db

class Perros(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(80), nullable=False)
    raza = db.Column(db.String(20), nullable=False)
    edad = db.Column(db.Float, nullable=False)
    peso = db.Column(db.Float, nullable=False)
    ID_Guarderia = db.Column(db.Integer, db.ForeignKey('guarderias.id'), nullable=False)
    ID_Cuidador = db.Column(db.Integer, db.ForeignKey('cuidadores.id'), nullable=False)
    