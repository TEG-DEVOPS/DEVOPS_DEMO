from flask import Flask, render_template, request, url_for, jsonify
app = Flask(__name__)



@app.route('/')
def my_test_endpoint():
    dictToReturn = {'answer':100}
    return jsonify(dictToReturn)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000, debug=False)