FROM python:3.11-slim-bookworm

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        build-essential \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip3 install --upgrade pip

COPY . /app
RUN pip install .

EXPOSE 6060
ENTRYPOINT ["python3", "-m", "nllb_serve"]