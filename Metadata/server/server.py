from flask import Flask, request, jsonify
import utils
from flask_cors import CORS

app = Flask(__name__)

@app.route("/get_location_names")
def get_location_names():
    response = jsonify({
        'locations': utils.get_location_names()
    })
    response.headers.add('Access-Control-Allow-Origin', '*')

    return response

@app.route('/predict_home_price', methods=['POST', 'OPTIONS'])
def predict_home_price():
    total_sqft = float(request.form['total_sqft'])
    location = request.form['location']
    bhk = int(request.form['bhk'])
    bath = int(request.form['bath'])

    if request.method == "OPTIONS":
        return _build_cors_preflight_response()
    else:
        response = jsonify({
            'estimated_price': utils.get_estimated_price(location, total_sqft, bhk, bath)
        })
        return _corsify_actual_response(response)

def _build_cors_preflight_response():
    response = make_response()
    response.headers.add("Access-Control-Allow-Origin", "*")
    response.headers.add('Access-Control-Allow-Headers', "*")
    response.headers.add('Access-Control-Allow-Methods', "*")
    return response

def _corsify_actual_response(response):
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

if __name__ == "__main__":
    app.run(debug=True)
