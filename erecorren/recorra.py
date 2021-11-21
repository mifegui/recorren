import os
from flask import Flask, json, request
app = Flask(__name__)

entregasUrl="http://127.0.0.1:5000"

@app.route('/list')
def list():
    return json.dumps(getData())
    
@app.route('/recorra', methods=['POST'])
def recorra():
    data = json.loads(request.data)

    recurrence = data['recurr']
    if (recurrence == 'minute'):
        recurr = "* * * * *"
    if (recurrence == 'hourly'):
        recurr = "0 * * * *"
    if (recurrence == 'monthly'):
        recurr = "0 0 1 * *"

    jsonedData = json.dumps(data)
    jsonedData = jsonedData.replace('"', '\\"');
    command = ('(crontab -l 2>/dev/null; echo "' + recurr +
                ' curl -X POST -H Content-Type:application/json ' + 
                "-d '"  + jsonedData + "' " + entregasUrl + "/buy" +
                '") | crontab -'
            )
    os.system(command)
    return {}

def getData():
    return os.popen('crontab -l').read()


if __name__ == '__main__':
   app.run(host="0.0.0.0:5001", debug = True)
