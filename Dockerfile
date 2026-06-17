FROM golang:latest

WORKDIR /web

ENV GOPROXY=https://goproxy.cn,direct

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apt-get install -y ca-certificates

# 拉取整个仓库
RUN git clone --depth=1 https://github.com/KohmeBot/kohme.git /app && \
    git clone --depth=1 https://github.com/KohmeBot/kohme-web.git /web

RUN go mod download
CMD ["go", "run", ".", "-repo", "/app/"]