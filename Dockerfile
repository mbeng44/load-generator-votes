# Use a minimal Python image
FROM python:3.9-slim

# Set a working directory
WORKDIR /app

# Install system dependencies (ApacheBench)
RUN apt-get update && apt-get install -y --no-install-recommends \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy the entire application
COPY . .

# Install Python dependencies directly from the script
RUN pip install --no-cache-dir -r <(pip freeze > /tmp/requirements.txt && cat /tmp/requirements.txt || echo "")

# Ensure scripts have execution permission
RUN chmod +x make-data.py

# Generate POST data files
RUN python3 make-data.py

# Expose the application port (change if needed)
EXPOSE 5000

# Run the application (modify command based on your framework)
CMD ["python3", "make-data.py"]

