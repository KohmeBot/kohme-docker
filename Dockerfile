FROM golang:latest

WORKDIR /web

RUN apt-get update -y && \
    apt-get install -y git ca-certificates tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rm -rf /var/lib/apt/lists/*

# 拉取整个仓库
RUN git clone --depth=1 https://github.com/KohmeBot/kohme.git /app && \
    git clone --depth=1 https://github.com/KohmeBot/kohme-web.git /web


CMD ["go", "run", ".", "-repo", "/app/"]