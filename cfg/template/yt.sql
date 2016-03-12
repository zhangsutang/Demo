/* 导入遥调记录文件 */
DELETE FROM wlddb.ytcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/ytcfg.csv' 
	INTO TABLE wlddb.ytcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(station,channel, rtu, `no`, name, `desc`, 
	@address_var, @addrres_var, powerbay, device, `type`, 
	corrtype, corrno, maxval,minval,pace,
	oprmax,`delay`,attribute, closedown,
	@allowon_var,@allowoff_var,corrclose)
	SET
		address = conv(@address_var,16,10),
		addrres = conv(@addrres_var,16,10),
		allowno = CONCAT(UNHEX(CONV(@allowon_var,10,16)),UNHEX(CONV(@allowoff_var,10,16)))
		;
