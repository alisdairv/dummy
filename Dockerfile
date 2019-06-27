FROM python:3.6-slim

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8 FLASK_ENV=production FLASK_APP=main.py

RUN adduser --disabled-password --shell=/bin/false --gecos '' metis

COPY --chown=1000:1000 main.py requirements.txt /app/

RUN apt-get update && apt-get install -y apt-utils && apt-get install -y git make gcc cpp g++ && \
    cd /app && pip3 install --no-cache-dir -r requirements.txt && \
    apt-get remove -y --purge apt-utils git gcc cpp g++ make && apt-get -y --purge autoremove && apt-get clean all

WORKDIR /app
USER metis
EXPOSE 11027
CMD bash -c "flask run --host=0.0.0.0 --port=11027"