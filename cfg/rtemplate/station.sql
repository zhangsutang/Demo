/* [create table station] : */
CREATE TABLE  IF NOT EXISTS `station` (
  `no` INTEGER PRIMARY KEY DEFAULT 1,
  `name` TEXT DEFAULT '',
  `desc` TEXT DEFAULT '',
  `attribute` INTEGER DEFAULT 0x4,
  `safetydate` DATETIME DEFAULT NULL ,
  `signno` INTEGER DEFAULT 0,
  `picture` TEXT DEFAULT '',
  `rvalue` INTEGER DEFAULT 0
) ;
/* <INSERT station> : */
INSERT INTO `station`( `no`,`name` ,`desc`,`attribute`,`safetydate`,`signno`) 
VALUES ( {0},'{1}' ,'{2}',{3},strftime('%Y-%m-%d %H:%M:%f','{4}') ,{5});
