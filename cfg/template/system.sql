DELETE FROM wlddb.syscfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/syscfg.csv' 
	INTO TABLE wlddb.syscfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(`type`, intervalpdr, beforepdr, afterpdr, @var1, 
	@var2, safedaystart, @function_var, @alarmfunc_var, @attribute_var)
	SET
		function = conv(@function_var,16,10),
		alarmfunc = conv(@alarmfunc_var,16,10),
		attribute = conv(@attribute_var,16,10)
;
