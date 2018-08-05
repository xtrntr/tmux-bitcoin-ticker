#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# btc_price="#($(python $CURRENT_DIR/scripts/btc_price.py --ticker=bitfinex_btcusd))"
btc_price="#($CURRENT_DIR/scripts/test.sh)"
btc_price_interpolation_string="\#{btc_price}"

source $CURRENT_DIR/scripts/shared.sh

do_interpolation() {
	local string="$1"
	local interpolated="${string/$btc_price_interpolation_string/$btc_price}"
	echo "$interpolated"
}

update_tmux_option() {
	local option="$1"
	local option_value="$(get_tmux_option "$option")"
	local new_option_value="$(do_interpolation "$option_value")"
	set_tmux_option "$option" "$new_option_value"
}

main() {
	update_tmux_option "status-right"
}
main
