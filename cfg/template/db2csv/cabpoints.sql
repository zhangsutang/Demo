SELECT 
	`cp_id`,`cab_id`, `cp_iid`, `cp_type`
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.cab_points;