FROM registry.centos.org/centos/python

RUN adduser --home-dir /code user

COPY . /code

RUN pip install -r /code/requirements.txt \
 && cp /code/settings.py.docker /code/settings.py

WORKDIR /code
USER user

ENTRYPOINT ["python", "feedfetcher.py"]
