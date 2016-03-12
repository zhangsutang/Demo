DELETE FROM wlddb.alarmlevelcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/alarmlevel.csv' 
	INTO TABLE wlddb.alarmlevelcfg 
	CHARACTER SET {CHSET} 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' 
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES 
	(level, multimedia, @color_var, @attribute_var)
	SET
		color = conv(@color_var,16,10),
		attribute = conv(@attribute_var,16,10)
		;
