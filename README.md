# ActixStaticServe
A really simple docker image to help you hosting static website on docker
## Notice: Read below before using the image!
* **No customize:** This image doesn't support customizing any server settings at the moment. The server is listening to `0.0.0.0:3000` and serving `/public` folder by default.
* **linux/arm64 only:** This image only support `linux/arm64` architecture at the moment.
* **No shell included:** This image is based on scratch, which is Docker’s reserved and minimal image, so no shell included and can run binary files only!
## Docker file usage example
```dockerfile
FROM ghcr.io/kayxue/actixstaticserve:latest

WORKDIR /

COPY ./public/ ./public/

ENTRYPOINT ["./serve"]
```
