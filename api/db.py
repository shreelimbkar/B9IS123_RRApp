from flask import Flask
from flask_mysqldb import MySQL
import json
mysql = MySQL()
app = Flask(__name__)


# My SQL Instance configurations
# Change the HOST IP and Password to match your instance configurations
def initDB():
    app.config['MYSQL_USER'] = 'web'
    app.config['MYSQL_PASSWORD'] = 'webPass'
    app.config['MYSQL_DB'] = 'student'
    app.config['MYSQL_HOST'] = 'localhost'  # for now
    mysql.init_app(app)
    return True
