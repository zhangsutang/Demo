/* 总体格式要求 
   1) 表记录文件一般位于config/recordset/目录下；字段顺序需与表定义保持一致；
   2) 字符编码一般包括 GBK 、UTF8,该字段需根据相应记录文件的格式进行设定，在VC6下创建的文件一般为ANSI格式（中文编码格式为GBK）
      利用Notepad++等工具可创建UTF8格式文件，此时需指定为UTF8；
   3) 字段分隔符(FIELDS TERMINATED BY),用来指定相邻字段的分隔符，如：','、' '、'\t'等；
   4) 行分隔符（LINES TERMINATED BY），在windows系统下产生的文本文件一般为'\n'，而在unix系统下一般为'\r'；
   5) 每行结束时必需指定';'(分号)。
*/
/* 导入厂站记录文件 */
DELETE FROM wlddb.station;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/station.csv' 
	INTO TABLE wlddb.station 
	CHARACTER SET UTF8  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"' /*各字段以引号编码*/
	LINES TERMINATED BY '\n' /*linux以\n终止;windows以\r\n终止*/
	IGNORE 1 LINES /*忽略标题行*/
	(`no`, name, `desc`, @attribute_var, safetydate, signno, picture)
	SET
		attribute = conv(@attribute_var,16,10)
		;
	
/* 导入节点配置记录文件 */
DELETE FROM wlddb.nodecfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/nodecfg.csv' 
	INTO TABLE wlddb.nodecfg 
	CHARACTER SET UTF8  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n' 
	IGNORE 1 LINES
    (no,name,@ipvar,@attribute_var,@subsystem_var) 
    SET 
   		ip = unhex(@ipvar),
   		attribute = conv(@attribute_var,16,10),
   		subsystem = conv(@subsystem_var,16,10);

	
/* 导入通道记录文件 */
DELETE FROM wlddb.channel;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/channel.csv' 
	INTO TABLE wlddb.channel 
	CHARACTER SET UTF8  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(`no`, name, `desc`, protocoltype, subprotocoltype, @portpara_var, @protocolpara_var, 
	assocno, commonalarm, @attribute_var, @alarm_var, @statistic_var)
	SET
		portpara = unhex(@portpara_var),
		protocolpara = unhex(@protocolpara_var),
		attribute = conv(@attribute_var,16,10),
		alarm = conv(@alarm_var,16,10),
		statistic = conv(@statistic_var,16,10)
	;
   		
/* 导入子通道记录文件 */
DELETE FROM wlddb.rtu;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/rtu.csv' 
	INTO TABLE wlddb.rtu 
	CHARACTER SET UTF8  /*linux文件以UTF8编码,windows以GBK编码*/
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(channel, `no`, name, `desc`, address, addrres, 
	`type`, @portpara_var, @protocolpara_var,@portpara1_var,@protocolpara1_var, commonalarm, 
	@attribute_var, @alarm_var, @statistic_var)
	SET
	   	portpara = unhex(concat(@portpara_var,@portpara1_var)),
	   	protocolpara = unhex(concat(@protocolpara_var,@protocolpara1_var)),
		attribute = conv(@attribute_var,16,10),
		alarm = conv(@alarm_var,16,10),
		statistic = conv(@statistic_var,16,10)
	;
	
/* 导入遥信记录文件 */
DELETE FROM wlddb.yxcfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/yx.csv' 
	INTO TABLE wlddb.yxcfg 
	CHARACTER SET UTF8 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(station,channel, rtu, `no`, name, `desc`, 
	address, addrres, powerbay, device, `type`, 
	manualval, signno, picture, @attribute_var, 
	@alarm_var, @statistic_var, attachpoint)
	SET
		attribute = conv(@attribute_var,16,10),
		alarm = conv(@alarm_var,16,10),
		statistic = conv(@statistic_var,16,10)
		;
	
/* 导入遥测记录文件 */
DELETE FROM wlddb.yccfg;
LOAD DATA LOCAL 
	INFILE '{CSVDIR}/yc.csv' 
	INTO TABLE wlddb.yccfg 
	CHARACTER SET UTF8 
	FIELDS TERMINATED BY ',' 
	OPTIONALLY ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES
	(station, channel, rtu, `no`, name, `desc`, address, addrres, 
	powerbay, device, `type`, unit, maxval, minval, modulus, offset, 
	`decimal`, manualval, zero, low1, high1, low2, high2, back, picture, 
	storage, storagesec, attachyx, @attribute_var, @alarm_var, @statistic_var, @volalarm_var, @volstatistic_var)
	SET
		attribute = unhex(@attribute_var),
		alarm = conv(@alarm_var,16,10),
		statistic = conv(@statistic_var,16,10),
		volalarm = conv(@volalarm_var,16,10),
		volstatistic = conv(@volstatistic_var,16,10)
		;
