SELECT 
	`no`, name, `desc`, protocoltype, subprotocoltype, HEX(portpara), HEX(protocolpara), 
	assocno, commonalarm, attribute, alarm, statistic
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.channel where attribute & 0x80 = 0x80;