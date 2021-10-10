#! /usr/bin/env bash

set -o errexit
set -o pipefail

readonly HERE="$(cd $(dirname $0); pwd)"
readonly SRCROOT="${HERE}"

source ${HERE}/../hack/import.sh

# The following repos and revisions are from Envoy@1.20.0
# api/bazel/repository_locations.bzl.

proto::import envoy \
    https://github.com/envoyproxy/envoy.git \
    v1.20.0 \
    ./api/envoy

proto::import xds \
    https://github.com/cncf/xds.git \
    01bcc9b48dfec9ddf68b50b3e3bbee830da9c3ae \
    ./udpa ./xds

proto::import validate \
    https://github.com/envoyproxy/protoc-gen-validate.git \
    v0.6.1 \
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
    147c58e9608a4f9628b53b6cc863325ca746f63a \
    .

proto::import opentelemetry \
    https://github.com/open-telemetry/opentelemetry-proto.git \
    v0.9.0 \
    ./opentelemetry

# Zipkin isn't a dependency of the Envoy API, even though Bazel claims
# it is.
#
# https://github.com/envoyproxy/envoy/issues/18544
#
#proto::import zipkin \
#    https://github.com/openzipkin/zipkin-api \
#    1.0.0 \
#    ./
