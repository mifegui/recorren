import os
from flask import Flask, json, request
app = Flask(__name__)

entregasUrl="https://issoSeraSubstituido.com"

@app.route('/list')
def list():
    return json.dumps(getData())
    
@app.route('/recorra', methods=['POST'])
def recorra():
    data = json.loads(request.data)

    if (data.recurr == 'minute'):
        recurr = "* * * * *"
    if (data.recurr == 'hourly'):
        recurr = "0 * * * *"
    if (data.recurr == 'monthly'):
        recurr = "0 0 1 * *"

    command = ('(crontab -l 2>/dev/null; echo "' + recurr +
                ' curl -x POST -H "Content-Type: application/json" ' + 
                "-d '"  + json.dumps(data) + "' " + entregasUrl + "/buy" +
                '") | crontab -'
            )
    os.system(command)

def getData():
    return os.popen('crontab -l').read()


if __name__ == '__main__':
   app.run(port = 5000, debug = True)
