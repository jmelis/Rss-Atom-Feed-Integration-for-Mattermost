FROM registry.centos.org/centos/centos

# Install dependencies for mattermost-integration-github
RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install python-pip git && \
    pip install --upgrade pip && \
    yum clean all

# clone the upstream source repo
RUN git clone https://github.com/bitbackofen/Rss-Atom-Feed-Integration-for-Mattermost &&\
    pip install -r Rss-Atom-Feed-Integration-for-Mattermost/requirements.txt

RUN mv Rss-Atom-Feed-Integration-for-Mattermost/settings.py.docker Rss-Atom-Feed-Integration-for-Mattermost/settings.py

WORKDIR Rss-Atom-Feed-Integration-for-Mattermost

CMD python feedfetcher.py
