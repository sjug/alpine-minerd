FROM alpine:latest

RUN apk add --no-cache autoconf automake build-base curl-dev git

RUN git clone https://github.com/wolf9466/cpuminer-multi && \
    cd cpuminer-multi && ./autogen.sh && CFLAGS="-march=native -O3" ./configure && make

WORKDIR	/cpuminer-multi
ENTRYPOINT ["./minerd"]