FROM google/cloud-sdk:267.0.0-alpine

RUN apk add openjdk8-jre=8.222.10-r0
RUN gcloud components install beta cloud-firestore-emulator

ENTRYPOINT ["gcloud", "beta", "emulators", "firestore", "start"]
