/* 导入脉冲计算记录文件 */
DELETE FROM wlddb.cmcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/cmcfg.csv' 
	INTO TABLE wlddb.cmcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(station, `no`, name, `desc`,  
	powerbay, device, `type`, attachno, unit, manualval, storage, attribute)
;
