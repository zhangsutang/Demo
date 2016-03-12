DELETE FROM wlddb.cab_points;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/cabpoints.csv' 
	INTO TABLE wlddb.cab_points 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`cp_id`,`cab_id`, `cp_iid`, `cp_type`) 
;
