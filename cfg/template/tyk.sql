/* 导入转发遥控记录文件 */
DELETE FROM wlddb.tykcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/transyk.csv' 
	INTO TABLE wlddb.tykcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(channel, rtu, @tno, name, `desc`, 
	@address_var, @addroff_var,assoctype, assocstation, @assocch,@assocrtu,assocno,@assocaddress, 
	attribute)
	SET
		address = conv(@address_var,16,10),
		addroff = conv(@addroff_var,16,10)
		;
