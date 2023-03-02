#!/usr/bin/env bash

choco install ripgrep
choco install fd
choco install yarn
choco install nodejs.install

choco install kubernetes-helm
# dependency to get RS helm networking working:
# https://github.com/k8snetworkplumbingwg/multus-cni