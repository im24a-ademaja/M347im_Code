from flask import Flask, request
import os
import signal
import threading
import time

app = Flask(__name__)


@app.route("/")
def index():
    return "Welcome to M347 server.\nAdditional functions are /shutdown\n\n"

# How It Works:
# First tries to use werkzeug.server.shutdown (preferred).
# If not available, it uses os.kill(pid, signal.SIGINT) to simulate CTRL+C.
# The threading.Thread(...).start() ensures that the response is sent back before the server dies,
# which is essential or else the connection breaks before the client receives the message.

@app.route("/shutdown")
def shutdown():
    """Attempt to shut down the Flask app (even without Werkzeug)."""
    # Try the Werkzeug shutdown method first
    func = request.environ.get('werkzeug.server.shutdown')
    if func:
        func()
        return "Shutting down with Werkzeug method..."

    # If Werkzeug method not available, use a fallback
    def shutdown_in_a_bit():
        time.sleep(1)  # allow response to be sent before shutting down
        pid = os.getpid()
        os.kill(pid, signal.SIGINT)

    threading.Thread(target=shutdown_in_a_bit).start()
    return "Werkzeug shutdown not found. Shutting down using fallback..."


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
