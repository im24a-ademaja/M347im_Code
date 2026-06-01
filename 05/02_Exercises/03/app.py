from flask import Flask, request, jsonify
import json
import os

app = Flask(__name__)

APPOINTMENTS_FILE = "./appointments.txt"


@app.route("/", methods=["GET"])
def homepage():
    return jsonify({"message": "Willkommen in unserer Tierpaxis!"})


@app.route("/api/termine", methods=["GET"])
def get_termine():
    appointments = []

    # Return empty list if file does not exist yet
    if not os.path.exists(APPOINTMENTS_FILE):
        return jsonify({"appointments": appointments})

    with open(APPOINTMENTS_FILE, "r") as file:
        for line in file:
            line = line.strip()
            if line:
                appointments.append(json.loads(line))

    return jsonify({"appointments": appointments})


@app.route("/api/termin", methods=["POST"])
def set_termin():
    content_type = request.headers.get("Content-Type")

    if content_type != "application/json":
        return jsonify({
            "message": "Content type is not supported."
        }), 400

    data = request.json

    st = data["salutation"]
    fN = data["firstname"]
    lN = data["lastname"]
    ap = data["appointment"]

    # Create appointment object
    appointment = {
        "salutation": st,
        "firstname": fN,
        "lastname": lN,
        "appointment": ap
    }

    # Save appointment to file
    with open(APPOINTMENTS_FILE, "a") as file:
        file.write(json.dumps(appointment) + "\n")

    msg = (
        f"Dear {st} {fN} {lN}, "
        f"You got an appointment on {ap}. "
        f"Kind regards Tierpraxis-Team."
    )

    return jsonify({
        "message": msg,
        "saved_appointment": appointment
    })


if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0')