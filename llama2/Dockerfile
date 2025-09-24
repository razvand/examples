FROM alpine:3.14 AS base

WORKDIR /

RUN set -xe; \
	wget -O model.bin https://huggingface.co/karpathy/tinyllamas/resolve/main/stories15M.bin && \
	mkdir -p /models/stories15M && \
	ln -sfn /models/stories15M /models/DEFAULT

FROM scratch

COPY --from=base ./models /models
COPY ./stories15M.bin /models/stories15M/model.bin
COPY ./tokenizer.bin /models/stories15M/tokenizer.bin
