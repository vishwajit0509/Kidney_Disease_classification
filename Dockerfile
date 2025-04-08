FROM python:3.10-slim-buster

RUN apt update -y && apt install awscli -y

WORKDIR /app

# Copy ALL necessary files at once
COPY app.py ./
COPY requirements.txt ./


RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]