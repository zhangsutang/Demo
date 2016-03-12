/* 导入遥控记录文件 */
DELETE FROM wlddb.ykcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/ykcfg.csv' 
	INTO TABLE wlddb.ykcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(station,channel, rtu, `no`, name, `desc`, 
	@address_var, @addrres_var, powerbay, device, `type`, 
	corrtype, corrno, @addroff_var,@addroffres_var,
	oprmax,`delay`,attribute, closedown,
	@allowon_var,@allowoff_var,corrclose)
	SET
		address = conv(@address_var,16,10),
		addrres = conv(@addrres_var,16,10),
		addroff = conv(@addroff_var,16,10),
		addroffres = conv(@addroffres_var,16,10),
		allowno = CONCAT(UNHEX(CONV(@allowon_var,10,16)),UNHEX(CONV(@allowoff_var,10,16)))
		;
