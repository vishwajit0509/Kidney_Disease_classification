FROM python:3.10-slim-buster

RUN apt update -y && apt install awscli -y

WORKDIR /app

# Copy ALL necessary files at once
COPY app.py requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]