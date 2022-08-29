#!/usr/bin/env bash

# This script is used to copy all of our rust images from one registry to another
# It relies on https://github.com/google/go-containerregistry/tree/main/cmd/crane which you can install via `brew install crane` on a Mac.
# invoke it via SOURCE_REGISTRY_BASE=<source_registry_base> TARGET_REGISTRY_BASE=<target_registry_base> IMAGE_TAG ./copy-rust-images-to-registry.sh

set -ex

IMAGES=(
  validator
  indexer
  node-checker
  tools
  faucet
  forge
  telemetry-service
)

for IMAGE in "${IMAGES[@]}"
do
    crane copy "$SOURCE_REGISTRY_BASE/$IMAGE:$IMAGE_TAG" "$TARGET_REGISTRY_BASE/$IMAGE:$IMAGE_TAG"
done
