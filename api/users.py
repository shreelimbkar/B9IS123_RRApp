from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import json
mysql = MySQL()
app = Flask(__name__)
CORS(app)


def addUser(userData):
    role, token, username, email, pwd, avatar, contact, modifiedDate = userData
    cur = mysql.connection.cursor()  # SQL instance
    s = '''INSERT INTO user_table(user_role_id, user_token, user_password, user_name, user_avatar_img, user_email_id, user_contact, modified_date, created_date ) VALUES('{}','{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');'''.format(
        role, token, pwd, username, avatar, email, contact, modifiedDate, modifiedDate)
    cur.execute(s)
    mysql.connection.commit()
    return {"msg": "User created Successfully"}, 200
    return ''


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
