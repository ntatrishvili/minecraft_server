FROM python:3.12.0rc3-bookworm

WORKDIR /ansible

COPY requirements.txt .

RUN pip install -r requirements.txt

ENTRYPOINT [ "/bin/bash" ]
