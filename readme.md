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

