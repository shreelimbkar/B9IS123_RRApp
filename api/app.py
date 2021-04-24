from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import jwt
import hashlib
import datetime
from functools import wraps
import json
import users
import resources
mysql = MySQL()
app = Flask(__name__)
CORS(app)

app.config['SECRET_KEY'] = 'rating_app@2021'
# Initialize the Database connection


def initDB():
    app.config['MYSQL_USER'] = 'web'
    app.config['MYSQL_PASSWORD'] = 'webPass'
    app.config['MYSQL_DB'] = 'rating_db'
    app.config['MYSQL_HOST'] = 'localhost'  # for now
    mysql.init_app(app)


initDB()


def token_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token1 = request.args.get('token')
        print('my token', token1)

        if not token1:
            return {"message": "Token is missing"}, 403

        try:
            data = jwt.decode(token1, app.config['SECRET_KEY'])
        except:
            return {"message": "Token is invalid!"}, 403

        return f(*args, **kwargs)
    return decorated


@app.route("/")
def initApp():
    return("Welcome to Rating App API Page")


@app.route("/users/register", methods=['POST'])
def index():
    if request.method == 'POST':
        req_json = request.json
        role = "003"
        token = "29347skdfhsdhf"
        username = req_json['username']
        email = req_json['email']
        pwd = req_json['password']
        avatar = 'avatar.png'
        contact = req_json['contact']
        modifiedDate = datetime.datetime.now()
        # Password encryption with Salt and hash
        salt = hashlib.md5(pwd.encode())
        pwd = salt.hexdigest()
        userData = [
            role, token, username, email, pwd, avatar, contact, modifiedDate
        ]
    return users.addUser(userData)


@app.route("/login", methods=['POST'])  # Login user
def userLogin():
    if request.method == 'POST':
        req_json = request.json
        email = req_json['email']
        pwd = req_json['password']
        salt = hashlib.md5(pwd.encode())
        pwd = salt.hexdigest()
    return users.login(email, pwd)


@app.route("/users")  # Get all users
# @token_required
def getAllUsers():
    return users.getUsers()


@app.route("/resources", methods=['GET'])  # Get all resources
def getAllResources():
    if request.method == 'GET':
        category = request.args.get('category')

    return resources.getResources(category)


@app.route("/resources/allbnbs")  # Get all Bnbs
def getAllBnbs():
    return resources.getAllBnbs()


@app.route("/users/register", methods=['POST'])
def index1():
    if request.method == 'POST':
        req_json = request.json
        role = "003"
        token = "29347skdf#$7hsdhf"
        username = req_json['username']
        email = req_json['email']
        pwd = req_json['password']
        avatar = 'avatar.png'
        contact = req_json['contact']
        modifiedDate = datetime.datetime.now()
        # Password encryption with Salt and hash
        salt = hashlib.md5(pwd.encode())
        pwd = salt.hexdigest()
        userData = [
            role, token, username, email, pwd, avatar, contact, modifiedDate
        ]
    return users.addUser(userData)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080', ssl_context=(
        'cert.pem', 'privkey.pem'))  # Run the flask app at port 8080
