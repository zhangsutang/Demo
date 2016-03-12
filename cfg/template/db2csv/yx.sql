SELECT 
	station,channel, rtu, `no`, name, `desc`, 
	CONCAT(HEX(address),'H'), CONCAT(HEX(addrres),'H'), powerbay, device, `type`, 
	manualval, signno, picture, attribute, 
	alarm, statistic
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.yxcfg;