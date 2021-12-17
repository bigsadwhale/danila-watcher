# danila-watcher

## Installation for Ubuntu 18.04

```
sudo mkdir -p /opt/ton
sudo wget https://whalepool-cdn.fra1.digitaloceanspaces.com/software/danila-miner/danila-miner-2.1.4-ubuntu-bionic.tar.gz
sudo tar zxf danila-miner-2.1.4-ubuntu-bionic.tar.gz -C /opt/ton/
```

After it edit root crontab:

```crontab -e```

Add this line:

```*/1	*	*	*	*	/opt/ton/danila-watcher.sh >> /opt/ton/danila.log 2>&1 &```
