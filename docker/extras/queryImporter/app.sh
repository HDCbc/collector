#!/bin/bash
#
# Start script for the PDC's Query Importer service


# Exit on errors or unitialized variables
#
set -e -o nounset -x


# Environment variables
#
export BRANCH=${QI_BRANCH}


# Clone and checkout branch or tag
#
cd /app/
git pull
git checkout ${BRANCH}


# Start service
#
cd /app/
npm config set python /usr/bin/python2.7
npm install
node index.js import --mongo-host=hubdb --mongo-db=query_composer_development --mongo-port=27017
