/* [create table yx] : */
CREATE TABLE IF NOT EXISTS `yx` (
	`station` INTEGER DEFAULT 1,
	`no` INTEGER DEFAULT 1,
	`name` TEXT DEFAULT '',
	`desc` TEXT DEFAULT '',
	`channel` INTEGER DEFAULT 1,
	`rtu` INTEGER  DEFAULT 1,
	`address` INTEGER DEFAULT 1,
	`addrres` INTEGER DEFAULT 1,
	`powerbay` INTEGER DEFAULT 0 ,
	`device` INTEGER DEFAULT 0,
	`type` INTEGER  DEFAULT 0,
	`manualval` INTEGER  DEFAULT 0,
	`picture` TEXT DEFAULT '',
	`signno` INTEGER DEFAULT 0,
	`attachpoint` INTEGER DEFAULT 0,
	`attribute` INTEGER DEFAULT 0x4,
	`alarm` INTEGER DEFAULT 0x0CA,
	`statistic` INTEGER DEFAULT 0,
	`rvalue` INTEGER DEFAULT 0,
	`rattribute` INTEGER DEFAULT 0x8,
	`rwarnstatus` INTEGER DEFAULT 0,
	`rstatuscode` INTEGER DEFAULT 0,
	PRIMARY KEY (`station`,`no`),
	UNIQUE (`channel`,`rtu`,`address`)
)  ;
/* <INSERT yx> : */
INSERT INTO `yx`( `station`,`channel`,`rtu`,`no`,`name` ,`desc`,`address`,`addrres`,`powerbay`,`device`,`type`,`manualval`,`signno`,`picture`,`attribute`,`alarm`,`statistic`) 
VALUES ( {0},{1},{2},{3},'{4}' ,'{5}',0x0{6},0x0{7},{8},{9},{10},{11},{12},'{13}',{14},{15},{16});
