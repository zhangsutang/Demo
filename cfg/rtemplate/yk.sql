/* [create table yk] : */
CREATE TABLE IF NOT EXISTS `yk` (
	`station` INTEGER DEFAULT 1,
	`no` INTEGER DEFAULT 1,
	`name` TEXT DEFAULT '',
	`desc` TEXT DEFAULT '',
	`channel` INTEGER DEFAULT 1,
	`rtu` INTEGER  DEFAULT 1,
	`address` INTEGER DEFAULT 1,
	`addrres` INTEGER DEFAULT 1,
	`addroff` INTEGER DEFAULT 1 ,
	`addroffres` INTEGER DEFAULT 1 ,
	`powerbay` INTEGER DEFAULT 0 ,
	`device` INTEGER DEFAULT 0,
	`type` INTEGER  DEFAULT 0,
	`corrtype` INTEGER  DEFAULT 0 ,
	`corrno` INTEGER  DEFAULT 0 ,
	`corrclose` INTEGER  DEFAULT 0 ,
	`allowno` INTEGER  DEFAULT 0 ,
	`oprmax` INTEGER  DEFAULT 0 ,
	`oprtimes` INTEGER  DEFAULT 0 ,
	`delay` INTEGER  DEFAULT 0 ,
	`lastime` DATETIME DEFAULT (datetime(0, 'unixepoch', 'localtime')) ,
	`attribute` INTEGER DEFAULT 0x0 ,
	`closedown` INTEGER DEFAULT 0x0 ,
	`alarm`  INTEGER DEFAULT 0x0 ,
	`runattr` INTEGER DEFAULT 2,
	PRIMARY KEY (`station`,`no`),
	UNIQUE (`channel`,`rtu`,`address`)
)  ;
/* <INSERT yk> : */
INSERT INTO `yk`( 
`station`,`channel`,`rtu`,`no`,`name` ,`desc`,`address`,`addrres`,`powerbay`,`device`,`type`,`corrtype`,`corrno`,`addroff`,`addroffres`,`oprmax`,`delay`,`attribute`,`closedown`,`allowno`,`corrclose`) 
VALUES ( {0},{1},{2},{3},'{4}' ,'{5}',0x0{6},0x0{7},{8},{9},{10},{11},{12},0x0{13},0x0{14},{15},{16},{17},{18},{19},{20});
