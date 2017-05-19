from flask import Flask, jsonify

from fakedata import *

app = Flask(__name__)




@app.route("/api/courses/", methods=["GET"])
def courses():
    return jsonify(courses)

@app.route("/api/")
def hello():
    return "Hello World!"

# test

if __name__ == "__main__":
    app.run(debug=True)






