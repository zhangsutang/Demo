DELETE FROM wlddb.subprotocol;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/subprotocol.csv' 
	INTO TABLE wlddb.subprotocol 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	(protocol,`no`, name,standard,parameters)
;
