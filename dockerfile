ARG BUILDPLATFORM
FROM --platform=$BUILDPLATFORM rust:alpine AS build
WORKDIR src
COPY . .

RUN USER=root apk add libc-dev
RUN cargo build --release

FROM scratch
WORKDIR /
COPY --from=build /src/target/release/actixstaticserve ./serve

EXPOSE 3000

ENTRYPOINT ["./serve"]