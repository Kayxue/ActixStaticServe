FROM rust:slim AS build

WORKDIR src
COPY . .

RUN cargo build --release

FROM alpine:latest
WORKDIR src
COPY --from=build /src/target/release ./release
COPY --from=build /src/public ./public

EXPOSE 3000

CMD ./release/actixfuwariserve