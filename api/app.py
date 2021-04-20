from flask import Flask
from flask import request

app = Flask(__name__)


@app.route("/api/")  # URL leading to method
def hello():  # Name of the method
    return("Welcome to Rating App API page.")


@app.route("/greetme")  # different URL
def helloall():  # different method name
    name = request.args.get('name')  # retrieve GET parameters
    return("Hello Shri {}!".format(name))  # Python’s string.format


if __name__ == "__main__":
    app.run(host='0.0.0.0', port='8080', ssl_context=(
        'cert.pem', 'privkey.pem'))  # Run the flask app at port 8080
