FROM n8nio/n8n
RUN apk add --update python3 py3-pip curl
RUN mkdir /requirements
WORKDIR /requirements
COPY ./requirements.txt /requirements/
RUN pip install -r requirements.txt
# COPY ./python_scripts /app/ # use mounted volumes instead
#RUN git clone https://github.com/vishnubob/wait-for-it.git && echo "OK: wait-for-it cloned" \
#    && chmod +x ./wait-for-it/wait-for-it.sh