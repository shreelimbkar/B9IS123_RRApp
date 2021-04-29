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
    query = '''SELECT r.user_reviews_id, r.repor_flag_count, r.is_active, r.user_review_user_id, r.listing_id, r.review_title, r.review_body, r.budget, r.like_count, r.user_rating, r.modified_date, r.created_date, ut.user_name FROM user_reviews as r INNER JOIN user_table as ut ON r.user_review_user_id=ut.user_id'''

    if category:
        query = f'''SELECT r.user_reviews_id, r.repor_flag_count, r.is_active, r.user_review_user_id, r.listing_id, r.review_title, r.review_body, r.budget, r.like_count, r.user_rating, r.modified_date, r.created_date, ut.user_name FROM user_reviews as r INNER JOIN user_table as ut ON r.user_review_user_id=ut.user_id WHERE listing_id = {category}'''

    # print(query)
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
        Result['review_title'] = row[5]
        Result['review_body'] = row[6]
        Result['budget'] = row[7]
        Result['like_count'] = row[8]
        Result['user_rating'] = row[9]
        Result['modified_date'] = row[10]
        Result['created_date'] = row[11]
        Result['user_name'] = row[12]
        Results.append(Result)
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def addUserReviews(userReviewData):
    review_user_id, listing_id, review_title, review_body, budget, like_count, user_rating = userReviewData
    cur = mysql.connection.cursor()  # SQL instance
    query = '''INSERT INTO user_reviews(is_active, user_review_user_id, listing_id, review_title, review_body, budget, like_count, repor_flag_count, user_rating, modified_date, created_date) VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}', '{}');'''.format(
        'T', review_user_id, listing_id, review_title, review_body, budget, like_count, '1', user_rating, datetime.datetime.now(), datetime.datetime.now())
    try:
        cur.execute(query)
        mysql.connection.commit()

        return {'status': 200, 'responseMessage': 'Success'}, 200
    except:
        return {'status': 500, 'responseMessage': 'Server Error'}, 500


def getBnBReviews(category):
    query = '''SELECT user_bnb_review_id, repor_flag_count, is_active, review_bnb_user_id, bnb_master_id, like_count, modified_date, created_date FROM user_bnb_review'''

    if category:
        query = f'''SELECT user_bnb_review_id, repor_flag_count, is_active, review_bnb_user_id, bnb_master_id, like_count, modified_date, created_date FROM user_bnb_review WHERE bnb_master_id = {category}'''

    # print(query)
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
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format
