from flask import Flask, abort, request
import requests

app = Flask(__name__)

def getForwardHeaders(request):
    headers = {}

    incoming_headers = [ 'x-request-id',
                         'x-my-header',
    ]

    for ihdr in incoming_headers:
        val = request.headers.get(ihdr)
        if val is not None:
            headers[ihdr] = val
    return headers


@app.route('/')
def my_test_endpoint():
     tracking_headers = getForwardHeaders(request)
     res = requests.get('http://back-service:7000/', headers=tracking_headers)
     return res.content

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=False)
