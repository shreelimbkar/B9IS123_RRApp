from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import json
import datetime
mysql = MySQL()
app = Flask(__name__)
CORS(app)


def getResources(category):
    print('category =====', category)
    query = '''SELECT resource_id, resource_category, resource_name, resource_city_code, resource_address, resource_details, resource_price, resource_review, resource_images, resource_is_active, modified_date, created_date FROM resource_master'''

    if category:
        query = f'''SELECT resource_id, resource_category, resource_name, resource_city_code, resource_address, resource_details, resource_price, resource_review, resource_images, resource_is_active, modified_date, created_date FROM resource_master WHERE resource_category = {category}'''

    print(query)
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute(query)  # execute an SQL statment
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['resource_id'] = row[0]
        Result['resource_category'] = row[1]
        Result['resource_name'] = row[2]
        Result['resource_city_code'] = row[3]
        Result['resource_address'] = row[4]
        Result['resource_details'] = row[5]
        Result['resource_price'] = row[6]
        Result['resource_review'] = row[7]
        Result['resource_images'] = row[8]
        Result['resource_is_active'] = row[9]
        # Result['modified_date'] = row[10]
        # Result['created_date'] = row[11]
        Results.append(Result)
    response = {'data': Results, 'count': len(Results)}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def getAllBnbs():
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute('''SELECT bnb_booking_id, from_date, to_date, bnb_resource_id, bnb_book_user_id, number_of_adult, number_of_child, number_of_beds, special_requirement, is_status, modified_date, created_date FROM bnb_booking''')  # execute an SQL statment
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['bnb_booking_id'] = row[0]
        Result['from_date'] = row[1]
        Result['to_date'] = row[2]
        Result['bnb_resource_id'] = row[3]
        Result['bnb_book_user_id'] = row[4]
        Result['number_of_adult'] = row[5]
        Result['number_of_child'] = row[6]
        Result['number_of_beds'] = row[7]
        Result['special_requirement'] = row[8]
        Result['is_status'] = row[9]
        # Result['modified_date'] = row[10]
        # Result['created_date'] = row[11]
        Results.append(Result)
    response = {'data': Results, 'count': len(Results)}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format
