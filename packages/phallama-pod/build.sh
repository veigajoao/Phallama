#!/bin/sh
set -e
(cd phallama-build && rm -f *.manifest *.sgx *.sig && rm -rf cruntime app dist)

# download Ollama
# Add script to download from GH releases

# download model
# add script to run ollama pull and downlaod needed model


# Run Docker without TTY in a non-interactive environment
sudo docker run \
    -u $(id -u ${USER}):$(id -g ${USER}) \
    --rm \
    -v $(pwd)/phallama-build:/phallama-build \
    --env IAS_SPID=$IAS_SPID \
    kvin/gramine:1.0 \
    "make dist -C /phallama-build"
