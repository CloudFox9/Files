from flask import Flask, request, jsonify
import time

app = Flask(__name__)

# Store the latest signal and timestamp
latest_signal = None
last_signal_time = 0

@app.route("/signal", methods=["POST"])
def upload_signal():
    global latest_signal, last_signal_time
    data = request.get_json()

    required_keys = {"asset", "direction", "datetime", "timeframe"}
    if not data or not required_keys.issubset(data):
        return jsonify({"error": "Invalid signal format"}), 400

    latest_signal = data
    last_signal_time = time.time()
    print("✅ Signal uploaded:", data)
    return jsonify({"status": "Signal stored"}), 200

@app.route("/signal", methods=["GET"])
def get_signal():
    if latest_signal and time.time() - last_signal_time < 600:  # 10 mins cache
        return jsonify(latest_signal)
    return jsonify({"status": "No recent signal"}), 204

if __name__ == "__main__":
    print("🚀 Signal API running at http://localhost:3000")
    app.run(host="0.0.0.0",port=3000)
