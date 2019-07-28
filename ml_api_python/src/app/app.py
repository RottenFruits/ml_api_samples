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
        feature = np.array([flask.request.form["sepal_length"],
        flask.request.form["sepal_width"],
        flask.request.form["petal_length"],
        flask.request.form["petal_width"]]).reshape((1, -1))
        response["prediction"] = model.predict(feature).tolist()
        print(response["prediction"])

        if response["prediction"][0] == 0:
            response["prediction"] = 'setosa'
        elif response["prediction"][0] == 1:
            response["prediction"] = 'versicolor'
        else:
            response["prediction"] = 'virginica'
        response["success"] = True
    return flask.jsonify(response)

    #     if flask.request.get_json().get("feature"):

    #         feature = flask.request.get_json().get("feature")
    #         feature = np.array(feature).reshape((1, -1))
    #         response["prediction"] = model.predict(feature).tolist()

    #         if response["prediction"] == 0:
    #             response["prediction"] = 'setosa'
    #         elif response["prediction"] == 1:
    #             response["prediction"] = 'versicolor'
    #         else:
    #             response["prediction"] = 'virginica'
    #         response["success"] = True
    # return flask.jsonify(response)


if __name__ == "__main__":
    load_model()
    app.run(host='0.0.0.0', port=5000)