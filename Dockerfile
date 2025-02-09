FROM python:3.9-slim

# Set the working directory
WORKDIR /seed

# Copy the application code
COPY . .

# Install dependencies (if you have a requirements.txt file)
RUN pip install --no-cache-dir -r requirements.txt

# Create POST data files with ab friendly formats
RUN python make-data.py

# Specify the command to run the application
CMD ["python", "make-data.py"]  
