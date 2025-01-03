FROM python:3.9-slim-buster

RUN echo "Forcing rebuild"

WORKDIR /app

COPY make-data.py .
RUN apt-get update && apt-get install -y apache2-utils

COPY generate-votes.sh .

RUN chmod +x generate-votes.sh

RUN sed -i 's/posta/\/app\/posta/g' generate-votes.sh
RUN sed -i 's/postb/\/app\/postb/g' generate-votes.sh

CMD ["sh", "-c", "python3 make-data.py && ./generate-votes.sh"]



