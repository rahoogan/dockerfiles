import time

from flask import Flask
from flask import request
from flask import Response

app = Flask(__name__)

@app.route('/service1')
def hello():
    val = request.headers.get('cookie')
    resp = Response('Hello World! Request Header: {} \n'.format(val))
    resp.headers['cookie'] = 'testcookie'
    return resp

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
