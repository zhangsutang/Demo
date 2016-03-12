SELECT 
    channel, rtu.`no`, rtu.name, rtu.`desc`, rtu.address, rtu.addrres, 
	rtu.`type`, HEX(SUBSTR(rtu.portpara,1,128)), HEX(SUBSTR(rtu.protocolpara,1,128)), HEX(SUBSTR(rtu.portpara,129,128)), HEX(SUBSTR(protocolpara,129,128)), commonalarm, 
	attribute, alarm, statistic	
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.rtu  WHERE (SELECT COUNT(*) FROM channel WHERE no=rtu.channel AND attribute & 0x80 = 0x80);