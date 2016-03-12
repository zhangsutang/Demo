DELETE FROM wlddb.pointtypecfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/pttypecfg.csv' 
	INTO TABLE wlddb.pointtypecfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`type`, `no`, name, glossarytype, @glossaryno1_var, @glossaryno2_var)
	SET
		glossaryno = CONCAT(UNHEX(CONV(@glossaryno1_var,10,16)),UNHEX(CONV(@glossaryno2_var,10,16)))
;
