/* 导入逻辑计算记录文件 */
DELETE FROM wlddb.clcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/clcfg.csv' 
	INTO TABLE wlddb.clcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(station, `no`, name, `desc`, 
	powerbay, device, `type`, 
	manualval, formula, picture, attribute, alarm, statistic)
;
