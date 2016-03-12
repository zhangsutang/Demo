/* [create table channel] : */
CREATE TABLE IF NOT EXISTS `channel` (
	`no` INTEGER DEFAULT 1 ,
	`name` TEXT DEFAULT '' ,
	`desc` TEXT DEFAULT '' ,
	`portpara` BLOB DEFAULT X'' ,
	`protocoltype` INTEGER DEFAULT 0 ,
	`subprotocoltype` INTEGER DEFAULT 0 ,
	`protocolpara` BLOB DEFAULT X'' ,
	`assocno` INTEGER DEFAULT 0 ,
	`commonalarm` INTEGER DEFAULT 0 ,
	`attribute` INTEGER DEFAULT 0x03 ,
	`alarm` INTEGER DEFAULT 0x023C ,
	`statistic` INTEGER DEFAULT 0 ,
	`status` INTEGER DEFAULT 2,
	`begintime` DATETIME DEFAULT '' ,
	PRIMARY KEY (`no`)
)  ;

/* <INSERT channel> : */
INSERT INTO `channel`( `no`,`name` ,`desc`,`protocoltype`,`subprotocoltype`,`portpara`,`protocolpara`,`assocno`,`commonalarm`,`attribute`,`alarm`,`statistic`) 
VALUES ( {0},'{1}','{2}',{3},{4},X'{5}',X'{6}',{7},{8},{9},{10},{11});
