from flask import Flask, json, request
import pymysql
import threading

rds_host = "database-1.cl4ej0uksgat.us-east-1.rds.amazonaws.com"
name = "admin"
password = "superademiro"
db_name = "superdb"
port = 3306

app = Flask(__name__)

dbLock = threading.Lock()

stuff = []

conn = pymysql.connect(
    host=rds_host,
    user=name,
    passwd=password,
    connect_timeout=5,
    autocommit=True,
)


def executeSqlReturnJson(sqlQuery):
    dbLock.acquire();
    try:
        with conn.cursor() as cur:
            cur.execute(sqlQuery)
            return cur.fetchall()
    finally:
        dbLock.release();

def createDatabase():
    qry = "create database if not exists " + db_name
    executeSqlReturnJson(qry)
    qry = "use " + db_name
    executeSqlReturnJson(qry)

def createTable():
    qry = "create table if not exists buysTable (email VARCHAR(255), products TEXT)"
    executeSqlReturnJson(qry)

createDatabase()
createTable()



@app.route("/list")
def list():
    return {"result": getData()}


@app.route("/buy", methods=["POST"])
def buy():
    data = json.loads(request.data)

    saveData(data)
    return {}


def saveData(newJson):
    addSqlData(newJson)

def getData():
    data = getSqlData()
    return data


def addSqlData(data):
    fmt = {}
    print(data['customerEmail'])
    print(data['products'])
    qry ="""insert into buysTable (email, products) values({0},'{1}')""".format(json.dumps(data['customerEmail']), json.dumps({"products": data['products']}))
    return executeSqlReturnJson(qry)


def getSqlData():
    qry = "select * from buysTable"
    return executeSqlReturnJson(qry)


if __name__ == "__main__":
    app.run(port=5000, host="0.0.0.0", debug=True)