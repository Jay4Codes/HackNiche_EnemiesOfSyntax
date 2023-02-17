FROM python:3.9-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip 
COPY . ./

RUN pip install django gunicorn psycopg2-binary dj-database-url

ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . /

EXPOSE 8080

CMD ["gunicorn", "--bind", ":8080", "--workers", "3", "dashboard.wsgi:application"]
