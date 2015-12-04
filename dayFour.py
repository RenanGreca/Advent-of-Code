import md5

i=346386
while True:
	m = md5.new()
	m.update('iwrupvqb'+str(i))
	if m.hexdigest()[:6] == "000000":
		print i
		break
	i += 1
