FROM rust:alpine AS build
WORKDIR src
COPY . .

RUN USER=root apk add libc-dev
RUN cargo build --release

FROM busybox:musl
LABEL org.opencontainers.image.source=https://github.com/Kayxue/ActixFuwariServe
WORKDIR app
COPY --from=build /src/target/release/actixfuwariserve ./release/
COPY --from=build /src/public ./public

EXPOSE 3000

ENTRYPOINT ["./release/actixfuwariserve"]