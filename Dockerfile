FROM python

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

CMD ["python3", "front-app.py"]
