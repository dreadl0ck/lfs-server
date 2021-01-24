#!/bin/bash

echo "[INFO] creating lfs-server container..."

echo "[INFO] building & tagging container"
docker build --no-cache -t dreadl0ck/lfs-server .
if (( $? != 0 )); then
	echo "[ERROR] failed to build container."
	exit 1
fi

echo "[INFO] pushing to registry"
docker push dreadl0ck/lfs-server
if (( $? != 0 )); then
	echo "[ERROR] failed to push container image. maybe you are not logged in?"
	exit 1
fi

echo "[INFO] done."