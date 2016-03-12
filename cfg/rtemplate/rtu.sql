/* [create table rtu] : */
CREATE TABLE IF NOT EXISTS `rtu` (
	`channel` INTEGER DEFAULT 1 ,
	`no` INTEGER DEFAULT 1 ,
	`name` TEXT DEFAULT '' ,
	`desc` TEXT DEFAULT '' ,
	`address` INTEGER DEFAULT 1,
	`addrres` INTEGER DEFAULT 1,
	`type` TEXT DEFAULT '' ,
	`portpara` BLOB DEFAULT X'' ,
	`protocolpara` BLOB DEFAULT X'' ,
	`commonalarm` INTEGER DEFAULT 0 ,
	`attribute` INTEGER DEFAULT 0x03 ,
	`alarm` INTEGER DEFAULT 0x023C ,
	`statistic` INTEGER DEFAULT 0 ,
	`status` INTEGER DEFAULT 2,
	`begintime` DATETIME DEFAULT '' ,
	PRIMARY KEY (`channel`,`no`),
	UNIQUE (`channel`,`no`,`address`)
)  ;
/* <INSERT rtu> : */
INSERT INTO `rtu`( `channel`,`no`,`name` ,`desc`,`address`,`addrres`,`type`,`portpara`,`protocolpara`,`commonalarm`,`attribute`,`alarm`,`statistic`) 
VALUES ( {0},{1},'{2}','{3}',{4},{5},'{6}',X'{7}{9}',X'{8}{10}',{11},{12},{13},{14});
