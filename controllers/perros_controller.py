from flask import render_template, make_response
from flask_restful import Resource # type: ignore
from models.perros import Perros


class PerrosController(Resource):
    
    def get(self):
        perros = Perros.query.all()
        return make_response(render_template("perros.html",perros=perros))