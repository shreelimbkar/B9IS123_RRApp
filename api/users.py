from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import jwt
import datetime
import json
mysql = MySQL()
app = Flask(__name__)
CORS(app)

app.config['SECRET_KEY'] = 'rating_app@2021'


def addUser(userData):
    role, token, username, email, pwd, avatar, contact, modifiedDate = userData
    cur = mysql.connection.cursor()  # SQL instance
    s = '''INSERT INTO user_table(user_role_id, user_token, user_password, user_name, user_avatar_img, user_email_id, user_contact, modified_date, created_date ) VALUES('{}','{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');'''.format(
        role, token, pwd, username, avatar, email, contact, modifiedDate, modifiedDate)
    cur.execute(s)
    mysql.connection.commit()
    return {"msg": "User created Successfully"}, 200


def getUsers():  # Name of the method
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute('''SELECT * FROM user_table''')  # execute an SQL statment
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['user_id'] = row[0]
        Result['user_token'] = row[1]
        Result['user_name'] = row[2]
        Results.append(Result)
    response = {'data': Results, 'count': len(Results)}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def login(username, pwd):
    # print('username, pwd = ', username, pwd)

    if len(username.strip()) <= 0:
        return {"msg": "Invalid Username. Please try again!"}, 500

    if len(pwd.strip()) <= 0:
        return {"msg": "Invalid Password. Please try again!"}, 500

    encoded = jwt.encode({'username': username, 'exp': datetime.datetime.utcnow(
    ) + datetime.timedelta(minutes=20)}, app.config['SECRET_KEY'])
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute(
        f"""SELECT user_id, user_token, user_name, user_avatar_img, user_email_id, user_contact FROM user_table WHERE user_name = '{username}' and user_password = '{pwd}'""")
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['user_id'] = row[0]
        Result['user_token'] = encoded
        Result['user_name'] = row[2]
        # Result['user_avatar_img'] = row[3]
        # Result['user_email_id'] = row[4]
        # Result['user_contact'] = row[5]
        Results.append(Result)
    response = {'data': Results, 'count': len(Results)}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format
    return {"msg": "User logged in Successfully"}, 200
