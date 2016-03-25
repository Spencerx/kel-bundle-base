#!/bin/bash
set -ev

if [ -n "$TRAVIS_TAG" ]; then
    BUILD_TAG="$TRAVIS_TAG"
else
    BUILD_TAG="git-${TRAVIS_COMMIT:0:8}"
fi

docker pull quay.io/kelproject/bundle-base || true
docker build --tag quay.io/kelproject/bundle-base:$BUILD_TAG .
