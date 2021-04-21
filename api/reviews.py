from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import json
import datetime
mysql = MySQL()
app = Flask(__name__)
CORS(app)

def getResourceReviews(category):
    query = '''SELECT user_reviews_id, repor_flag_count, is_active, user_review_user_id, listing_id, like_count, modified_date, created_date FROM user_reviews'''

    if category:
        query = f'''SELECT user_reviews_id, repor_flag_count, is_active, user_review_user_id, listing_id, like_count, modified_date, created_date FROM user_review WHERE lisitng_id = {category}'''

    print(query)
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute(query)  # execute an SQL statment
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['user_reviews_id'] = row[0]
        Result['repor_flag_count'] = row[1]
        Result['is_active'] = row[2]
        Result['user_review_user_id'] = row[3]
        Result['listing_id'] = row[4]
        Result['like_count'] = row[5]
        Result['modified_date'] = row[6]
        Result['created_date'] = row[7]
        # Result['resource_images'] = row[8]
        # Result['resource_is_active'] = row[9]
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

def getBnBReviews(category):
    query = '''SELECT user_bnb_review_id, repor_flag_count, is_active, review_bnb_user_id, bnb_master_id, like_count, modified_date, created_date FROM user_bnb_review'''

    if category:
        query = f'''SELECT user_bnb_review_id, repor_flag_count, is_active, review_bnb_user_id, bnb_master_id, like_count, modified_date, created_date FROM user_bnb_review FROM user_review WHERE bnb_master_id = {category}'''

    print(query)
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute(query)  # execute an SQL statment
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['user_bnb_review_id'] = row[0]
        Result['repor_flag_count'] = row[1]
        Result['is_active'] = row[2]
        Result['review_bnb_user_id'] = row[3]
        Result['bnb_master_id'] = row[4]
        Result['like_count'] = row[5]
        Result['modified_date'] = row[6]
        Result['created_date'] = row[7]
        # Result['resource_images'] = row[8]
        # Result['resource_is_active'] = row[9]
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

