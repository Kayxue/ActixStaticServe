FROM rust:alpine AS build
WORKDIR src
COPY . .

RUN USER=root apk add libc-dev
RUN cargo build --release

FROM scratch
WORKDIR app
COPY --from=build /src/target/release/actixstaticserve ./serve
COPY --from=build /src/public ./public

EXPOSE 3000