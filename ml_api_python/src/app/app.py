from sklearn.externals import joblib
import flask
import numpy as np

app = flask.Flask(__name__)
model = None

def load_model():
    global model
    model = joblib.load("../model/model.pkl")

@app.route("/predict", methods=["POST"])
def predict():
    response = {
        "success": False,
        "Content-Type": "application/json"
    }

    if flask.request.method == "POST":
        if flask.request.get_json().get("feature"):
            feature = flask.request.get_json().get("feature")
            feature = np.array(feature).reshape((1, -1))
            response["prediction"] = model.predict(feature).tolist()
            response["success"] = True
    return flask.jsonify(response)


if __name__ == "__main__":
    load_model()
    app.run(host='0.0.0.0', port=5000)