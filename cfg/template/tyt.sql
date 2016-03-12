/* 导入转发遥调记录文件 */
DELETE FROM wlddb.tytcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/transyt.csv' 
	INTO TABLE wlddb.tytcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(channel, rtu, @tno, name, `desc`, 
	@address_var,assoctype, assocstation, @assocch,@assocrtu,assocno,@assocaddress, 
	attribute)
	SET
		address = conv(@address_var,16,10)
		;
