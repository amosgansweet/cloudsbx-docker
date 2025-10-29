FROM debian:bookworm-slim

LABEL maintainer="yourname <you@example.com>" \
      description="Argosbx / Cloudsbx 一键脚本容器版" \
      version="v1.0"

# 安装必要依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget bash jq ca-certificates procps iproute2 openssl cron \
 && rm -rf /var/lib/apt/lists/*

# 拷贝脚本
COPY cloudsbx.sh /usr/local/bin/cloudsbx.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/cloudsbx.sh /entrypoint.sh

# 设置工作目录
WORKDIR /root

# 暴露常用端口（可自定义）
EXPOSE 80 443 8080 8443 2053 2083 2087 2096 3000

# 默认启动命令
ENTRYPOINT ["/entrypoint.sh"]
