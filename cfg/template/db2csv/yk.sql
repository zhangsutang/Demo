SELECT 
    station,channel, rtu, `no`, name, `desc`, 
	CONCAT(HEX(address),'H'), CONCAT(HEX(addrres),'H'), powerbay, device, `type`, 
	corrtype, corrno, CONCAT(HEX(addroff),'H'), CONCAT(HEX(addroffres),'H'),
	oprmax,`delay`,attribute, closedown,
	SUBSTR(allowno,1,4),SUBSTR(allowno,5,4),corrclose
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.ykcfg;