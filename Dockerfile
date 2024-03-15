# Use Python image as a base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only the necessary files to the container
COPY app.py .

# Install Flask
RUN pip install Flask gunicorn

# Expose the port that the Flask app will run on
EXPOSE 5000

# Runs the Flask app using Gunicorn server
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
