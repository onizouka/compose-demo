# syntax=docker/dockerfile:1

# Build an image with the Python 3.12 image
FROM python:3.12-slim

# Set the working directory to `/code`
WORKDIR /code

# Set environment variables used by the `flask` command
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

COPY netskope-ca.crt /usr/local/share/ca-certificates/

RUN apt-get update \
    && apt-get install -y ca-certificates \
    && update-ca-certificates

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["flask", "run", "--debug"]



