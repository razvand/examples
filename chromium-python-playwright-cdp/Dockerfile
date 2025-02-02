FROM debian:bookworm AS build

RUN set -xe; \
    apt-get -yqq update; \
    apt-get -yqq install \
        libcups2 \
        libnss3 \
        libatk1.0-0 \
        libnspr4 \
        libpango1.0-0 \
        libasound2 \
        libatspi2.0-0 \
        libxdamage1 \
        libatk-bridge2.0-0 \
        libxkbcommon0 \
        libdrm2 \
        libxcomposite1 \
        libxfixes3 \
        libxrandr2 \
        libgbm1; \
    apt-get -yqq install \
        python3 \
        python-is-python3 \
        python3-pip \
        python3-venv \
        strace \
    ;

WORKDIR /app
COPY ./requirements.txt .
RUN set -xe; \
    pip install -r requirements.txt; \
    pip install "fastapi[standard]"; \

FROM scratch

COPY --from=build /usr/lib/python3 /usr/lib/python3
COPY --from=build /usr/lib/python3.12 /usr/lib/python3.12

COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=build /etc/ld.so.cache /etc/ld.so.cache

# Actual server implementation
COPY ./main.py /app/main.py
