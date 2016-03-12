SELECT 
    `type`, intervalpdr, beforepdr, afterpdr, safedaystart, 
    HEX(function), HEX(alarmfunc), HEX(attribute)
 INTO OUTFILE '{CSVDIR}' 
 CHARACTER SET {CHSET} 
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
 LINES TERMINATED BY '\n' 
 FROM wlddb.syscfg;