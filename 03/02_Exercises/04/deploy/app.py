from flask import Flask, request, jsonify

app = Flask(__name__)


@app.route("/", methods=["GET"])
def homepage():
    if request.method == "GET":
        return jsonify({"message": "Willkommen in unserer Tierpaxis!"})


@app.route("/api/termine", methods=["GET"])
def get_termine():
    if request.method == "GET":
        return jsonify({"message": "Termine abrufen ist noch nicht implementiert!"})

@app.route("/api/termin", methods=["POST"])
def set_termin():
    data = request.json
    if request.method == "POST":
        content_type = request.headers.get('Content-Type')
        if content_type == 'application/json':
            st = data['salutation']
            fN = data['firstname']
            lN = data['lastname']
            ap = data['appointment']
            msg = (
                f"Dear {st} {fN} {lN},"
                f"You got an appointment on {ap}." 
                f"Kind regards Tierpraxis-Team."
            )
            return jsonify({"message": msg})
        else:
            return "Content type is not supported."


if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0')


