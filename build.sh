#!/bin/bash

repository=$( docker info | sed -n -e 's/^Username: \(.*\)$/\1\//p' )ansible

docker build -t "${repository}:latest" --no-cache .

ansible_version=$( docker run --rm "${repository}:latest" ansible --version | sed -n -e 's/^ansible \(.*\)$/\1/p' )

docker tag "${repository}:latest" "${repository}:${ansible_version}"

docker images "${repository}"

echo
echo '# Push to registry'
for tag in latest "${ansible_version}" ; do
  echo "    docker push ${repository}:${tag}"
done
