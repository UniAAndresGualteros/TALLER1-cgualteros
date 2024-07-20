from flask import render_template, make_response
from flask_restful import Resource # type: ignore
from flask_login import login_required # type: ignore



class InicioController(Resource):
    
    @login_required
    def get(self):
        return make_response(render_template("inicio.html"))