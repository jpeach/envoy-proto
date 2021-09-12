#! /usr/bin/env bash

set -o errexit
set -o pipefail

readonly HERE="$(cd $(dirname $0); pwd)"
readonly SRCROOT="${HERE}"

source ${HERE}/../hack/import.sh

# The following repos and revisions are from Envoy@1.17.0
# api/bazel/repository_locations.bzl.

proto::import envoy \
    https://github.com/envoyproxy/envoy.git \
    v1.17.0 \
    ./api/envoy

proto::import udpa \
    https://github.com/cncf/udpa.git \
    cc1b757b3eddccaaaf0743cbb107742bb7e3ee4f \
    ./udpa ./xds

proto::import validate \
    https://github.com/envoyproxy/protoc-gen-validate.git \
    872b28c457822ed9c2a5405da3c33f386ac0e86f \
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
    https://github.com/prometheus/client_model \
    60555c9708c786597e6b07bf846d0dc5c2a46f54 \
    .
