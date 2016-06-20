#!/usr/bin/python

import socket
ip = raw_input("Enter IP Addres: ")
port = int(raw_input("Enter Port Number: "))

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
if sock.connect_ex((ip,port)):
	print("Port ", port, " is closed!")
else:
	print("Port ", port, " is open!")
