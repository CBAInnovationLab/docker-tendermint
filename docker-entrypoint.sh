#!/bin/sh

mkdir -p ~/.tendermint

if [ -n "$TENDERMINT_CONFIG_PATH" ]; then
  cp -f "$TENDERMINT_CONFIG_PATH" ~/.tendermint/config.toml
fi
if [ -n "$TENDERMINT_GENESIS_PATH" ]; then
  cp -f "$TENDERMINT_GENESIS_PATH" ~/.tendermint/genesis.json
fi
if [ -n "$TENDERMINT_PRIV_VALIDATOR_PATH" ]; then
  cp -f "$TENDERMINT_PRIV_VALIDATOR_PATH" ~/.tendermint/priv_validator.json
fi

tendermint node --p2p.seeds "$TENDERMINT_SEEDS" --moniker "`hostname`" --rpc.laddr "$TENDERMINT_ADDR"
