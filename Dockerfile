FROM openjdk@sha256:dbdb67803b5063e9f274289bba598bf103e19d470bac4550995b28f5749f30e1

WORKDIR /gcloud

ARG CLOUD_SDK_VERSION=252.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

RUN curl -O "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" \
  && tar zxvf "google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" google-cloud-sdk \
  && ./google-cloud-sdk/install.sh \
  && ./google-cloud-sdk/bin/gcloud config set disable_usage_reporting true \
  && ./google-cloud-sdk/bin/gcloud config set component_manager/disable_update_check true \
  && yes | ./google-cloud-sdk/bin/gcloud components install beta cloud-firestore-emulator

ENTRYPOINT ["google-cloud-sdk/bin/gcloud", "beta", "emulators", "firestore", "start"]
