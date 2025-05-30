# Use specific Python 3.8.20 image
FROM python:3.8.20-slim

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV FLASK_APP=app:app
ENV FLASK_RUN_HOST=0.0.0.0

# Expose port for Railway
EXPOSE 8000

# Start the Flask server
CMD ["sh", "-c", "flask run --host=0.0.0.0 --port=$PORT"]
