from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import json
import users
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


@app.route("/users")  # Get all users
def getAllUsers():
    return users.getUsers()


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080', ssl_context=(
        'cert.pem', 'privkey.pem'))  # Run the flask app at port 8080
