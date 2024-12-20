from flask import Flask, request, jsonify
import joblib
import numpy as np

app = Flask(__name__)

# Load model and vectorizer
model = joblib.load("spam_model.pkl")
vectorizer = joblib.load("vectorizer.pkl")


@app.route("/predict", methods=["POST"])
def predict():
    data = request.json
    message = data.get("message")
    if not message:
        return jsonify({"error": "No message provided"}), 400

    # Transform and predict
    message_vectorized = vectorizer.transform([message])
    prediction = model.predict(message_vectorized)[0]

    # Convert to int if necessary
    if isinstance(prediction, np.int64):
        prediction = int(prediction)

    # Interpret the prediction
    result = "spam" if prediction == 1 else "not spam"

    return jsonify({"prediction": result})


if __name__ == "__main__":
    app.run(host="127.0.0.1", debug=True)
