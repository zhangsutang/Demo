/* 导入定值记录文件 */
DELETE FROM wlddb.fixvalcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/dzcfg.csv' 
	INTO TABLE wlddb.fixvalcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(channel, rtu, @address_var, name, dataformat,datasize,unit,
	modulus, attribute,low,high,pace)
	SET
		address = conv(@address_var,16,10)
		;
