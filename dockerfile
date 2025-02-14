FROM rust:alpine AS build

WORKDIR src
COPY . .

RUN USER=root apk add libc-dev
RUN cargo build --release

FROM alpine:latest
WORKDIR src
COPY --from=build /src/target/release .
COPY --from=build /src/public ./public

EXPOSE 3000

CMD ./release/actixfuwariserve