#!/usr/bin/env bash

# Install the Phoronix Test Suite
curl -L https://github.com/phoronix-test-suite/phoronix-test-suite/archive/refs/heads/master.zip > phoronix-test-suite.zip && unzip phoronix-test-suite.zip && cd phoronix-test-suite-master && sudo ./install-sh && cd ..