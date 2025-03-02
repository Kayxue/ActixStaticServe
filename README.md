# ActixStaticServe
A really simple docker image to help you hosting static website on docker  
[[繁體中文](https://blog.kayxue.xyz/posts/actixstaticserve/)]
## Notice: Read below before using the image!
* **No customize:** This image doesn't support customizing any server settings at the moment. The server is listening to `0.0.0.0:3000` and serving `/public` folder by default.
* **No shell included:** This image is based on scratch, which is Docker’s reserved and minimal image, so no shell included and can run binary files only!
## Docker file usage example
```dockerfile
FROM ghcr.io/kayxue/actixstaticserve:latest

WORKDIR /

COPY ./public/ ./public/
```
## Contribution
Contributions are welcome, and please follow [Code of conduct](https://www.rust-lang.org/policies/code-of-conduct)
