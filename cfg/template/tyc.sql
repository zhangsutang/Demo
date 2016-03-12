/* 导入转发遥测记录文件 */
DELETE FROM wlddb.tyccfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/transyc.csv' 
	INTO TABLE wlddb.tyccfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(channel, rtu, @tno, name, `desc`, 
	@address_var, assoctype, assocstation, @assocch,@assocrtu,assocno,@assocaddress, 
	modulus, offset,threshold,back,attribute)
	SET
		address = conv(@address_var,16,10)
		;
