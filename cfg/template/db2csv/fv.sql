SELECT 
    channel, rtu, CONCAT(HEX(address),'H'), name, dataformat,datasize,unit,
	modulus, attribute,low,high,pace
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.fixvalcfg;