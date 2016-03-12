SELECT 
    station, `no`, name, `desc`, 
	powerbay, device, `type`, 
	manualval, formula, picture, attribute, alarm, statistic
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.clcfg;