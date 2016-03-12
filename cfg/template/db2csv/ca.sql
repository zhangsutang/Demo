SELECT 
    station, `no`, name, `desc`, 
	powerbay, device, `type`, unit, 
	`decimal`, manualval, formula, low1, high1, low2, high2, back, picture, 
	storage, storagesec, attribute, alarm, statistic, volalarm, volstatistic
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.cacfg;