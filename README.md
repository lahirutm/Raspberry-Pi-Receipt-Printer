# Raspberry-Pi-Receipt-Printer
Raspbery Pi Receipt Printer Using Adafruit Thermal Printer Module

Hardware Components
----------------------
Adafruit Thermal Printer Module
Raspberry Pi
5v 2A Power Supply for Printer Module & Raspberry
Thermal Paper Role
Some Jumper Wires

Here i have used MySQL database to store printing contents and commands. So, i can print anything by inserting contents & commands to the database. Adafruit python library has many beautiful commands. I have used them to print contents with different styles.

start_printer.sh bash script used to start printer on startup according to the mysql_service.py file by adding it in rc.local file in /etc folder. 
