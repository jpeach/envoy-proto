#! /usr/bin/env bash

set -o errexit
set -o pipefail

readonly HERE="$(cd $(dirname $0); pwd)"
readonly SRCROOT="${HERE}"

source ${HERE}/../hack/import.sh

# The following repos and revisions are from Envoy@1.18.1
# api/bazel/repository_locations.bzl.

proto::import envoy \
    https://github.com/envoyproxy/envoy.git \
    v1.18.1 \
    ./api/envoy

proto::import xds \
    https://github.com/cncf/xds.git \
    b88cc788a63e5b38ee334a2e702c67901355ae2c \
    ./udpa ./xds

proto::import validate \
    https://github.com/envoyproxy/protoc-gen-validate.git \
    9db8e779b46119eef7d67e3d1120c118d593611c \
    ./validate

proto::import googlapis \
    https://github.com/googleapis/googleapis.git \
    82944da21578a53b74e547774cf62ed31a05b841 \
    ./google

proto::import opencensus \
    https://github.com/census-instrumentation/opencensus-proto.git \
    v0.3.0 \
    ./src/opencensus

proto::import metrics \
    https://github.com/prometheus/client_model.git \
    60555c9708c786597e6b07bf846d0dc5c2a46f54 \
    .

proto::import opentelemetry \
    https://github.com/open-telemetry/opentelemetry-proto.git \
    v0.7.0 \
    ./opentelemetry
