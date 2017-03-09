FROM registry.centos.org/centos/python

ADD . /src

RUN pip install -r /src/requirements.txt \
 && cp /src/settings.py.docker /src/settings.py

WORKDIR /src

ENTRYPOINT ["python", "feedfetcher.py"]
