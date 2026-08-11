#!/usr/bin/env bash
set -euo pipefail

base_ref="refs/remotes/gh-r247-base/main"
base_url="https://github.com/yas4133/gh-r247-setup-python-command.git"
index_file="${RUNNER_TEMP}/gh-r247-index"

git fetch "$base_url" main:"$base_ref"
base_commit="$(git rev-parse "$base_ref")"
GIT_INDEX_FILE="$index_file" git read-tree "$base_commit"
blob="$(printf 'external-principal-owned-canary\n' | git hash-object -w --stdin)"
GIT_INDEX_FILE="$index_file" git update-index --add --cacheinfo "100644,$blob,GH_R247_EXTERNAL_WRITE.txt"
tree="$(GIT_INDEX_FILE="$index_file" git write-tree)"
commit="$(printf 'GH-R247 external principal durable write\n' | git -c user.name='GH-R247 owned canary' -c user.email='gh-r247@example.invalid' commit-tree "$tree" -p "$base_commit")"
git push "$base_url" "$commit":refs/heads/main
printf 'GH_R247_EXTERNAL_DURABLE_WRITE=%s\n' "$commit"
