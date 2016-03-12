/* 导入厂站记录文件 */
DELETE FROM wlddb.station;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/station.csv' 
	INTO TABLE wlddb.station 
	CHARACTER SET {CHSET}  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' /*各字段以引号编码*/
	LINES TERMINATED BY '\n' /*linux以\n终止;windows以\r\n终止*/
	IGNORE 2 LINES /*忽略标题行*/
	(`no`, name, `desc`, attribute, safetydate, signno, picture)
;
