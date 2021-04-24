from flask import Flask
from flask import request
from flask_mysqldb import MySQL
from flask_cors import CORS
import jwt
import datetime
import json
# send email imports
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
# generate random 4 digit number for OTP
import random
mysql = MySQL()
app = Flask(__name__)
CORS(app)

app.config['SECRET_KEY'] = 'rating_app@2021'


def addUser(userData):
    role, token, username, email, pwd, avatar, contact, modifiedDate = userData
    ran_number = random.randint(1000, 9999)     # random 4 digit number

    # cur = mysql.connection.cursor()  # SQL instance
    # s = '''INSERT INTO user_table(user_role_id, user_token, user_password, user_name, user_avatar_img, user_email_id, user_contact, modified_date, created_date ) VALUES('{}','{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');'''.format(
    #     role, token, pwd, username, avatar, email, contact, modifiedDate, modifiedDate)
    # cur.execute(s)
    # mysql.connection.commit()

    # Send OTP email to registered User
    subject = "Welcome to GoSolo - Verify your email address"
    body = f"""
        <h3>Verify your email address<h3><br/>
        <p>Hi {username},</p>
        <p>Enter the 4 digit OTP code we sent to you via email to continue</p>
        <h1 style='letter-spacing: 1rem'>{ran_number}</h1>
        <p>Regards,<br/>GoSolo Admin Team,<br/>Dublin 1.</p>
    """
    send_email('gosoloprojectmaster@gmail.com', 'Gosolo@21', recipient=email, subject, body)

    return {'status': 200, 'responseMessage': 'Success'}, 200


def getUsers():  # Name of the method
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute('''SELECT user_id, user_role_id, user_token, user_name, user_avatar_img, user_email_id, user_contact, is_deleted, modified_date, created_date FROM user_table''')  # execute an SQL statment
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []
    for row in rv:  # Format the Output Results and add to return string
        Result = {}
        Result['user_id'] = row[0]
        Result['user_token'] = row[2]
        Result['user_name'] = row[3]
        Result['user_email_id'] = row[5]
        Result['user_contact'] = row[6]
        Results.append(Result)
    response = {'status': 200, 'responseMessage': 'Success', 'body': Results}
    retData = app.response_class(
        response=json.dumps(response),
        status=200,
        mimetype='application/json'
    )
    return retData  # Return the data in a string format


def login(email, pwd):
    # print('username, pwd = ', username, pwd)

    if len(email.strip()) <= 0:
        return {'status': 500, 'responseMessage': 'Invalid Username. Please try again!'}, 500

    if len(pwd.strip()) <= 0:
        return {'status': 500, 'responseMessage': 'Invalid Password. Please try again!'}, 500

    encoded = jwt.encode({'email': email, 'exp': datetime.datetime.utcnow(
    ) + datetime.timedelta(minutes=20)}, app.config['SECRET_KEY'])
    cur = mysql.connection.cursor()  # SQL instance
    cur.execute(
        f"""SELECT user_id, user_token, user_name, user_avatar_img, user_email_id, user_contact FROM user_table WHERE user_email_id = '{email}' and user_password = '{pwd}'""")
    rv = cur.fetchall()  # Retreive all rows returend by the SQL statment
    Results = []

    if (len(rv) != 0):
        for row in rv:  # Format the Output Results and add to return string
            Result = {}
            Result['user_id'] = row[0]
            Result['user_token'] = encoded
            Result['user_name'] = row[2]
            Result['user_email_id'] = row[4]
            Results.append(Result)

        response = {'status': 200,
                    'responseMessage': 'Success', 'body': Results}
        retData = app.response_class(
            response=json.dumps(response),
            status=200,
            mimetype='application/json'
        )
        return retData  # Return the data in a string format
    else:
        return {'status': 500, 'responseMessage': 'Unauthorized User. Please try again!'}, 500


def send_email(user, password, recipient, subject, body):
    msg = MIMEMultipart()
    msg['From'] = f'"Your Name" <{gmailUser}>'
    msg['To'] = recipient
    msg['Subject'] = subject
    msg.attach(MIMEText(body))

    try:
        mailServer = smtplib.SMTP('smtp.gmail.com', 587)
        mailServer.ehlo()
        mailServer.starttls()
        mailServer.ehlo()
        mailServer.login(gmailUser, gmailPassword)
        mailServer.sendmail(gmailUser, recipient, msg.as_string())
        mailServer.close()
        print('Email sent!')
    except:
        print('Something went wrong...')
