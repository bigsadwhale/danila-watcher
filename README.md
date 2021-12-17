# Tool for simple control Danila-Miner (TON Coin miner) under Linux

This very simple tool just run/stop and restart danila-miner.

If you run CPU miner (cpuminer) in mmpOS or HiveOS or another Linux then watcher cpuminer runs and another GPU miners doesn`t work the tool start danila-miner.

If some other GPU miner (PhoenixMiner, teamredminer, nbminer) runs then danila-miner stop.

## Installation for Ubuntu 18.04

```
sudo mkdir -p /opt/ton
sudo wget https://raw.githubusercontent.com/bigsadwhale/danila-watcher/main/danila-watcher.sh -P /opt/ton
sudo chmod +x /opt/ton/danila-watcher.sh
sudo wget https://whalepool-cdn.fra1.digitaloceanspaces.com/software/danila-miner/danila-miner-2.1.4-ubuntu-bionic.tar.gz -P /opt/ton
sudo tar zxf /opt/ton/danila-miner-2.1.4-ubuntu-bionic.tar.gz -C /opt/ton/
```

Edit file /opt/ton/danila-watsher.sh and set there your wallet.

For start watcher just add task to root crontab:

```
echo -e "$(sudo crontab -u root -l)\n*/1 * * * * /opt/ton/danila-watcher.sh >> /opt/ton/danila.log 2>&1 &" | sudo crontab -u root -
```

You can see what happend with log file:

```
tail -f /opt/ton/danila.log
```
