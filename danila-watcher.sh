
#!/bin/sh

echo $(date '+%Y-%m-%d %H:%M:%S')" danila-watcher checking..."

if [ "$(wc -l < /opt/ton/danila.log)" -ge 5000 ] ; then
    tail -n 1000 /opt/ton/danila.log > /opt/ton/danila.log.tmp
    mv -f /opt/ton/danila.log.tmp /opt/ton/danila.log
    echo $(date '+%Y-%m-%d %H:%M:%S')" danila-watcher rotates log"
fi

CPUMINER=false
if [ -n "$(ps -A | grep cpuminer | grep -v grep)" ] ; then CPUMINER=true; fi
echo "Some cpu miner running:   "$CPUMINER


GPUMINER=false
if [ -n "$(ps -A | grep -e PhoenixMiner -e teamredminer -e nbminer | grep -v grep)" ] ; then GPUMINER=true; fi
echo "Some gpu miner running:   "$GPUMINER


DANILA=false
if [ -n "$(ps -A | grep danila-miner | grep -v grep)" ] ; then DANILA=true; fi
echo "Danila miner running:     "$DANILA

if [ "$DANILA" = true ] && [ "$GPUMINER" = true ] || [ "$CPUMINER" = false ] && [ "$DANILA" = true ] ; then
    echo $(date '+%Y-%m-%d %H:%M:%S')" danila-watcher stops danila-miner"
    killall danila-miner
    exit
fi

if [ "$DANILA" = false ] && [ "$CPUMINER" = true ] && [ "$GPUMINER" = false ]  ; then
    echo $(date '+%Y-%m-%d %H:%M:%S')" danila-watcher starts danila-miner"
    /opt/ton/danila-miner run https://server1.whalestonpool.com EQDKFG0CfvKpPtvvk3WamEneM8ZhTx32sPBPAsnU7kWsu4e9
    exit
fi
