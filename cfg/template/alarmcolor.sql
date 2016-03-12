DELETE FROM wlddb.alarmcolorcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/alarmcolor.csv' 
	INTO TABLE wlddb.alarmcolorcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`type`, @color_var)
	SET
		color = conv(@color_var,16,10)
		;
