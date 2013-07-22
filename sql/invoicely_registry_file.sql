CREATE DATABASE  IF NOT EXISTS `invoicely` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `invoicely`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: invoicely
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `registry_file`
--

DROP TABLE IF EXISTS `registry_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files parsed to build the registry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registry_file`
--

LOCK TABLES `registry_file` WRITE;
/*!40000 ALTER TABLE `registry_file` DISABLE KEYS */;
INSERT INTO `registry_file` VALUES ('includes/actions.inc','f36b066681463c7dfe189e0430cb1a89bf66f7e228cbb53cdfcd93987193f759'),('includes/ajax.inc','8328ec7441a0c101c1b39ba8d415c1d951b400887d8b29d2831210ae207f86eb'),('includes/archiver.inc','bdbb21b712a62f6b913590b609fd17cd9f3c3b77c0d21f68e71a78427ed2e3e9'),('includes/authorize.inc','6d64d8c21aa01eb12fc29918732e4df6b871ed06e5d41373cb95c197ed661d13'),('includes/batch.inc','059da9e36e1f3717f27840aae73f10dea7d6c8daf16f6520401cc1ca3b4c0388'),('includes/batch.queue.inc','554b2e92e1dad0f7fd5a19cb8dff7e109f10fbe2441a5692d076338ec908de0f'),('includes/bootstrap.inc','08aa17d5148732c6294ad95c3ff1ecf223199cde61439ec5fdb1ca778e971c96'),('includes/cache-install.inc','e7ed123c5805703c84ad2cce9c1ca46b3ce8caeeea0d8ef39a3024a4ab95fa0e'),('includes/cache.inc','c9d3df7ff9807bb4421d66b4579c2ef5ca4d74954a8184bd04881d179f22ccb2'),('includes/common.inc','db5346629b64f46f3a89738fd688d6a8e9ba847edfbd14319a4d63c4bcdb7130'),('includes/database/database.inc','1597142a1fbd6fcff24f2bb92805a1c98b7bc36520cc68007bc7383effcaf890'),('includes/database/log.inc','9feb5a17ae2fabcf26a96d2a634ba73da501f7bcfc3599a693d916a6971d00d1'),('includes/database/mysql/database.inc','8d3a784845064385ccdce8a66860f3177d52207df83d9735c0d72c9703dd258e'),('includes/database/mysql/install.inc','6ae316941f771732fbbabed7e1d6b4cbb41b1f429dd097d04b3345aa15e461a0'),('includes/database/mysql/query.inc','7d9ea18a7ff04b7aab6210abbd0313cb53325c19a47ff8ed6c0e591c6e7149c2'),('includes/database/mysql/schema.inc','d8d3904ea9c23a526c2f2a7acc8ba870b31c378aac2eb53e2e41a73c6209c5bd'),('includes/database/pgsql/database.inc','56726100fd44f461a04886c590c9c472cc2b2a1b92eb26c7674bf3821a76bb64'),('includes/database/pgsql/install.inc','585b80c5bbd6f134bff60d06397f15154657a577d4da8d1b181858905f09dea5'),('includes/database/pgsql/query.inc','cb4c84f8f1ffc73098ed71137248dcd078a505a7530e60d979d74b3a3cdaa658'),('includes/database/pgsql/schema.inc','8fd647e4557522283caef63e528c6e403fc0751a46e94aac867a281af85eac27'),('includes/database/pgsql/select.inc','fd4bba7887c1dc6abc8f080fc3a76c01d92ea085434e355dc1ecb50d8743c22d'),('includes/database/prefetch.inc','b5b207a66a69ecb52ee4f4459af16a7b5eabedc87254245f37cc33bebb61c0fb'),('includes/database/query.inc','dad26c5d42eda178f8a858194a912fe5df2b7091bd038b23af26aee249166c76'),('includes/database/schema.inc','7eb7251f331109757173353263d1031493c1198ae17a165a6f5a03d3f14f93e7'),('includes/database/select.inc','1c74fa55c7721a704f5ef3389032604bf7a60fced15c40d844aee3e1cead7dc6'),('includes/database/sqlite/database.inc','ed2b9981794239cdad2cd04cf4bcdc896ad4d6b66179a4fa487b0d1ec2150a10'),('includes/database/sqlite/install.inc','381f3db8c59837d961978ba3097bb6443534ed1659fd713aa563963fa0c42cc5'),('includes/database/sqlite/query.inc','cd726af682495d8fe20283ddbc4d877536cad2df4a2df8afc2dc21be71a4eba8'),('includes/database/sqlite/schema.inc','238414785aa96dd27f10f48c961783f4d1091392beee8d0e7ca8ae774e917da2'),('includes/database/sqlite/select.inc','8d1c426dbd337733c206cce9f59a172546c6ed856d8ef3f1c7bef05a16f7bf68'),('includes/date.inc','18c047be64f201e16d189f1cc47ed9dcf0a145151b1ee187e90511b24e5d2b36'),('includes/entity.inc','93ed9b3f29fb2a75852af3b4cf03ce0edf3e9eddf19e4b82eeba8659d3d5bc78'),('includes/errors.inc','0923cf3303e0e976756d159c80c86bbe039109bd90a35a9aca18027c68abd0aa'),('includes/file.inc','4eeef6f486c843ff91e5eaa5ee435e66d89dd516c76b980c79d3c6595fe6bf2d'),('includes/file.mimetypes.inc','f88c967550576694b7a1ce2afd0f2f1bbc1a91d21cc2c20f86c44d39ff353867'),('includes/filetransfer/filetransfer.inc','fdea8ae48345ec91885ac48a9bc53daf87616271472bb7c29b7e3ce219b22034'),('includes/filetransfer/ftp.inc','589ebf4b8bd4a2973aa56a156ac1fa83b6c73e703391361fb573167670e0d832'),('includes/filetransfer/local.inc','7cbfdb46abbdf539640db27e66fb30e5265128f31002bd0dfc3af16ae01a9492'),('includes/filetransfer/ssh.inc','002e24a24cac133d12728bd3843868ce378681237d7fad420761af84e6efe5ad'),('includes/form.inc','5ab6ebd03a6852acd532fb3e06ce4d90c983246ba1f9506437fa19566729893d'),('includes/graph.inc','8e0e313a8bb33488f371df11fc1b58d7cf80099b886cd1003871e2c896d1b536'),('includes/image.inc','bcdc7e1599c02227502b9d0fe36eeb2b529b130a392bc709eb737647bd361826'),('includes/install.core.inc','2a036b695c555d7339115099e0b7b06bf7fbafbaad6d7cc143e49969ff96c394'),('includes/install.inc','f4e81c6b55769e0b5cc66565ade31d1f805faf11f73ca605bd3506a78ec1b7ee'),('includes/iso.inc','27730e6175b79c3b5d494582a124f6210289faa03bef099e16347bb914464c66'),('includes/json-encode.inc','02a822a652d00151f79db9aa9e171c310b69b93a12f549bc2ce00533a8efa14e'),('includes/language.inc','77ef0c210a8f01d4ad24b13b147db3db0dcef801dbae8b644124cedd562a8a57'),('includes/locale.inc','8cc571c114587f2b30e4e24db17e97e51e81f9cc395fa01f348aba12cee8523e'),('includes/lock.inc','daa62e95528f6b986b85680b600a896452bf2ce6f38921242857dcc5a3460a1b'),('includes/mail.inc','8b37b30d82941010eacf8f435abbf9cb5b6cfc2710c3446a5037192ae14d68bf'),('includes/menu.inc','1b6ad3883f405b887032d8b2e58e6e3870a37f6963854275e0c0d9e1b12a624c'),('includes/module.inc','09dd0e483fd1c5569183ff0663543163d5262ec5eb9c4551c2214fd7599f386b'),('includes/pager.inc','6f9494b85c07a2cc3be4e54aff2d2757485238c476a7da084d25bde1d88be6d8'),('includes/password.inc','7550ac434a929562a3380e82c546afbf9163598b22f2351f0e7d3f19567fb6c9'),('includes/path.inc','d20d3efabcb752fcafafc887fc0f09704d87000742302f95cf58e62333d05279'),('includes/registry.inc','4ffb8c9c8c179c1417ff01790f339edf50b5f7cc0c8bb976eef6858cc71e9bc8'),('includes/session.inc','65764101f3746e25210e8a91a9c058218c83c7bf444051ba339c412a2d2bff63'),('includes/stream_wrappers.inc','b04e31585a9a397b0edf7b3586050cbd4b1f631e283296e1c93f4356662faeb9'),('includes/tablesort.inc','4cb2a5a2d41b2a204a13f59085096e3f64237d32639ea5d30752905099bc7540'),('includes/theme.inc','f1a3045e917b454f23842e048f8753c7dc1e97bf8999bb8eeb4f72cee3cc7553'),('includes/theme.maintenance.inc','39f068b3eee4d10a90d6aa3c86db587b6d25844c2919d418d34d133cfe330f5a'),('includes/token.inc','5e7898cd78689e2c291ed3cd8f41c032075656896f1db57e49217aac19ae0428'),('includes/unicode.entities.inc','2b858138596d961fbaa4c6e3986e409921df7f76b6ee1b109c4af5970f1e0f54'),('includes/unicode.inc','518ad21bd4f43814277d67f76ff8eb2b99bd1be4caa5e02b6e5f06cf65d84eb0'),('includes/update.inc','177ce24362efc7f28b384c90a09c3e485396bbd18c3721d4b21e57dd1733bd92'),('includes/updater.inc','d2da0e74ed86e93c209f16069f3d32e1a134ceb6c06a0044f78e841a1b54e380'),('includes/utility.inc','3458fd2b55ab004dd0cc529b8e58af12916e8bd36653b072bdd820b26b907ed5'),('includes/xmlrpc.inc','c5b6ea78adeb135373d11aeaaea057d9fa8995faa4e8c0fec9b7c647f15cc4e0'),('includes/xmlrpcs.inc','79dc6e9882f4c506123d7dd8e228a61e22c46979c3aab21a5b1afa315ef6639c'),('modules/block/block.test','7aefd627d62b44f9c1e9ee3aa9da6c6e2a7cfce01c6613e8bd24c0b9c464dd73'),('modules/color/color.test','013806279bd47ceb2f82ca854b57f880ba21058f7a2592c422afae881a7f5d15'),('modules/comment/comment.module','f7d4b93359bf3d6381204a0f63e6574ece4f45656d53d126f04067891d1d64b1'),('modules/comment/comment.test','5404277c15b1306a1ad5eca6703f7d2003567fea6085ffd2b1c3d65896acdf21'),('modules/contextual/contextual.test','023dafa199bd325ecc55a17b2a3db46ac0a31e23059f701f789f3bc42427ba0b'),('modules/dashboard/dashboard.test','270378b5c8ed0e7d0e00fbc62e617813c6dec1d79396229786942bf9fb738e16'),('modules/dblog/dblog.test','6f5da69432a186df5086f9a588c9c18ad85bb3034bccc3860423d9e854c0d864'),('modules/field/field.attach.inc','25d05fb8ab30ba559051ca2034ea7e61bd1326cacb12dfeb865e90e2ffd147e6'),('modules/field/field.info.class.inc','c2e4bc67ef51e4956c913be772914b1b2625aa5066ab67c74baf6404ed538174'),('modules/field/field.module','d2d9b9b324c256ca11e117f84afd9722c5271887a57497e2dd1f339adae7c12d'),('modules/field/modules/field_sql_storage/field_sql_storage.test','8ede9843d771e307dfd3d7e7562976b07e0e0a9310a5cf409413581f199c897f'),('modules/field/modules/list/tests/list.test','9f366469763beb3fe0571d66318bac6df293fd15f4eb5cfe4850b9fb9a509f38'),('modules/field/modules/number/number.test','cb55fbc3a1ceed154af673af727b4c5ee6ac2e7dc9d4e1cbc33f3f8e2269146c'),('modules/field/modules/options/options.test','8c6dd464fdb5cca90b0260bcfa5f56941b4b28edd879b23a795f0442f5368d4c'),('modules/field/modules/text/text.test','9d74c6d039f55dd7d6447a59186da8d48bf20617bfe58424612798f649797586'),('modules/field/tests/field.test','f07f370dee1b3bf645c548a4542007b4653bf6a40f28888e180cbc408e62c569'),('modules/field_ui/field_ui.test','2c344c7ccd9d41156f3e4a16f1cad06d2c3f4d702b47452bf6f5260efe2abbeb'),('modules/file/tests/file.test','802532f0032f1740592379d7bd9c93f8c453f68b93f11bf0143bd5de648659c8'),('modules/filter/filter.test','50f74d9c07663cbf610559f7123709488c36dab18e4320635ca4bcf9a9891640'),('modules/help/help.test','c6f03ece30548a6a345afcfac920d85afc418596a19dc4cf43f994391c5050d9'),('modules/image/image.test','03ab83fcfd3c0f8397ea2273847a13bb5661efd4fc68af55f85bb32e41f37dc3'),('modules/menu/menu.test','b93a1f408a1b51563c4c761475366573fc481d4ace3496fce226a73bdf468e8c'),('modules/node/node.module','72f72261cac4ca7880f4384791d7aee1e40491a0c1978946c3fa4d3bb64a9433'),('modules/node/node.test','4757ff01c1209a86393a2370234f0af3fc708d50b5a012e7eb9763336bc747bf'),('modules/path/path.test','c05b26db575e93a73f2e4c8eaa6091b4fe8fc805f59620c2f7e1276cc206ba9d'),('modules/rdf/rdf.test','d586b165925f65c98adcc0ad1eb24b05e2803ea92f1acca351b3ce2dc8932f43'),('modules/search/search.extender.inc','fea036745113dca3fea52ba956af605c4789f4acfa2ab1650a5843c6e173d7fe'),('modules/search/search.test','1fe9dfc982953f42f67d7eee9a855e7248373067ba55cfff001d8a750b83e695'),('modules/shortcut/shortcut.test','9d0f81602c9a58b60ad3ae4b996e5a431016014151540769e9594711232575e4'),('modules/system/system.archiver.inc','faa849f3e646a910ab82fd6c8bbf0a4e6b8c60725d7ba81ec0556bd716616cd1'),('modules/system/system.mail.inc','3c2c06b55bded609e72add89db41af3bb405d42b9553793acba5fe51be8861d8'),('modules/system/system.queue.inc','caf4feda51bdf7ad62cf782bc23274d367154e51897f2732f07bd06982d85ab1'),('modules/system/system.tar.inc','8a31d91f7b3cd7eac25b3fa46e1ed9a8527c39718ba76c3f8c0bbbeaa3aa4086'),('modules/system/system.test','1577ba238919ba208902f807cd35ef667616a064ecf2b611b0ccb39cba105450'),('modules/system/system.updater.inc','338cf14cb691ba16ee551b3b9e0fa4f579a2f25c964130658236726d17563b6a'),('modules/taxonomy/taxonomy.module','389f4e8e040e99c02b4795983e7b44ffb00e766d2a4b3fa06aca98621073f6b2'),('modules/taxonomy/taxonomy.test','2b1599532f0b6bd0e324b55b687fe9eac9c6465376fd8317652e7540ee0a3677'),('modules/update/update.test','f0c11dfc51716e9dd5980428a416cdead4246435e1dceaff75ce52c5f381d617'),('modules/user/user.module','40a0d8e89d4de14cee5283a21eb541c0143ab86170a093cfc6ecf15c9fe534ea'),('modules/user/user.test','0cdf12305cce4a65da5be1155925ba2a83b6f5363d6c192f0cfec2985e835e20');
/*!40000 ALTER TABLE `registry_file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-07-22 12:16:03