SELECT 
	`type`, station, `no`, `name`,`month`,`day`,`hour`,`minute`, hex(attribute)
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.reporttimecfg;