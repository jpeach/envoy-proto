# Consolidated Envoy protobufs

This repository contains the copies of all the protobuf definitions an Envoy control plane needs to generate Envoy configuration.
To make use of them, pass the `proto` directory for the Envoy version you need to the [protobuf compiler](https://developers.google.com/protocol-buffers/docs/reference/overview) using the `--proto_path` argument.
There should be no unresolved protobuf dependencies.
