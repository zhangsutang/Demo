/* 导入子通道记录文件 */
DELETE FROM wlddb.rtu;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/rtucfg.csv' 
	INTO TABLE wlddb.rtu 
	CHARACTER SET {CHSET}  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 2 LINES
	(channel, `no`, name, `desc`, address, addrres, 
	`type`, @portpara1_var, @protocolpara1_var, @portpara2_var, @protocolpara2_var, commonalarm, 
	attribute, alarm, statistic)
	SET
	   	portpara = CONCAT(unhex(@portpara1_var),unhex(@portpara2_var)),
	   	protocolpara = CONCAT(unhex(@protocolpara1_var),unhex(@protocolpara2_var))
	;
