from flask import Flask, request, jsonify, abort
from pymongo import MongoClient
from pymongo.errors import PyMongoError
from bson import ObjectId
import os

app = Flask(__name__)
app.config["JSON_SORT_KEYS"] = False

MONGO_URI = os.getenv("MONGO_URI", "mongodb://mongo:27017/")
DB_NAME = os.getenv("DB_NAME", "taskdb")
COLLECTION_NAME = os.getenv("COLLECTION_NAME", "tasks")

client = MongoClient(MONGO_URI)
db = client[DB_NAME]
tasks_collection = db[COLLECTION_NAME]


def serialize_task(task):
    task = dict(task)
    task["id"] = str(task.pop("_id"))
    return task


@app.route("/tasks", methods=["GET"])
def get_all_tasks():
    try:
        tasks = [serialize_task(task) for task in tasks_collection.find()]
        return jsonify(tasks), 200
    except PyMongoError as exc:
        return jsonify({"error": str(exc)}), 503


@app.route("/task", methods=["POST"])
def add_task():
    data = request.get_json(silent=True) or {}

    if not data or "title" not in data or not str(data["title"]).strip():
        return jsonify({"error": "Missing 'title' field"}), 400

    task = {
        "title": str(data["title"]).strip(),
        "description": data.get("description", ""),
        "status": data.get("status", "pending"),
    }

    try:
        result = tasks_collection.insert_one(task)
        task["id"] = str(result.inserted_id)
        return jsonify(task), 201
    except PyMongoError as exc:
        return jsonify({"error": str(exc)}), 503


@app.route("/task/<task_id>", methods=["GET"])
def get_task(task_id):
    try:
        object_id = ObjectId(task_id)
    except Exception:
        abort(404, description="Task not found")

    task = tasks_collection.find_one({"_id": object_id})
    if not task:
        abort(404, description="Task not found")

    return jsonify(serialize_task(task)), 200


@app.route("/task/<task_id>", methods=["DELETE"])
def delete_task(task_id):
    try:
        object_id = ObjectId(task_id)
    except Exception:
        abort(404, description="Task not found")

    task = tasks_collection.find_one_and_delete({"_id": object_id})
    if not task:
        abort(404, description="Task not found")

    return jsonify(
        {
            "message": f"Task {task_id} deleted",
            "task": serialize_task(task),
        }
    ), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
