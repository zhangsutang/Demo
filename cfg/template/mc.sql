/* 导入脉冲记录文件 */
DELETE FROM wlddb.mccfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/mccfg.csv' 
	INTO TABLE wlddb.mccfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(station, channel, rtu, `no`, name, `desc`, @address_var, @addrres_var, 
	powerbay, device, `type`, unit, modulus, `max`, basicval,manualval, 
	storage, attribute)
	SET
		address = conv(@address_var,16,10),
		addrres = conv(@addrres_var,16,10)
		;
