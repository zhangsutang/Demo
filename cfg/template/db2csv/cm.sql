SELECT 
    station, `no`, name, `desc`,  
	powerbay, device, `type`, attachno, unit, manualval, 
	storage, attribute
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.cmcfg;