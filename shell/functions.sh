func search_network() {
  netaddr=${1:-192.168.0}
  echo "$(seq 254)" | xargs -P20 -I% ping -W10 -c1 $netaddr.% | grep -E "from [0-1].*?:"
}
