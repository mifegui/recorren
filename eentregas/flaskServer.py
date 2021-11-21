from flask import Flask, json, redirect, url_for, request, make_response, jsonify
app = Flask(__name__)

stuff = [];

@app.route('/list')
def list():
    return json.dumps(getData())
    
@app.route('/buy', methods=['POST'])
def buy():
    data = json.loads(request.data)

    saveData(data)
    return

def saveData(newJson):
    array = getData()
    array.append(newJson)
    with open('data.json', 'w') as f:
        json.dump(array, f)

def getData():
    with open('data.json') as f:
        data = json.load(f)
    return data


if __name__ == '__main__':
   app.run(port = 5000, debug = True)
