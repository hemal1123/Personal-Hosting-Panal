FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl bash git openjdk-17-jre-headless

WORKDIR /app

COPY . .

EXPOSE 8080

CMD ["bash", "start.sh"] 
