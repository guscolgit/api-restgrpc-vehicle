FROM debian:buster-slim

RUN mkdir Api-restgrpc-vehicle

COPY ./run.sh ./run.sh
COPY ./test.sh ./test.sh
WORKDIR .
COPY ./build /Api-restgrpc-vehicle/build
ENV type_env="prod"
RUN echo $type_env
ENTRYPOINT ./run.sh "$type_env"