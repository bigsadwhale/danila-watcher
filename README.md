# Tool for simple control Danila-Miner (TON Coin miner) under Linux

This very simple tool just run/stop and restart danila-miner.

If cpuminer runs and another GPU miners doesn`t work the tool start danila-miner.

If some other GPU miner (PhoenixMiner, teamredminer, nbminer) runs then danila-miner stop.

## Installation for Ubuntu 18.04

```
sudo mkdir -p /opt/ton
sudo wget https://whalepool-cdn.fra1.digitaloceanspaces.com/software/danila-miner/danila-miner-2.1.4-ubuntu-bionic.tar.gz
sudo tar zxf danila-miner-2.1.4-ubuntu-bionic.tar.gz -C /opt/ton/
```

After install just edit root crontab:

```echo -e "$(sudo crontab -u root -l)\n*/1	*	*	*	*	/opt/ton/danila-watcher.sh >> /opt/ton/danila.log 2>&1 &" | sudo crontab -u root -```
