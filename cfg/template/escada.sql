/**** 创建数据库 ****/
CREATE DATABASE if not exists wlddb character set 'utf8' ;
USE wlddb;

/**** 1: station ****/
CREATE TABLE  if not exists `wlddb`.`station` (
  `no` tinyint(1) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `desc` varchar(128) NOT NULL,
  `attribute` int(4) unsigned NOT NULL,
  `safetydate` datetime NOT NULL,
  `signno` tinyint(1) unsigned NOT NULL,
  `picture` varchar(64) NOT NULL,
   PRIMARY KEY  (`no`) 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 2: 通道表 ******/
CREATE TABLE if not exists `wlddb`.`channel` (
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar (32) NOT NULL ,
	`desc` varchar (128) NOT NULL ,
	`portpara` varbinary (128) NOT NULL ,
	`protocoltype` smallint(2) unsigned NOT NULL ,
	`subprotocoltype` smallint(2) unsigned NOT NULL ,
	`protocolpara` varbinary (128) NOT NULL ,
	`assocno` tinyint(1) unsigned NOT NULL ,
	`commonalarm` int(4) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';


/****** 3: 子通道（RTU）表 ******/
CREATE TABLE if not exists `wlddb`.`rtu` (
	`channel` tinyint(1) unsigned NOT NULL DEFAULT 1,
	`no` smallint(2) unsigned NOT NULL  DEFAULT 1,
	`name` varchar (32) NOT NULL ,
	`desc` varchar (128) NOT NULL ,
	`address` int unsigned NOT NULL DEFAULT 1,
	`addrres` int unsigned NOT NULL DEFAULT 1,
	`type` varchar (32) NOT NULL ,
	`portpara` varbinary (256) NOT NULL ,
	`protocolpara` varbinary (256) NOT NULL ,
	`commonalarm` int ,
	`attribute` int unsigned NOT NULL  DEFAULT 0,
	`alarm` int unsigned NOT NULL DEFAULT 0x0a,
	`statistic` int unsigned NOT NULL DEFAULT 0,
	PRIMARY KEY (`channel`,	`no`),
	CONSTRAINT `FK_rtu_channel` FOREIGN KEY (`channel`) REFERENCES `wlddb`.`channel` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 4: 遥信配置表 ******/
CREATE TABLE if not exists `wlddb`.`yxcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar (32) NOT NULL ,
	`desc` varchar (128) NOT NULL ,
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`addrres` int(4) unsigned NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`manualval` tinyint(1) unsigned NOT NULL ,
	`picture` varchar (64) NOT NULL ,
	`signno` tinyint(1) unsigned NOT NULL ,
	`attachpoint` int(4) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL DEFAULT 4,
	`alarm` int(4) unsigned NOT NULL DEFAULT 0x0CA,
	`statistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `IX_yxcfg` UNIQUE (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_yxcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_yxcfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 5: 遥测配置表 ******/
CREATE TABLE if not exists `wlddb`.`yccfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar (32) NOT NULL ,
	`desc` varchar (128) NOT NULL ,
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`addrres` int(4) unsigned NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`maxval` real NOT NULL ,
	`minval` real NOT NULL ,
	`modulus` real NOT NULL ,
	`offset` real NOT NULL ,
	`decimal` tinyint(1) unsigned NOT NULL ,
	`manualval` real NOT NULL ,
	`zero` real NOT NULL ,
	`low1` real NOT NULL ,
	`high1` real NOT NULL ,
	`low2` real NOT NULL ,
	`high2` real NOT NULL ,
	`back` real NOT NULL ,
	`picture` varchar(64) NOT NULL ,
	`storage` smallint(2) unsigned NOT NULL ,
	`storagesec` tinyint(1) unsigned NOT NULL ,
	`attachyx` int(4) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	`volalarm` int(4) unsigned NOT NULL ,
	`volstatistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `IX_yccfg` UNIQUE (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_yccfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_yccfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 6: 脉冲配置表 ******/
CREATE TABLE if not exists `wlddb`.`mccfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar (32) NOT NULL ,
	`desc` varchar (128) NOT NULL ,
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`addrres` int(4) unsigned NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`modulus` real NOT NULL ,
	`max` float(8) NOT NULL ,
	`basicval` float(8) NOT NULL ,
	`manualval` float(8) NOT NULL ,
	`storage` smallint(2) unsigned NOT NULL ,
	`attribute` tinyint(1) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `IX_mccfg` UNIQUE (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_mccfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_mccfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 7: 遥控配置表 ******/
CREATE TABLE if not exists `wlddb`.`ykcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar (32) NOT NULL ,
	`desc` varchar (128) NOT NULL ,
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`addrres` int(4) unsigned NOT NULL ,
	`addroff` int(4) unsigned NOT NULL ,
	`addroffres` int(4) unsigned NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`corrtype` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`corrclose` int(4) unsigned NOT NULL ,
	`allowno` varbinary (8) NOT NULL ,
	`oprmax` tinyint(1) unsigned NOT NULL ,
	`oprtimes` tinyint(1) unsigned NOT NULL ,
	`delay` smallint(2) unsigned NOT NULL ,
	`lastime` datetime NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`closedown` smallint(2) unsigned NOT NULL ,
	`alarm` smallint(2) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `IX_ykcfg` UNIQUE (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_ykcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_ykcfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 8: 遥调配置表 ******/
CREATE TABLE if not exists `wlddb`.`ytcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`addrres` int(4) unsigned NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`corrtype` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`corrclose` int(4) unsigned NOT NULL ,
	`allowno` varbinary (8) NOT NULL ,
	`maxval` real NOT NULL ,
	`minval` real NOT NULL ,
	`pace` real NOT NULL ,
	`oprmax` tinyint(1) unsigned NOT NULL ,
	`oprtimes` tinyint(1) unsigned NOT NULL ,
	`delay` smallint(2) unsigned NOT NULL ,
	`lastime` datetime NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`closedown` smallint(2) unsigned NOT NULL ,
	`alarm` smallint(2) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `IX_ytcfg` UNIQUE (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_ytcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_ytcfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';
	
/****** 9: 模拟计算配置表 ******/
CREATE TABLE if not exists `wlddb`.`cacfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`decimal` tinyint(1) unsigned NOT NULL ,
	`manualval` real NOT NULL ,
	`formula` varchar(3000) NOT NULL ,
	`low1` real NOT NULL ,
	`high1` real NOT NULL ,
	`low2` real NOT NULL ,
	`high2` real NOT NULL ,
	`back` real NOT NULL ,
	`picture` varchar(64) NOT NULL ,
	`storage` smallint(2) unsigned NOT NULL ,
	`storagesec` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	`volalarm` int(4) unsigned NOT NULL ,
	`volstatistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `FK_cacfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 10: 逻辑计算配置表 ******/
CREATE TABLE if not exists `wlddb`.`clcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`manualval` tinyint(1) unsigned NOT NULL ,
	`formula` varchar(3000) NOT NULL ,
	`picture` varchar(64) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `FK_clcfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 11: 脉冲计算配置表 ******/
CREATE TABLE if not exists `wlddb`.`cmcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`device` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attachno` int(4) unsigned NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`manualval` float(8) NOT NULL ,
	`storage` smallint(2) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `FK_cmcfg_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 12: 间隔表 ******/
CREATE TABLE if not exists `wlddb`.`powerbay` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`bus` smallint(2) unsigned NOT NULL ,
	`maindev` int(4) unsigned NOT NULL ,
	`plkg` int(4) unsigned NOT NULL ,
	`pldz` int(4) unsigned NOT NULL ,
	`pljg` tinyint(1) unsigned NOT NULL ,
	`signno` tinyint(1) unsigned NOT NULL ,
	`mainpt` int(4) unsigned NOT NULL ,
	`close` int(4) unsigned NOT NULL ,
	`picture` MEDIUMTEXT ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY  (`station`,`no`),
	CONSTRAINT `IX_powerbay` UNIQUE  NONCLUSTERED (`station`,`name`),
	CONSTRAINT `FK_powerbay_station` FOREIGN KEY (`station`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 13: 设备表 ******/
CREATE TABLE if not exists `wlddb`.`device` (
	`station` tinyint(1) unsigned NOT NULL ,
	`powerbay` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`bus` smallint(2) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`corrtype` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`runno` varchar(16) NOT NULL ,
	`state` tinyint(1) unsigned NOT NULL ,
	`volgrade` tinyint(1) unsigned NOT NULL ,
	`voltage` real NOT NULL ,
	`current` real NOT NULL ,
	`power` real NOT NULL ,
	`factor` real NOT NULL ,
	`fixgrade` varchar(16) NOT NULL ,
	`model` varchar(32) NOT NULL ,
	`manufacturer` varchar(32) NOT NULL ,
	`factoryno` varchar(32) NOT NULL ,
	`factorytime` datetime NOT NULL ,
	`runtime` datetime NOT NULL ,
	`lastfixtime` datetime NOT NULL ,
	`fixcycle` int(4) unsigned NOT NULL ,
	`dutyman` varchar(12) NOT NULL ,
	`remark` varchar(256) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	`resattr` varbinary(64) NOT NULL ,
	`reserve` varbinary(256) NOT NULL ,
	PRIMARY KEY  (`station`,`powerbay`,`no`),
	CONSTRAINT `FK_device_powerbay` FOREIGN KEY (`station`,`powerbay`) REFERENCES `wlddb`.`powerbay` (`station`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE    
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 14: 数据库版本表 ******/
CREATE TABLE if not exists `wlddb`.`dbversion` (
	`dbversion` smallint(2) unsigned NOT NULL ,
	`resspace` varbinary(64) NOT NULL ,
	PRIMARY KEY (`dbversion`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 15: 系统配置表 ******/
CREATE TABLE if not exists `wlddb`.`syscfg` (
	`type` tinyint(1) unsigned NOT NULL ,
	`intervalrtdata` smallint(2) unsigned NOT NULL ,
	`intervalgraphic` smallint(2) unsigned NOT NULL ,
	`graphicmax` tinyint(1) unsigned NOT NULL ,
	`intervalpdr` tinyint(1) unsigned NOT NULL ,
	`beforepdr` tinyint(1) unsigned NOT NULL ,
	`afterpdr` tinyint(1) unsigned NOT NULL ,
	`fullalarmdb` tinyint(1) unsigned NOT NULL ,
	`fullalarmlog` tinyint(1) unsigned NOT NULL ,
	`safedaystart` datetime NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`function` int(4) unsigned NOT NULL ,
	`alarmfunc` int(4) unsigned NOT NULL ,
	`alarmnet` int(4) unsigned NOT NULL ,
	`alarmnode` int(4) unsigned NOT NULL ,
	`alarmswitch` int(4) unsigned NOT NULL ,
	`typename` varchar(32) NOT NULL ,
	`productname` varchar(64) NOT NULL ,
	`exturl` varchar(64) NOT NULL ,/*外网地址*/
	`resspace` varbinary(64) NOT NULL ,
	PRIMARY KEY  (`type`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 16: 术语表 ******/
CREATE TABLE if not exists `wlddb`.`glossary` (
	`type` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	PRIMARY KEY (`type`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 17: 节点配置表 ******/
CREATE TABLE if not exists `wlddb`.`nodecfg` (
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar(64) NOT NULL ,
	`ip` varbinary(16) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`subsystem` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 18: 遥信统计配置表 ******/
CREATE TABLE if not exists `wlddb`.`yxstatcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`corrno`,`type`),
	CONSTRAINT `FK_yxstatcfg_yxcfg` FOREIGN KEY (`station`,	`corrno`) REFERENCES `wlddb`.`yxcfg` (`station`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 19: 遥测统计配置表 ******/
CREATE TABLE if not exists `wlddb`.`ycstatcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`corrno`,`type`),
	CONSTRAINT `FK_ycstatcfg_yccfg` FOREIGN KEY (`station`,	`corrno`) REFERENCES `wlddb`.`yccfg` (`station`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 20: 模拟计算统计配置表 ******/
CREATE TABLE if not exists `wlddb`.`castatcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`corrno`,`type`),
	CONSTRAINT `FK_castatcfg_cacfg` FOREIGN KEY (`station`,	`corrno`) REFERENCES `wlddb`.`cacfg` (`station`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 21: 逻辑计算统计配置表 ******/
CREATE TABLE if not exists `wlddb`.`clstatcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`corrno` int(4) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`corrno`,`type`),
	CONSTRAINT `FK_clstatcfg_clcfg` FOREIGN KEY (`station`,	`corrno`) REFERENCES `wlddb`.`clcfg` (`station`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 22: 通道统计配置表 ******/
CREATE TABLE if not exists `wlddb`.`chstatcfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`channel`,`type`),
	CONSTRAINT `FK_chstatcfg_channel` FOREIGN KEY (`channel`) REFERENCES `wlddb`.`channel` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 23: 子通道（RTU）统计配置表 ******/
CREATE TABLE if not exists `wlddb`.`rtustatcfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`type`),
	CONSTRAINT `FK_rtustatcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 24: 报警级别配置表 ******/
CREATE TABLE if not exists `wlddb`.`alarmlevelcfg` (
	`level` tinyint(1) unsigned NOT NULL ,
	`multimedia` varchar(256) NOT NULL ,
	`color` int(4) unsigned NOT NULL ,
	`attribute` tinyint(1) unsigned NOT NULL ,
	PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 24: 报警颜色配置表 ******/
CREATE TABLE if not exists `wlddb`.`alarmcolorcfg` (
	`type` tinyint(1) unsigned NOT NULL ,
	`color` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 26: 分时电量时段表 ******/
CREATE TABLE if not exists `wlddb`.`mctimesharing` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`begin` smallint(2) unsigned NOT NULL ,
	`end` smallint(2) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 27: 电压合格标准表 ******/
CREATE TABLE if not exists `wlddb`.`volstandard` (
	`station` tinyint(1) unsigned NOT NULL ,
	`volgrade` tinyint(1) unsigned NOT NULL ,
	`vollow` varbinary(96) NOT NULL ,
	`volhigh` varbinary(96) NOT NULL ,
	`volback` real NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`volgrade`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 28: 计划值表 ******/
CREATE TABLE if not exists `wlddb`.`planval` (
	`station` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`no` int(4) unsigned NOT NULL ,
	`month` tinyint(1) unsigned NOT NULL ,
	`day` tinyint(1) unsigned NOT NULL ,
	`value` varbinary(768) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`type`,`no`,`month`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 29: 点类型配置表 ******/
CREATE TABLE if not exists `wlddb`.`pointtypecfg` (
	`type` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`glossarytype` tinyint(1) unsigned NOT NULL ,
	`glossaryno` varbinary(2) NOT NULL ,
	PRIMARY KEY (`type`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 30: PDR配置表 ******/
CREATE TABLE if not exists `wlddb`.`pdrcfg` (
	`springtype` tinyint(1) unsigned NOT NULL ,
	`springstation` tinyint(1) unsigned NOT NULL ,
	`springno` int(4) unsigned NOT NULL ,
	`recordtype` tinyint(1) unsigned NOT NULL ,
	`recordstation` tinyint(1) unsigned NOT NULL ,
	`recordno` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`springtype`,`springstation`,`springno`,`recordtype`,`recordstation`,`recordno`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 31: 报表配置表 ******/
CREATE TABLE if not exists `wlddb`.`reportcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`no` smallint(2) unsigned NOT NULL ,
	`name` varchar(64) NOT NULL ,
	`attribute` tinyint(1) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`type`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 32: 定时报表配置表 ******/
CREATE TABLE if not exists `wlddb`.`reporttimecfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`no` smallint(2) unsigned NOT NULL ,
	`month` tinyint(1) unsigned NOT NULL ,
	`day` tinyint(1) unsigned NOT NULL ,
	`hour` tinyint(1) unsigned NOT NULL ,
	`minute` tinyint(1) unsigned NOT NULL ,
	`name` varchar(64) NOT NULL ,
	`maketime` datetime NOT NULL ,
	`printnum` tinyint(1) unsigned NOT NULL ,
	`attribute` tinyint(1) unsigned NOT NULL ,
	PRIMARY KEY (`station`,`type`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 31: 报表结果表 ******/
CREATE TABLE if not exists `wlddb`.`reports` (
	`reporttype` tinyint(1) unsigned NOT NULL ,
	`station` tinyint(1) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`no` smallint(2) unsigned NOT NULL ,
	`maketime` datetime NOT NULL ,
	PRIMARY KEY (`reporttype`,`station`,`type`,`no`,`maketime`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 33: 母线配置表 ******/
CREATE TABLE if not exists `wlddb`.`generatrixcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` smallint(2) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`attachyx` int(4) unsigned NOT NULL ,
	`attachyc` int(4) unsigned NOT NULL ,
	`u0high` real NOT NULL ,
	`u0low` real NOT NULL ,
	`mlkg` varbinary(8) NOT NULL ,
	`attribute` tinyint(1) unsigned NOT NULL ,
	`alarm` smallint(2) unsigned NOT NULL ,
	`reserve` varbinary (32) NOT NULL ,
	PRIMARY KEY (`station`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 34: 出线配置表 ******/
CREATE TABLE if not exists `wlddb`.`linecfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`generatrixno` smallint(2) unsigned NOT NULL ,
	`i0no` int(4) unsigned NOT NULL ,
	`i0signno` int(4) unsigned NOT NULL ,
	`attribute` tinyint(1) unsigned NOT NULL ,
	`reserve` varbinary(32) NOT NULL ,
	PRIMARY KEY (`station`,`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 35: GSM短信报警配置表 ******/
CREATE TABLE if not exists `wlddb`.`gsmcfg` (
	`no` int(4) unsigned NOT NULL ,
	`port` tinyint(1) unsigned NOT NULL ,
	`baud` int(4) unsigned NOT NULL ,
	`databit` tinyint(1) unsigned NOT NULL ,
	`stopbit` tinyint(1) unsigned NOT NULL ,
	`parity` tinyint(1) unsigned NOT NULL ,
	`smscenter` varchar(32) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`reserve` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 36: GSM短信接收号码配置表 ******/
CREATE TABLE if not exists `wlddb`.`gsmmobilecfg` (
	`no` int(4) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`mobile` varchar(32) NOT NULL ,
	PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 37: 电压无功控制配置表 ******/
CREATE TABLE if not exists `wlddb`.`vqccfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`mlkg_no` varbinary(12) NOT NULL ,
	`mldz_no` varbinary(12) NOT NULL ,
	`check_time` tinyint(1) unsigned NOT NULL ,
	`exec_time` tinyint(1) unsigned NOT NULL ,
	`delay` smallint(2) unsigned NOT NULL ,
	`cap_interval` int(4) unsigned NOT NULL ,
	`tra_interval` int(4) unsigned NOT NULL ,
	`c_opr_vol` real NOT NULL ,
	`set_vol` varbinary(8) NOT NULL ,
	`set_cos` varbinary(8) NOT NULL ,
	`transf_attr` int(4) unsigned NOT NULL ,
	`t_m_name` varbinary(66) NOT NULL ,
	`t_yx_no` varbinary(8) NOT NULL ,
	`t_vol_no` varbinary(8) NOT NULL ,
	`t_cos_no` varbinary(8) NOT NULL ,
	`t_q_no` varbinary(8) NOT NULL ,
	`t_i_no` varbinary(8) NOT NULL ,
	`t_set_i_u` varbinary(8) NOT NULL ,
	`t_name` varbinary(66) NOT NULL ,
	`t_yk_no` varbinary(8) NOT NULL ,
	`t_calc_no` varbinary(8) NOT NULL ,
	`t_prot_no` varbinary(8) NOT NULL ,
	`t_gas_no` varbinary(8) NOT NULL ,
	`t_time` varbinary(16) NOT NULL ,
	`cap_attr` int(4) unsigned NOT NULL ,
	`c_name_1` varbinary(66) NOT NULL ,
	`c_name_2` varbinary(66) NOT NULL ,
	`c_dz_no` varbinary(16) NOT NULL ,
	`c_yk_no` varbinary(16) NOT NULL ,
	`c_yx_no` varbinary(16) NOT NULL ,
	`c_prot_no` varbinary(16) NOT NULL ,
	`c_time` varbinary(32) NOT NULL ,
	`c_max_num` varbinary(4) NOT NULL ,
	`c_opr_num` varbinary(4) NOT NULL ,
	`reserve` varbinary(256) NOT NULL ,
	PRIMARY KEY (`station`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 38: 电压无功稳定范围值配置表 ******/
CREATE TABLE if not exists `wlddb`.`vqclmtcfg` (
	`station` tinyint(1) unsigned NOT NULL ,
	`month` tinyint(1) unsigned NOT NULL ,
	`set_vol_l` varbinary(96) NOT NULL ,
	`set_vol_h` varbinary(96) NOT NULL ,
	`set_cos_l` varbinary(96) NOT NULL ,
	`set_cos_h` varbinary(96) NOT NULL ,
	PRIMARY KEY (`station`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 39: 保护定值配置表 ******/
CREATE TABLE if not exists `wlddb`.`fixvalcfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`name` varchar(128) NOT NULL ,
	`dataformat` tinyint(1) unsigned NOT NULL ,
	`datasize` tinyint(1) unsigned NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`low` varbinary(8) NOT NULL ,
	`high` varbinary(8) NOT NULL ,
	`pace` varbinary(8) NOT NULL ,
	`modulus` real NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`reserve` varbinary(32) NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_fixvalcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 40 转发遥信配置表 ******/
CREATE TABLE if not exists `wlddb`.`tyxcfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`assocstation` tinyint(1) unsigned NOT NULL ,
	`assocno` int(4) unsigned NOT NULL ,
	`assoctype` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_tyxcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_tyxcfg_station` FOREIGN KEY (`assocstation`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 41 转发遥测配置表 ******/
CREATE TABLE if not exists `wlddb`.`tyccfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`assocstation` tinyint(1) unsigned NOT NULL ,
	`assocno` int(4) unsigned NOT NULL ,
	`assoctype` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`modulus` real NOT NULL ,
	`offset` real NOT NULL ,
	`threshold` real NOT NULL DEFAULT 0.01,
	`back` real NOT NULL DEFAULT 0,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_tyccfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_tyccfg_station` FOREIGN KEY (`assocstation`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 42 转发脉冲配置表 ******/
CREATE TABLE if not exists `wlddb`.`tmccfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`assocstation` tinyint(1) unsigned NOT NULL ,
	`assocno` int(4) unsigned NOT NULL ,
	`assoctype` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`unit` tinyint(1) unsigned NOT NULL ,
	`modulus` real NOT NULL ,
	`offset` real NOT NULL ,
	`threshold` real NOT NULL DEFAULT 0.01,
	`back` real NOT NULL DEFAULT 0,
	`attribute` tinyint(1) unsigned NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_tmccfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_tmccfg_station` FOREIGN KEY (`assocstation`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 43 转发遥控配置表 ******/
CREATE TABLE if not exists `wlddb`.`tykcfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`addroff` int(4) unsigned NOT NULL ,
	`assocstation` tinyint(1) unsigned NOT NULL ,
	`assocno` int(4) unsigned NOT NULL ,
	`assoctype` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`closedown` smallint(2) unsigned NOT NULL ,
	`alarm` smallint(2) unsigned NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_tykcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_tykcfg_station` FOREIGN KEY (`assocstation`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 44 转发遥调配置表 ******/
CREATE TABLE if not exists `wlddb`.`tytcfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`assocstation` tinyint(1) unsigned NOT NULL ,
	`assocno` int(4) unsigned NOT NULL ,
	`assoctype` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`closedown` smallint(2) unsigned NOT NULL ,
	`alarm` smallint(2) unsigned NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_tytcfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_tytcfg_station` FOREIGN KEY (`assocstation`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 45 转发SOE配置表 ******/
CREATE TABLE if not exists `wlddb`.`tsoecfg` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`address` int(4) unsigned NOT NULL ,
	`assocstation` tinyint(1) unsigned NOT NULL ,
	`assocno` int(4) unsigned NOT NULL ,
	`assoctype` tinyint(1) unsigned NOT NULL ,
	`name` varchar(32) NOT NULL ,
	`desc` varchar(128) NOT NULL ,
	`attribute` int(4) unsigned NOT NULL ,
	`alarm` int(4) unsigned NOT NULL ,
	`statistic` int(4) unsigned NOT NULL ,
	PRIMARY KEY (`channel`,`rtu`,`address`),
	CONSTRAINT `FK_tsoecfg_rtu` FOREIGN KEY (`channel`,`rtu`) REFERENCES `wlddb`.`rtu` (`channel`,`no`) ON DELETE CASCADE  ON UPDATE CASCADE,
	CONSTRAINT `FK_tsoecfg_station` FOREIGN KEY (`assocstation`) REFERENCES `wlddb`.`station` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 46: 协议表 ******/
CREATE TABLE if not exists `wlddb`.`protocol` (
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar (128) NOT NULL ,
	PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 47: 子协议表 ******/
CREATE TABLE if not exists `wlddb`.`subprotocol` (
	`protocol` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar (128) NOT NULL , 
	`standard` varchar (128) NOT NULL , 
	`parameters` TEXT ,
	PRIMARY KEY (`protocol`,`no`),
	CONSTRAINT `FK_subprotocol_protocol` FOREIGN KEY (`protocol`) REFERENCES `wlddb`.`protocol` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 48: 端口类别表 ******/
CREATE TABLE if not exists `wlddb`.`port` (
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar (128) NOT NULL ,
	PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 49: 子端口表 ******/
CREATE TABLE if not exists `wlddb`.`subport` (
	`port` tinyint(1) unsigned NOT NULL ,
	`no` tinyint(1) unsigned NOT NULL ,
	`name` varchar (128) NOT NULL , 
	`parameters` TEXT ,
	PRIMARY KEY (`port`,`no`),
	CONSTRAINT `FK_subport_port` FOREIGN KEY (`port`) REFERENCES `wlddb`.`port` (`no`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

-- --------------------------------------------------------
--
-- Table `cabinets`
-- 开关柜数据表

CREATE TABLE IF NOT EXISTS `wlddb`.`cabinet` (
  `cab_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cab_name` varchar(255) NOT NULL,
  `cab_iid` varchar(255) NOT NULL,
  `cab_path` varchar(255) NOT NULL,
  PRIMARY KEY (`cab_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Table `cab-points`
-- 开关柜相关控制点

CREATE TABLE IF NOT EXISTS `wlddb`.`cab_points` (
  `cp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cab_id` int(10) unsigned NOT NULL,
  `cp_iid` varchar(255) NOT NULL,
  `cp_type` varchar(255) NOT NULL,
  PRIMARY KEY (`cp_id`),
  CONSTRAINT `FK_cabpoints_cabinet` FOREIGN KEY (`cab_id`) REFERENCES `wlddb`.`cabinet` (`cab_id`) ON DELETE CASCADE  ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
--
-- Table `power`
-- 日电量数据表
CREATE TABLE if not exists `wlddb`.`power` (
	`rectime` datetime NOT NULL ,
	`channel` tinyint(1) unsigned NOT NULL ,
	`rtu` smallint(2) unsigned NOT NULL ,
	`type` tinyint(1) unsigned NOT NULL ,
	`value` real NOT NULL ,
	PRIMARY KEY (`rectime`, `channel`, `rtu`, `type`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

-- --------------------------------------------------------
--
-- Table `courts`
-- 台区总数据表
CREATE TABLE if not exists `wlddb`.`courts` (
	`channel` tinyint(1) unsigned NOT NULL ,
	`lines` tinyint(1) unsigned NOT NULL , -- 节能改造线路(条)
	`courts` tinyint(1) unsigned NOT NULL , -- 节能改造台区(个)
	`np_count` tinyint(1) unsigned NOT NULL , -- 0.4kV节能装置台数(台)
	`np_capacity` real NOT NULL , -- 0.4kV节能装置容量(kVar)
	`np_usecount` tinyint(1) unsigned NOT NULL , -- 0.4kV节能装置投入台数(台)
	`np_usecapacity` real NOT NULL , -- 0.4kV节能装置投入容量(kVar)
	PRIMARY KEY (`channel`)
) ENGINE=InnoDB DEFAULT CHARSET='utf8';

/****** 触发器 : RTU名称变化时 *******/
DROP TRIGGER IF EXISTS `wlddb`.updateRtuname;  
DELIMITER $$
CREATE TRIGGER `wlddb`.updateRtuname AFTER UPDATE ON `wlddb`.rtu FOR EACH ROW  
BEGIN  
	/*old,new都是代表当前操作的记录行，你把它当成表名，也行*/
	IF new.name!=old.name THEN   /*当表中名称发生变化时,执行 */ 
		UPDATE `wlddb`.yxcfg AS A SET A.name=replace(A.name,old.name,new.name) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.yccfg AS A SET A.name=replace(A.name,old.name,new.name) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.mccfg AS A SET A.name=replace(A.name,old.name,new.name) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.ykcfg AS A SET A.name=replace(A.name,old.name,new.name) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.ytcfg AS A SET A.name=replace(A.name,old.name,new.name) WHERE A.channel=old.channel AND A.rtu=old.no;  
	END IF;  
	IF new.`desc`!=old.`desc` THEN   /*当表中描述发生变化时,执行 */ 
		UPDATE `wlddb`.yxcfg AS A SET A.`desc`=replace(A.`desc`,old.`desc`,new.`desc`) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.yccfg AS A SET A.`desc`=replace(A.`desc`,old.`desc`,new.`desc`) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.mccfg AS A SET A.`desc`=replace(A.`desc`,old.`desc`,new.`desc`) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.ykcfg AS A SET A.`desc`=replace(A.`desc`,old.`desc`,new.`desc`) WHERE A.channel=old.channel AND A.rtu=old.no;  
		UPDATE `wlddb`.ytcfg AS A SET A.`desc`=replace(A.`desc`,old.`desc`,new.`desc`) WHERE A.channel=old.channel AND A.rtu=old.no;  
	END IF;  
END $$ 
DELIMITER ;

/****** 存储过程 : 判断表是否存在 ********/
DROP PROCEDURE IF EXISTS `wlddb`.hasTable;
DELIMITER $$
CREATE PROCEDURE `wlddb`.hasTable(IN tbname VARCHAR(32),OUT result INT) 
BEGIN
	SELECT COUNT(*) INTO result FROM information_schema.TABLES WHERE TABLE_NAME=tbname;
END $$
DELIMITER ;

/****** 存储过程 : 确认历史事件 ********/
DROP PROCEDURE IF EXISTS `wlddb`.confirmHis;
DELIMITER $$
CREATE PROCEDURE `wlddb`.confirmHis(IN Manual VARCHAR(32),IN Year INT) 
BEGIN
	DECLARE  fromDate,curdate,tmpDate datetime;
	DECLARE  tmTable,Man VARCHAR(32);
	SET @curdate = NOW();
	IF Year = 0 THEN
		SET @fromDate = makedate(year(@curdate),1);
	ELSE
		SET @fromDate = makedate(Year,1);
	END IF;	
	SET @Man = Manual;
	WHILE @fromDate < @curdate DO
		/* 确认电网事件 */
		SET @tmTable = DATE_FORMAT(@fromDate,"sysevent_%Y_%m");
		CALL hasTable(@tmTable,@has);
		IF @has > 0 THEN
			SET @pre = CONCAT(' UPDATE ' , @tmTable, ' SET acknman ="',@Man,'", ackntime ="',@curdate,'" WHERE acknman=""');
			PREPARE stmt FROM @pre;
			EXECUTE stmt ; 
		END IF;
		/* 确认SCADA事件 */
		SET @tmTable = DATE_FORMAT(@fromDate,"scadaevent_%Y_%m");
		CALL hasTable(@tmTable,@has);
		IF @has > 0 THEN
			SET @pre = CONCAT(' UPDATE ' , @tmTable, ' SET acknman ="',@Man,'", ackntime ="',@curdate,'" WHERE acknman=""');
			PREPARE stmt FROM @pre;
			EXECUTE stmt ; 
		END IF;
		/* 下一月 */
		SELECT @tmTable,@Man,@curdate;
		SET @fromDate = DATE_ADD(@fromDate,INTERVAL 1 MONTH);
	END WHILE;	
END $$
DELIMITER ;
