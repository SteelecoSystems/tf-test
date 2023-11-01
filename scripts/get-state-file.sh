#!/usr/bin/env bash
set -eo pipefail
[[ $RUNNER_DEBUG || $DEBUG ]] && set -x

set +e
state_file_url="$(gh api /repos/:owner/:repo/releases/latest --jq '.assets[] | select(.name == "terraform.tfstate.gpg") | .url')"
rc=$?; set -e

if [[ $rc != 0 ]]; then
  error_message="$(jq -r .message <<< "$state_file_url")"
  if [[ $error_message == "Not Found" ]]; then
    >&2 echo "No state file found, exiting"
    exit 0
  else
    >&2 echo "Other error occurred while trying to obtain the state file:"
    >&2 echo "$error_message"
    exit 1
  fi
fi

gh api -H 'Accept: application/octet-stream' "$state_file_url" | gpg --out terraform.tfstate --decrypt


