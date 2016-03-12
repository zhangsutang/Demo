/* 导入节点配置记录文件 */
DELETE FROM wlddb.nodecfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/nodecfg.csv' 
	INTO TABLE wlddb.nodecfg 
	CHARACTER SET {CHSET}  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n' 
	IGNORE 1 LINES
    (no,name,@ipvar,@attribute_var,@subsystem_var) 
    SET 
   		ip = unhex(@ipvar),
   		attribute = conv(@attribute_var,16,10),
   		subsystem = conv(@subsystem_var,16,10)
   		;
