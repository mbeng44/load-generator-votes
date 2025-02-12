FROM python:3.9-slim

# add apache bench (ab) tool
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /seed

COPY . .
<<<<<<< HEAD

# create POST data files with ab friendly formats
RUN python make-data.py
=======

# create POST data files with ab friendly formats
RUN python make-data.py

CMD /seed/generate-votes.sh
>>>>>>> refs/remotes/origin/main

CMD /seed/generate-votes.sh
