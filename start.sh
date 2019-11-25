#!/usr/bin/env bash
set -o errexit errtrace nounset pipefail

gcloud beta emulators firestore start --host-port="0.0.0.0:${PORT:-8080}"
