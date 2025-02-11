FROM python:3.9-slim

# Install Nginx and other dependencies
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Set work directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the necessary ports
EXPOSE 80
EXPOSE 8000

# Start Nginx and FastAPI
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
