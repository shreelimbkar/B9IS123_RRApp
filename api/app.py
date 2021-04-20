from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import datetime
import json
import users
import resources
mysql = MySQL()
app = Flask(__name__)
CORS(app)


# Initialize the Database connection
def initDB():
    app.config['MYSQL_USER'] = 'web'
    app.config['MYSQL_PASSWORD'] = 'webPass'
    app.config['MYSQL_DB'] = 'rating_db'
    app.config['MYSQL_HOST'] = 'localhost'  # for now
    mysql.init_app(app)


initDB()


@app.route("/")
def initApp():
    return("Welcome to Rating App API Page")
# @app.route("/add")  # Add Student
# def add():
#     name = request.args.get('name')
#     email = request.args.get('email')
#     cur = mysql.connection.cursor()  # create a connection to the SQL instance
#     s = '''INSERT INTO students(studentName, email) VALUES('{}','{}');'''.format(
#         name, email)
#     cur.execute(s)
#     mysql.connection.commit()

#     return '{"Result":"Success"}'


@app.route("/users/add", methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        role = "003"
        token = "29347skdfhsdhf"
        username = request.form['username']
        email = request.form['email']
        pwd = request.form['password']
        avatar = 'avatar.img'
        contact = request.form['contact']
        modifiedDate = datetime.datetime.now()
        userData = [
            role, token, username, email, pwd, avatar, contact, modifiedDate
        ]
    return users.addUser(userData)


@app.route("/users")  # Get all users
def getAllUsers():
    return users.getUsers()


@app.route("/resources")  # Get all resources
def getAllResources():
    return resources.getResources()


@app.route("/resources/allbnbs")  # Get all Bnbs
def getAllBnbs():
    return resources.getAllBnbs()


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080', ssl_context=(
        'cert.pem', 'privkey.pem'))  # Run the flask app at port 8080
