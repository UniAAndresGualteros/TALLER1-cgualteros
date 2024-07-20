from flask import Flask,  request, render_template, redirect, url_for
from flask_login import LoginManager, login_required, login_user # type: ignore
from dotenv import load_dotenv # type: ignore
from flask_restful import Api # type: ignore
from db import db
from controllers.guarderia_controller import GuarderiaController
from controllers.cuidadores_controller import CuidadoresController
from controllers.perros_controller import PerrosController
from models.user import User
import os


load_dotenv()

secret_key = os.urandom(24)
print(secret_key.hex())

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = f'mysql://{os.getenv("USER_DB")}:{os.getenv("PASSWORD_DB")}@{os.getenv("HOST_DB")}/{os.getenv("SCHEMA_DB")}'
app.config["SECRET_KEY"] = secret_key
db.init_app(app)
api = Api(app)
login_manager = LoginManager(app)


@login_manager.user_loader
def load_user(user_id):
    user = User.query.get(user_id)
    if user:
        return user
    return None

  
    
@app.route("/")
@login_required
def main():
    return "Estoy Logueado dentro del sistema"


@app.route("/login", methods=['GET','POST'])
def login():
    if request.method == 'GET':
        return render_template("login.html")
    else:
        
        username = request.form['username']
        password = request.form['password']
        user = User.query.filter_by(username=username, password=password).first()
        if user:
            login_user(user)
            return redirect(url_for("main"))
    return render_template("login.html")

        
    

api.add_resource(GuarderiaController, "/guarderias")
api.add_resource(CuidadoresController, "/cuidadores")
api.add_resource(PerrosController, "/perros")
 




