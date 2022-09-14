#!/bin/sh

cd ..

brew install make
curl -Ls https://install.tuist.io | bash

make generate
