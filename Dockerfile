FROM python:3.8.3-slim-buster

# Update tools
RUN pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /project

RUN useradd -m -r appuser && chown appuser /project

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

EXPOSE 5000/tcp

USER appuser
CMD ["python","app.py"]
