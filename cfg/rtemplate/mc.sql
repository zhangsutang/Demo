/* [create table mc] : */
CREATE TABLE IF NOT EXISTS `mc` (
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
	`unit` INTEGER DEFAULT 0 ,
	`modulus` INTEGER DEFAULT 1 ,
	`max` INTEGER DEFAULT 0 ,
	`basicval` INTEGER DEFAULT 0 ,
	`manualval` INTEGER  DEFAULT 0.0,
	`storage` INTEGER DEFAULT 0 ,
	`attribute` INTEGER DEFAULT 0x1 ,
	`rvalue` INTEGER DEFAULT 0,
	`rattribute` INTEGER DEFAULT 0x8,
	PRIMARY KEY (`station`,`no`),
	UNIQUE (`channel`,`rtu`,`address`)
)  ;
/* <INSERT mc> : */
INSERT INTO `mc`( `station`,`channel`,`rtu`,  `no`,   `name` ,   `desc`,  `address`,`addrres`,`powerbay`,`device`,`type`,`unit`,`modulus`,`max`,`basicval`,`manualval`,`storage`,`attribute`) 
VALUES (          {0},   {1}, {2},{3},'{4}' ,'{5}',0x0{6},  0x0{7},  {8},  {9},{10},{11},{12},{13},  {14}, {15}, {16}, {17});
