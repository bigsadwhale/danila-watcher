# Tool for simple control Danila-Miner (TON Coin miner) under Linux

This is very simple tool for run/stop/restart danila-miner in Linux. I use it with mmpOS (doesn`t support TON Coin mining out of the box)

This script check for running CPU miner (cpuminer-gr) and another GPU miners (PhoenixMiner, nbminer, teamredminer).

* For start TON mining: run some CPU miner (cpuminer-gr) AND do not run some other GPU miners.

* For stop TON mining: stop CPU miner (cpuminer-gr) OR run some other GPU miners.

## Installation for Ubuntu 18.04

```
sudo mkdir -p /opt/ton
sudo wget https://raw.githubusercontent.com/bigsadwhale/danila-watcher/main/danila-watcher.sh -P /opt/ton
sudo chmod +x /opt/ton/danila-watcher.sh
sudo wget https://whalepool-cdn.fra1.digitaloceanspaces.com/software/danila-miner/danila-miner-2.1.4-ubuntu-bionic.tar.gz -P /opt/ton
sudo tar zxf /opt/ton/danila-miner-2.1.4-ubuntu-bionic.tar.gz -C /opt/ton/
```

Edit file ```/opt/ton/danila-watcher.sh``` and set there your wallet.

For start watcher just add task to root crontab:

```
echo -e "$(sudo crontab -u root -l)\n*/1 * * * * /opt/ton/danila-watcher.sh >> /opt/ton/danila.log 2>&1 &" | sudo crontab -u root -
```

For stop watcher just delete added line from root crontab.

You can check situation in log file:

```
tail -f /opt/ton/danila.log
```
