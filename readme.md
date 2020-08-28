# Micropython

## Setup dependencies
```
pip install esptool
pip install adafruit-ampy
```

## Flashing firmware

```
esptool.py --verify --chip esp32 --port /dev/ttyUSB0 write_flash -z 0x1000 <firware binary>
```

## REPLing
```
screen /dev/ttyUSB0
```


## Ampy

### Set env variable for port
```
AMPY_PORT=/dev/ttyUSB0
```

### Run python code
```
ampy --port /dev/ttyUSB0 run test.py
```

Use the `--no-output` flag to not wait for output and return control.


### Copy files to Board
```
ampy --port /dev/ttyUSB0 put /foo/test.py
```
This will **overwrite** files without warning!

### Copy directories to board
```
ampy --port /dev/ttyUSB0 put mydirectory
```

### Read file from board
```
ampy --port /dev/ttyUSB0 get boot.py
```

### Make directories on board
```
ampy --port /dev/ttyUSB0 mkdir /foo/bar
```

### List directories and files on board
```
ampy --port /dev/ttyUSB0 ls
```

### Remove files and directories
```
ampy --port /dev/ttyUSB0 rm /foo/bar
```


## Boot scripts

### /boot.py
Run first on power up/reset and should contain low level code to setup board to finish booting.

### /main.py
Run after boot.py and should have the main script.


## Best practices for boot.py
### Disable debug output!
```
import esp
esp.osdebug(None)
```
