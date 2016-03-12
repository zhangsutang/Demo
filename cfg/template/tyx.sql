/* 导入转发遥信记录文件 */
DELETE FROM wlddb.tyxcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/transyx.csv' 
	INTO TABLE wlddb.tyxcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(channel, rtu, @tno, name, `desc`, 
	@address_var, assoctype, assocstation, @assocch,@assocrtu,assocno,@assocaddress, 
	attribute)
	SET
		address = conv(@address_var,16,10)
		;
