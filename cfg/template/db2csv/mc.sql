SELECT 
	station, channel, rtu, `no`, name, `desc`, CONCAT(HEX(address),'H'), CONCAT(HEX(addrres),'H'), 
	powerbay, device, `type`, unit, modulus, `max`, basicval,manualval, 
	storage, attribute
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.mccfg;