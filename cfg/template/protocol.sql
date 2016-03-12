DELETE FROM wlddb.protocol;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/protocol.csv' 
	INTO TABLE wlddb.protocol 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	(`no`, name)
;
