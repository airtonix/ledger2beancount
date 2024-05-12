#!/bin/bash

set -e

BIN_DIR=/opt/ledger2beancount/bin

require_arg() {
    if [ -z "$1" ]; then
        echo "Missing required argument: $2"
        exit 1
    fi
}

case "$1" in
    convert)
        require_arg "$2" "ledger2beancount parmaeters. use --help for more information"
        $BIN_DIR/ledger2beancount "${@:2}"
        ;;
    config)
        require_arg "$2" "ledger2beancount-ledger-config file"
        $BIN_DIR/ledger2beancount-ledger-config "${@:2}"
        ;;
    *)
        echo "Usage: $0 {convert|config}"
        exit 1
esac
