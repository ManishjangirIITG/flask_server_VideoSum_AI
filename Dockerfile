# Use an official Python runtime as the base image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port 80 for the Flask app
EXPOSE 80

# Define the command to run the app
CMD ["gunicorn", "server:app", "--bind", "0.0.0.0:80"]