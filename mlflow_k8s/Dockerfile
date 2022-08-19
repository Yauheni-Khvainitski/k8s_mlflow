FROM python:3.9-slim

WORKDIR /app

RUN pip install mlflow boto3 psycopg2-binary

EXPOSE 5000

ENTRYPOINT [ "sh", "-c", "mlflow server --host 0.0.0.0 --port 5000 --backend-store-uri $BACKEND_STORE_URI --default-artifact-root $DEFAULT_ARTIFACT_ROOT" ]
