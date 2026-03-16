# 将基础镜像指定为 Debian 12 的稳定版本
FROM python:3.10-slim-bookworm

WORKDIR /app

# 安装系统依赖 
RUN apt-get update && apt-get install -y \
    pandoc build-essential libcairo2 libpango-1.0-0 \
    libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5002

CMD ["python", "GUI/app.py"]