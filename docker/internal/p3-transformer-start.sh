#!/usr/bin/env bash

BATCHREFINE_ROOT=/home/user/code/batchrefine

echo "starting supervisor"
supervisord -c /home/user/supervisor/supervisord.conf

VERSION=`cat ${BATCHREFINE_ROOT}/version`
echo "transformer version is $VERSION"
echo "transformer options are $@"

# ... and the P3 transformer.
java -jar ${BATCHREFINE_ROOT}/clients/clients-transformer/target/clients-transformer-${VERSION}-jar-with-dependencies.jar $@ 2>&1 | tee /home/user/log/transformer.log