from flask import Flask
import requests

app = Flask(__name__)


@app.route('/')
def index():
    dictToSend = {'question':'what is the answer?'}
    res = requests.post('http://back-service:5000/', json=dictToSend)
    # print "response from server:",res.text
    dictFromServer = res.json()
    return dictFromServer


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000, debug=False)
