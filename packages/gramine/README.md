# Phallama Node

## Introduction

This package impelments the Phallama Node. An API servicing Ollama requests using SGX

## Structure
This project is structured in the following way:
```
.
├── build.sh -> build script to package application
├── gramine-image -> image to run application on
├── package.json
├── phallama-build -> package to be run inside SGX
├── README.md
├── scripts -> deplyment scripts
├── src -> node.js server
├── tsconfig.json
└── webpack.config.js
```

The core code is:
- Node.js -> server, which is responsible for serving the LLM application, providing SGX attestations and interact with smart contracts for billing
- phallama-build -> setup for computation inside the SGX enclave that includes Node.js (version 16), Ollama binaries and relevant libraries.