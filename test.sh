#!/bin/bash

set -euxo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

repo_dir="${script_dir}"

cd "${repo_dir}"

git submodule update --init --recursive

cd -

test_dir="${repo_dir}/test"

cd "${test_dir}"

npm install

cd -

temp_dir="$(mktemp -d --dry-run)"

cp -r "${test_dir}" "${temp_dir}"

cd "${temp_dir}"

ln -svf "${repo_dir}" node_modules

jq --arg path "${repo_dir}/package.json" '.volta.extends = $path' package.json | tee package.json.tmp
mv package.json.tmp package.json

npx semantic-release --no-ci

if [[ -f "CHANGELOG.md" ]]; then
    echo "✅ CHANGELOG.md created"
else
    echo "❌ CHANGELOG.md not created"
    exit 1
fi

# Check if version is updated in package.json
if jq -r '.version' package.json | grep -q "v1.0.0"; then
    echo "❌ Version not updated in package.json"
    exit 1
else
    echo "✅ Version updated in package.json"
fi

# Check that git tag v1.0.0 was NOT created
if git tag --list | grep -q "v1.0.0"; then
    echo "❌ Git tag v1.0.0 was created"
    exit 1
else
    echo "✅ Git tag v1.0.0 was not created"
fi

# Check that the git tag v1.0.0 was NOT pushed
if git ls-remote --tags origin | grep -q "v1.0.0"; then
    echo "❌ Git tag v1.0.0 was pushed"
    exit 1
else
    echo "✅ Git tag v1.0.0 was not pushed"
fi
