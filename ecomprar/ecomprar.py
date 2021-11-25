import requests
from flask import Flask, json, request, render_template, redirect

app = Flask(__name__)

entregasUrl = "34.238.233.0:5000"
recorrenUrl = "54.237.174.74:5001"

entregasUrl = "http://"+entregasUrl
recorrenUrl = "http://"+recorrenUrl


@app.route("/")
def index():
    return render_template(
        "index.html", eUrl=entregasUrl + "/list", rUrl=recorrenUrl + "/list"
    )


@app.route("/comprar", methods=["POST", "GET"])
def comprar():
    if request.method == "GET":
        return render_template(
            "index.html", eUrl=entregasUrl + "/list", rUrl=recorrenUrl + "/list"
        )
    data = request.form

    print(data)
    whatSend = {"customerEmail": data["email"], "products": [{"name": data["produto"]}]}

    url = entregasUrl + "/buy"
    if data["recurrence"]:
        url = recorrenUrl + "/recorra"
        whatSend["recurr"] = data["recurrence"]
    res = requests.post(url, json=whatSend)

    return render_template(
        "index.html", eUrl=entregasUrl + "/list", rUrl=recorrenUrl + "/list"
    )


if __name__ == "__main__":
    app.run(port=8080, host="0.0.0.0", debug=True)
