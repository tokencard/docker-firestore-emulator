FROM google/cloud-sdk:321.0.0-alpine

RUN apk add openjdk8-jre=8.252.09-r0
RUN gcloud components install beta cloud-firestore-emulator

COPY start.sh ./

EXPOSE 8080
ENTRYPOINT ["./start.sh"]
