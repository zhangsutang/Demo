DELETE FROM wlddb.reportcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/report.csv' 
	INTO TABLE wlddb.reportcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`type`, station, `no`, `name`, @attribute_var) 
	SET
		attribute = unhex(@attribute_var)
		;
