FROM python:3.11-slim-buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    pkg-config \
    build-essential \
    gcc \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY requirements.txt requirements.txt
COPY manage.py manage.py
COPY web_core web_core
COPY webapp webapp

RUN pip install --no-cache -r requirements.txt

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]