FROM rust:alpine AS build
WORKDIR src
COPY . .

RUN USER=root apk add libc-dev
RUN cargo build --release

FROM alpine:latest
WORKDIR app
COPY --from=build /src/target/release ./release
COPY --from=build /src/public ./public

EXPOSE 3000

ENTRYPOINT ["./release/actixfuwariserve"]