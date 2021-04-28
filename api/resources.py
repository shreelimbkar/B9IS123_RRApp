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
    query = '''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code'''

    if category:
        query = f'''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code WHERE resource_category = {category}'''

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
        Result['city_name'] = row[4]
        Result['resource_address'] = row[5]
        Result['resource_details'] = row[6]
        Result['resource_price'] = row[7]
        Result['resource_review'] = row[8]
        Result['resource_images'] = row[9]
        Result['resource_is_active'] = row[10]
        # Result['modified_date'] = row[11]
        # Result['created_date'] = row[12]
        Results.append(Result)
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def getResourcesID(id):
    if id:
        query = f'''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code WHERE resource_id = {id}'''

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
        Result['city_name'] = row[4]
        Result['resource_address'] = row[5]
        Result['resource_details'] = row[6]
        Result['resource_price'] = row[7]
        Result['resource_review'] = row[8]
        Result['resource_images'] = row[9]
        Result['resource_is_active'] = row[10]
        # Result['modified_date'] = row[11]
        # Result['created_date'] = row[12]
        Results.append(Result)
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def getResourcesByFilters(byPrice, byCategories, byLocation, byPopularities):
    if byLocation:
        byPrice = 'ASC' if int(byPrice) else 'DESC'
        query = f'''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_rating, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code WHERE r.resource_city_code = '{byLocation}' ORDER BY r.resource_price {byPrice}'''

        if byCategories:
            cat = "'{}'".format("','".join(byCategories))
            query = f'''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_rating, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code WHERE r.resource_city_code = '{byLocation}' AND r.resource_category in ({cat}) ORDER BY r.resource_price {byPrice}'''

        if byPopularities:
            popu = "'{}'".format("','".join(byPopularities))
            query = f'''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_rating, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code WHERE r.resource_city_code = '{byLocation}' AND r.resource_rating in ({popu}) ORDER BY r.resource_price {byPrice}'''

        if byCategories and byPopularities:
            cat = "'{}'".format("','".join(byCategories))
            popu = "'{}'".format("','".join(byPopularities))
            query = f'''SELECT r.resource_id, r.resource_category, r.resource_name, r.resource_city_code, c.city_name, r.resource_address, r.resource_details, r.resource_price, r.resource_review, r.resource_rating, r.resource_images, r.resource_is_active, r.modified_date, r.created_date, r.contact_number FROM resource_master as r 
INNER JOIN city as c ON r.resource_city_code=c.city_code WHERE r.resource_city_code = '{byLocation}' AND r.resource_rating in ({popu}) AND r.resource_category in ({cat}) ORDER BY r.resource_price {byPrice}'''

        # print(query)
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
        Result['city_name'] = row[4]
        Result['resource_address'] = row[5]
        Result['resource_details'] = row[6]
        Result['resource_price'] = row[7]
        Result['resource_review'] = row[8]
        Result['resource_images'] = row[9]
        Result['resource_is_active'] = row[10]
        # Result['modified_date'] = row[11]
        # Result['created_date'] = row[12]
        Results.append(Result)
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def getAllBnbs(Id):
    query = '''SELECT bnb_id, bnb_name, bnb_amenities, bnb_room_features, bnb_review, bnb_about, bnb_meals, bnb_city_code, bnb_address, modified_date, created_date, contact_number, bnb_price_range, bnb_is_available FROM bnb_master'''
    if Id:
        query = f'''SELECT bnb_id, bnb_name, bnb_amenities, bnb_room_features, bnb_review, bnb_about, bnb_meals, bnb_city_code, bnb_address, modified_date, created_date, contact_number, bnb_price_range, bnb_is_available FROM bnb_master WHERE bnb_id={Id}'''

    cur = mysql.connection.cursor()  # SQL instance
    cur.execute(query)
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['bnb_id'] = row[0]
        Result['bnb_name'] = row[1]
        Result['bnb_amenities'] = row[2]
        Result['bnb_room_features'] = row[3]
        Result['bnb_review'] = row[4]
        Result['bnb_about'] = row[5]
        Result['bnb_meals'] = row[6]
        Result['bnb_city_code'] = row[7]
        Result['bnb_address'] = row[8]
        Result['modified_date'] = row[9]
        Result['created_date'] = row[10]
        Result['contact_number'] = row[11]
        Result['bnb_price_range'] = row[12]
        Result['bnb_is_available'] = row[13]
        Results.append(Result)
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format
