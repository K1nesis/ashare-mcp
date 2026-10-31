FROM python:3.11-slim-bookworm

WORKDIR /app
ENV PYTHONUNBUFFERED=1 \
    CACHE_DIR=/data \
    PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/

COPY pyproject.toml README.md ./
COPY src/ ./src/
RUN pip install --no-cache-dir .

EXPOSE 9876
CMD ["ashare-mcp", "--transport", "http", "--host", "0.0.0.0", "--port", "9876"]

