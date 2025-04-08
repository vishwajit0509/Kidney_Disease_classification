FROM python:3.10-slim-buster

# Set working directory first
WORKDIR /app

# 1. Copy only requirements first (better caching)
COPY requirements.txt .

# 2. Install system tools
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    awscli \
    && rm -rf /var/lib/apt/lists/*

# 3. Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy ONLY necessary application files
COPY app.py .
# COPY any other specific files needed, e.g.:
# COPY src/ ./src/

CMD ["python3", "app.py"]