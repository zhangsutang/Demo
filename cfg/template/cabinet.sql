DELETE FROM wlddb.cabinet;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/cabinet.csv' 
	INTO TABLE wlddb.cabinet 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`cab_id`, `cab_name`, `cab_iid`, `cab_path`) 
;
