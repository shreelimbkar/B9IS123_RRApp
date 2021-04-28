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
import reviews
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


@app.route("/resourcesbyid", methods=['GET'])  # Get all resources by ID
def getAllResourcesById():
    if request.method == 'GET':
        id = request.args.get('id')

    return resources.getResourcesID(id)


@app.route("/resources/filters", methods=['POST'])  # Get Resource by filters
def filters():
    if request.method == 'POST':
        req_json = request.json
        byPrice = req_json['resource_price']
        byCategories = req_json['resource_category']
        byLocation = req_json['resource_city_code']
        byPopularities = req_json['resource_rating']
    return resources.getResourcesByFilters(byPrice, byCategories, byLocation, byPopularities)


# Get all Bnbs and get all Bnbs by Id
@app.route("/resources/allbnbs",  methods=['GET'])
def getAllBnbs():
    if request.method == 'GET':
        id = request.args.get('id')

    return resources.getAllBnbs(id)


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


@app.route("/users/checkotp", methods=['POST'])  # Check OTP
def chkOTP():
    if request.method == 'POST':
        req_json = request.json
        otpCode = req_json['otp_code']
    return users.checkOTP(otpCode)


@app.route("/reviews", methods=['GET'])  # Get user Reviews
def getAllReviews():
    if request.method == 'GET':
        category = request.args.get('category')

    return reviews.getResourceReviews(category)


@app.route("/reviews/add", methods=['POST'])  # Add User review
def userReview():
    if request.method == 'POST':
        req_json = request.json
        review_user_id = int(req_json['user_review_user_id'])
        listing_id = int(req_json['listing_id'])
        review_title = req_json['review_title']
        review_body = req_json['review_body']
        budget = req_json['budget']
        like_count = req_json['like_count']
        user_rating = int(req_json['user_rating'])

        # User Review Data
        userReviewData = [
            review_user_id, listing_id, review_title, review_body, budget, like_count, user_rating
        ]

    return reviews.addUserReviews(userReviewData)


@app.route("/reviews/bnbs", methods=['GET'])  # Get user BnB Reviews
def getAllBnBReviews():
    if request.method == 'GET':
        category = request.args.get('category')

    return reviews.getBnBReviews(category)


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080', ssl_context=(
        'cert.pem', 'privkey.pem'))  # Run the flask app at port 8080
