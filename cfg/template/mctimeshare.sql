DELETE FROM wlddb.mctimesharing;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/mctimesharing.csv' 
	INTO TABLE wlddb.mctimesharing 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(station, `no`, `type`, `begin`, `end`)
;
