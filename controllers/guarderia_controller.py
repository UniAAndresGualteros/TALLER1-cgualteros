from flask import render_template, make_response
from flask_restful import Resource # type: ignore
from flask_login import login_required # type: ignore
from models.guarderias import Guarderias
from db import db


class GuarderiaController(Resource):
    
    @login_required
    def get(self):
        guarderias = Guarderias.query.all()
        return make_response(render_template("guarderias.html",guarderias=guarderias))
    
    """
    def post(self):
        guarderia = Guarderias(nombre="Guarderia la Tercera", direccion="Calle de la Esperanza", telefono="6014568954")
        db.session.add(guarderia)
        db.session.commit()
        return "Guarderia Creada con exito" 
        
    """