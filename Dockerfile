FROM python:3.9

# Set the working directory
WORKDIR /app/backend

# Copy requirements first (for caching)
COPY requirements.txt /app/backend

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/backend

# Expose the app port
EXPOSE 8000

# Default command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

