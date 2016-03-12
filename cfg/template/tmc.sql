/* 导入转发脉冲记录文件 */
DELETE FROM wlddb.tmccfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/transmc.csv' 
	INTO TABLE wlddb.tmccfg 
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
