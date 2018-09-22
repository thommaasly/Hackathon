#!/usr/bin/python3

import os
import re
import urllib
import urllib
response = urllib.request.urlopen('https://www.handbook.unsw.edu.au/')
data = response.read()
print (data)

faculties = []
facFound = False
for line in data:#/open(url, 'r'):
	if re.search(	"<h4>Faculty",line):
		facFault = True;
	elif (facFault == True):
		m = re.search("<h4>(.*)</h4>")
		if m:
			faculty = m.group(1)
			faculties.add(faculty)
			print(faculty + '\n')
	if re.search("Subject Area</h4>"):
		facFault = False


