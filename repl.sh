# Connect to repl using picocom.
if [ -z "$1" ]
then
	echo "No serial port specified. Using ttyUSB0."
	serial_port=/dev/ttyUSB0
else
	  serial_port=/dev/$1
fi
echo "Ctrl-a,q to exit."
picocom $serial_port -b115200
