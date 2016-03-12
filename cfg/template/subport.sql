DELETE FROM wlddb.subport;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/subport.csv' 
	INTO TABLE wlddb.subport 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	(port,`no`, name,parameters)
;
