#!/usr/bin/env bash

set -euo pipefail

main() {
  cd "$(dirname "$0")/../.."
  imageTag="$(docker build -q ci/image)"
  docker run -t --rm -v "$(yarn cache dir):/usr/local/share/.cache/yarn/v6" -v "$PWD:/repo" -w /repo "$imageTag" "$@"
}

main "$@"
