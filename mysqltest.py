#!/usr/bin/python
import MySQLdb
from Adafruit_Thermal import *
import time

time.sleep(60)
db = MySQLdb.connect(host="localhost", user="root", passwd="lahirutm", db="GFP1000")
printer = Adafruit_Thermal("/dev/serial0", 19200, timeout=5)

def processPrint(option,value1=None):
	# inverse on & off
	if option == "inverseOn":
		printer.inverseOn()

	if option == "inverseOff":
		printer.inverseOff()

	# character double-height on & off
	if option == "doubleHeightOn":
		printer.doubleHeightOn()

	if option == "doubleHeightOff":
		printer.doubleHeightOff()

	# Set justification (left, center, right) -- accepts 'L','C','R'
	if option == "justifyC":
		printer.justify('C')

	if option == 'justifyR':
		printer.justify('R')

	if option == "justifyL":
		printer.justify('L')

	# bold style
	if option == "boldOn":
		printer.boldOn()

	if option == "boldOff":
		printer.boldOff()

	# Test underline style
	if option == "underlineOn":
		printer.underlineOn()

	if option == "underlineOff":
		printer.underlineOff()

	# Set type size, accepts 'S', 'M', 'L'
	if option == "setSizeL":
		printer.setSize('L')

	if option == "setSizeM":
		printer.setSize('M')

	if option == "setSizeS":
		printer.setSize('S')

	# pass setLineHeight() to default
	if option == "setLineHeight":
		printer.setLineHeight(int(value1))

	# feed empty lines
	if option == "feed":
		printer.feed(int(value1))

	# Restore printer to defaults
	if option == "setDefault":
        	printer.setDefault()

	# Tell printer to sleep
	if option == "sleep":
        	printer.sleep()

	# Call wake() before printing again, even if reset
	if option == "wake":
        	printer.wake()

	# Barcode examples
	# CODE39 is the most common alphanumeric barcode
	if option == "CODE39":
		printer.printBarcode(str(value1)[0:7].upper(), printer.CODE39)
		printer.setBarcodeHeight(100)

	# Print UPC line on product barcodes
	if option == "UPC_A":
		printer.printBarcode(value1[0:12], printer.UPC_A)


# Print the 75x75 pixel logo in adalogo.py
def printBitmap():
	import gfx.adalogo as adalogo
	printer.printBitmap(adalogo.width, adalogo.height, adalogo.data)

# Print the 135x135 pixel QR code in adaqrcode.py
def printQR():
	import gfx.adaqrcode as adaqrcode
	printer.printBitmap(adaqrcode.width, adaqrcode.height, adaqrcode.data)
	printer.println("Adafruit!")
	printer.feed(2)




################################################################
i = 0
while True:
	cur = db.cursor()
	cur.execute("SELECT * FROM fiscal_data WHERE is_printed=0 ORDER BY id ASC")
	for row in cur.fetchall():
		id = int(row[0])
	        receipt_no = str(row[1])
		option_begin = str(row[2])
		option_value = str(row[3])
		content = str(row[4])
		option_end = str(row[5])
		
		processPrint(option_begin,option_value)
		if content != None:
			printer.println(content)
		if option_end != None:
			processPrint(option_end)

		upcur = db.cursor()
		upcur.execute(""" UPDATE fiscal_data SET is_printed=1 WHERE id='%s' """, (id,))
		db.commit()
		upcur.close()
	db.commit()
	cur.close()

db.close()

