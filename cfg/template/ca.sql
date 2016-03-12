/* 导入模拟计算记录文件 */
DELETE FROM wlddb.cacfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/cacfg.csv' 
	INTO TABLE wlddb.cacfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(station, `no`, name, `desc`, 
	powerbay, device, `type`, unit, 
	`decimal`, manualval, formula, low1, high1, low2, high2, back, picture, 
	storage, storagesec, attribute, alarm, statistic, volalarm, volstatistic)
;
