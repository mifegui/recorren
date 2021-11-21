from flask import Flask, json, redirect, url_for, request, make_response, jsonify
app = Flask(__name__)

stuff = [];

@app.route('/list')
def list():
    return json.dumps(stuff)
    
@app.route('/buy', methods=['POST'])
def buy():
    data = json.loads(request.data)

    stuff.append(data)
    return


if __name__ == '__main__':
   app.run(port = 5000, debug = True)
