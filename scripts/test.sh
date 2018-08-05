get_price() {
    float="$(curl "https://api.bitfinex.com/v1/pubticker/btcusd" | jq ".last_price")"
    echo "scale=1; $float" | bc -l | awk '{print "Bitfinex: $"$1}'
}

main() {
	  get_price
}
main
