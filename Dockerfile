FROM python:3.9.12-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

# install node and jupyterlab extension to activate widgets
RUN set -e; \
    apt-get update && \
    apt-get install -qqy --no-install-recommends \
    curl wget nano gnupg2 software-properties-common && \
    rm -rf /var/lib/apt/lists;
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN set -e; \
    apt-get update && \
    apt-get install -qqy \
    nodejs && \
    rm -rf /var/lib/apt/lists;

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
