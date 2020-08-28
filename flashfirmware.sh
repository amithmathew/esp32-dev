# Expects bin file name as parameter.
# Uses ttyUSB0 as serial port if no second parameter passed.
if [ -z "$1" ]
then
	echo "No firmware file specified. Full path to Firmware file should be passed as first parameter."
	echo "Aborting."
	exit 1
fi
if [ -z "$2" ]
then 
	echo "No serial port specified. Using ttyUSB0."
	serial_port=/dev/ttyUSB0
else
	serial_port=/dev/$2
fi
echo "--------------------------------------------------------------------------"
echo "Erasing existing firmware."
echo "Will run -"
echo "esptool.py --port $serial_port erase_flash"
esptool.py --port $serial_port erase_flash
echo "Erased flash. esptool.py returned code $?"
echo "--------------------------------------------------------------------------"
echo "Will run -"
echo "esptool.py --verify --chip esp32 --port $serial_port write_flash 0x100 $1"
esptool.py --verify --chip esp32 --port $serial_port write_flash 0x100 $1
echo "Completed. esptool.py returned code $?"
