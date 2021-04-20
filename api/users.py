from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import json
mysql = MySQL()
app = Flask(__name__)
CORS(app)


def getUsers():  # Name of the method
    cur = mysql.connection.cursor()  # create a connection to the SQL instance
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
    ret = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return ret  # Return the data in a string format
