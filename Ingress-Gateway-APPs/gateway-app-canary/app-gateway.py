from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def hello():
     return "THIS IS THE CAAANNNARRY VERSION!!"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000, debug=False)
