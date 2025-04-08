# Use Python 3.10 slim image
FROM python:3.10-slim-buster

# Update and install AWS CLI
RUN apt update -y && apt install awscli -y

# Set the working directory
WORKDIR C:\Users\vishw\OneDrive\DL\PROJECTS\Kidney_Disease_classification\app.py

# Copy app files into the container
COPY ./app .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the app
CMD ["python", "app.py"]
