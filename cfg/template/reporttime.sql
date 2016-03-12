DELETE FROM wlddb.reporttimecfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/reporttime.csv' 
	INTO TABLE wlddb.reporttimecfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`type`, station, `no`, `name`,`month`,`day`,`hour`,`minute`, @attribute_var) 
	SET
		attribute = unhex(@attribute_var)
		;
