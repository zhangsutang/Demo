/* 导入通道记录文件 */
DELETE FROM wlddb.channel;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/channel.csv' 
	INTO TABLE wlddb.channel 
	CHARACTER SET {CHSET}  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n' /*linux:'\n',windows:'\n'*/
	IGNORE 2 LINES
	(`no`, name, `desc`, protocoltype, subprotocoltype, @portpara_var, @protocolpara_var, 
	assocno, commonalarm, attribute, alarm, statistic)
	SET
		portpara = unhex(@portpara_var),
		protocolpara = unhex(@protocolpara_var)
	;
