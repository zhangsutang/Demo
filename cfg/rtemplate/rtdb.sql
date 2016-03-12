/* [create table station] : */
CREATE TABLE  if not exists `station` (
  `no` INTEGER PRIMARY KEY ,
  `name` TEXT ,
  `desc` TEXT ,
  `attribute` INTEGER ,
  `safetydate` TEXT ,
  `signno` INTEGER ,
  `picture` TEXT ,
  `rvalue` INTEGER
) ;

/* [create table yx] : */
CREATE TABLE if not exists `yx` (
	`station` INTEGER ,
	`no` INTEGER ,
	`name` TEXT ,
	`desc` TEXT ,
	`channel` INTEGER ,
	`rtu` INTEGER  ,
	`address` INTEGER ,
	`addrres` INTEGER ,
	`powerbay` INTEGER  ,
	`device` INTEGER ,
	`type` INTEGER  ,
	`manualval` INTEGER  ,
	`picture` TEXT ,
	`signno` INTEGER ,
	`attachpoint` INTEGER ,
	`attribute` INTEGER ,
	`alarm` INTEGER ,
	`statistic` INTEGER ,
	`rvalue` INTEGER ,
	`rattribute` INTEGER ,
	`rwarnstatus` INTEGER ,
	`rstatuscode` INTEGER 
)  ;
