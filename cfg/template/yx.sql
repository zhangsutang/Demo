/* 导入遥信记录文件 */
DELETE FROM wlddb.yxcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/yxcfg.csv' 
	INTO TABLE wlddb.yxcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(station,channel, rtu, `no`, name, `desc`, 
	@address_var, @addrres_var, powerbay, device, `type`, 
	manualval, signno, picture, attribute, 
	alarm, statistic, attachpoint)
	SET
		address = conv(@address_var,16,10),
		addrres = conv(@addrres_var,16,10)
		;
