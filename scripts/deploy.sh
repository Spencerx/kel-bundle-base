#!/bin/bash
set -ev

if [ -n "$TRAVIS_TAG" ]; then
    BUILD_TAG="$TRAVIS_TAG"
else
    BUILD_TAG="git-${TRAVIS_COMMIT:0:8}"
fi

REPO="quay.io/kelproject/bundle-base"

docker login -e noemail -u $QUAY_USERNAME -p $QUAY_PASSWORD quay.io
docker tag "$REPO:$BUILD_TAG" "$REPO:latest"
docker push "$REPO:$BUILD_TAG"
docker push "$REPO:latest"
