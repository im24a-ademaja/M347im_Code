from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route("/", methods=["GET"])
def homepage():
    if request.method == "GET":
        return jsonify({"message": "Willkommen in unserer Tierpaxis!"})


@app.route("/api/termine", methods=["GET"])
def get_termine():
    if request.method == "GET":
        return jsonify({"message": "Termine abrufen ist noch nicht implementiert!"})\

@app.route("/api/termin", methods=["POST"])
def set_termin():
    if request.method == "POST":
        return jsonify({"message": "Termine setzen ist noch nicht implementiert!"})


if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0')


