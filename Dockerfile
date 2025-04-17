FROM python:3.12

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN python manage.py collectstatic --noinput

CMD ["gunicorn", "django_ec2.wsgi:application", "--config", "gunicorn.conf.py"]

# docker compose down --volumes --remove-orphans
# docker compose build --no-cache
# docker compose up

# docker save -o django_ec2.tar django_ec2:latest
# docker load -i django_ec2.tar
