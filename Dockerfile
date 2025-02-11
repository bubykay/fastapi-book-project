FROM python:3.9-slim

# Install Nginx and other dependencies
RUN apt-get update && \
    apt-get install -y nginx supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Ensure proper permissions
RUN chown -R www-data:www-data /etc/nginx /var/log/nginx

# Copy the rest of the application code
COPY . .

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Configure supervisor to run both FastAPI and Nginx
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose necessary ports
EXPOSE 80
EXPOSE 8000

# Start supervisor to manage both Nginx and FastAPI
CMD ["/usr/bin/supervisord"]
