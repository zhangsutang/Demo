/* 导入遥测记录文件 */
DELETE FROM wlddb.yccfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/yccfg.csv' 
	INTO TABLE wlddb.yccfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(station, channel, rtu, `no`, name, `desc`, @address_var, @addrres_var, 
	powerbay, device, `type`, unit, maxval, minval, modulus, offset, 
	`decimal`, manualval, zero, low1, high1, low2, high2, back, picture, 
	storage, storagesec, attachyx, attribute, alarm, statistic, volalarm, volstatistic)
	SET
		address = conv(@address_var,16,10),
		addrres = conv(@addrres_var,16,10)
		;
