#!/bin/sh

tendermint node --moniker "`hostname`" "$@"
