from flask import Flask, request, jsonify, abort

app = Flask(__name__)

# In-memory task store (use a database in production)
tasks = {}
next_id = 1

@app.route('/tasks', methods=['GET'])
def get_all_tasks():
    return jsonify(list(tasks.values())), 200

@app.route('/task', methods=['POST'])
def add_task():
    global next_id
    data = request.get_json()

    if not data or 'title' not in data:
        return jsonify({"error": "Missing 'title' field"}), 400

    task = {
        'id': next_id,
        'title': data['title'],
        'description': data.get('description', ''),
        'status': data.get('status', 'pending')
    }

    tasks[next_id] = task
    next_id += 1
    return jsonify(task), 201

@app.route('/task/<int:task_id>', methods=['GET'])
def get_task(task_id):
    task = tasks.get(task_id)
    if not task:
        abort(404, description="Task not found")
    return jsonify(task), 200

@app.route('/task/<int:task_id>', methods=['DELETE'])
def delete_task(task_id):
    if task_id not in tasks:
        abort(404, description="Task not found")
    deleted_task = tasks.pop(task_id)
    return jsonify({"message": f"Task {task_id} deleted", "task": deleted_task}), 200

if __name__ == '__main__':
    app.run(debug=True)
