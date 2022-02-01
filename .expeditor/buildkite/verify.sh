#!/bin/bash

set -ueo pipefail

echo "--- system details"
uname -a
ruby -v
bundle --version
echo "--- number of cores"
nproc

echo "--- bundle install"
bundle config set --local without tools maintenance deploy
bundle install --jobs=5

echo "+++ bundle exec rake lint"
bundle exec rake lint

echo "+++ bundle exec rake test:unit"
bundle exec rake test:unit
