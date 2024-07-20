from flask import render_template, make_response
from flask_restful import Resource # type: ignore
from models.cuidadores import Cuidadores


class CuidadoresController(Resource):
    
    def get(self):
        cuidadores = Cuidadores.query.all()
        return make_response(render_template("cuidadores.html",cuidadores=cuidadores))
    