# ProxySwitcher.sh
Simple shell script that allow the user to switch the proxy form auto to desactivated or manual through the terminal. (Only work on Ubuntu for now)

# INSTALL:
```
git clone https://github.com/Truitekifile/ProxySwitcher.sh
```
Go to the file and make it executable:
```
cd /path/to/ProxySwitcher
```
```
chmod +x ProxySwitcher.sh
```
Move it to your /bin folder so you can accesse it from any folder (you have to be in the Proxyswitcher folder in order to do this)
```
sudo mv ProxySwitcher.sh /bin
```

# Use
Open a terminal and enter the command ```ProxySwitcher.sh```

Do what you want to do

The script will create a file named ```optionPS.sh```. It contain the option for the script to work proprely, it will be recreated if deleted.
