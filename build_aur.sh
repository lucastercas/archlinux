#!/bin/bash

set -e -u

repo_dir=aur_repo.x86_64
base_dir=$(pwd)

git clone --depth 1 https://github.com/Dogcatfee/AUR_BUILDER
cat ./aur_packages.links | grep -v '^#' | grep h > ./AUR_BUILDER/git.links

cd AUR_BUILDER
./git_build_packages.sh "./${repo_dir}"
./init_custom_repo.sh "./${repo_dir}"

cd "${base_dir}"
cp -r "./AUR_BUILDER/${repo_dir}" ./

# rm -rf AUR_BUILDER