SELECT 
	station, channel, rtu, `no`, name, `desc`, CONCAT(HEX(address),'H'), CONCAT(HEX(addrres),'H'), 
	powerbay, device, `type`, unit, maxval, minval, modulus, offset, 
	`decimal`, manualval, zero, low1, high1, low2, high2, back, picture, 
	storage, storagesec, attachyx, attribute, 
	alarm, statistic, volalarm, volstatistic
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.yccfg;