-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: Conseil_voyage
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `Access`
--

DROP TABLE IF EXISTS `Access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_monument` smallint(5) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `information` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_monument` (`id_monument`),
  CONSTRAINT `Access_ibfk_1` FOREIGN KEY (`id_monument`) REFERENCES `Monument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access`
--

LOCK TABLES `Access` WRITE;
/*!40000 ALTER TABLE `Access` DISABLE KEYS */;
INSERT INTO `Access` VALUES (1,1,'Metro','Bir-Hakeim(line:6)'),(2,1,'RER','Champ De Mars-Tour Eiffel (RER C)'),(3,1,'Bus','Tour Eiffel (line:82,42,30'),(4,2,'Metro','Palais-Royale (line: 1,7'),(5,2,'RER','Musee d Orsay (have to cross La Seine) RER C  '),(6,2,'Bus','Musee Du Louvre(line:95,69,68,39,27)'),(7,3,'metro','Chatelet (line: 7,11,14)'),(8,3,'RER','Saint-Michel-Notre-Dame (RER B and RER C'),(9,3,'Bus','Cité-Palais de Justice (line 21,38,47,85,96)'),(10,4,'RER','Versailles Rive-Gauche (RER C)'),(11,4,'Bus','Chateau de Versailles (line: 171)'),(12,5,'metro','Charles De Gaules Etoile (line:1,2,6)'),(13,5,'RER','Charles De Gaules Etoile (RER A)'),(14,5,'Bus','Charles De Gaules Etoile (line:22,30,31,52,73,92)'),(15,6,'Car','A84 CAEN-Rennes then there is a parking and take the shuffle'),(16,6,'Train','station Pontorson, then there is a direct shuttle bus from there to the island '),(17,7,'metro','Charles-De-Gaulle-Etoile(lines 1,2,6)'),(18,7,'RER','Charles-De-Gaulle-Etoile(RER A)'),(19,7,'Bus','Charles-De-Gaulle-Etoile(lines 22,30,31,52,73,92)'),(20,8,'metro','Pigale(lines 12,2), Anvers(line 2)'),(21,8,'Funiculaire','Cable car'),(22,8,'Bus','Norvins (Montmartrobus)'),(23,9,'Car',''),(24,9,'Train','Nice, Marseille, Montpelier train stations'),(25,9,'Plane','Nice, Marseille, Saint tropez, Perpignan Airports'),(26,10,'metro','Danfert-Rochereau(line 4,6)'),(27,10,'RER','Danfert-Rochereau (RER B'),(28,11,'metro','Charles-De-Gaulle-Etoile(lines 1,2,6)'),(29,11,'RER','Charles-De-Gaulle-Etoile(RER A)'),(30,11,'Bus','Charles-De-Gaulle-Etoile(lines 22,30,31,52,73,92)'),(31,12,'metro','Solférino(line 12)'),(32,12,'RER','Solferino(RER C)'),(33,12,'Bus',' Musée d Orsay (line 63, 68, 69, 73, 83, 84, 87, 94)'),(34,13,'metro','Alma-Marceau(line 9), Franklin Roosevelt(line 1)'),(35,13,'Bus',' Franklin Roosevelt(lines 28, 42, 49, 63, 72)'),(36,13,'metro',' Rambuteau (line 11), Hôtel de Ville (lines 1 and 11), Châtelet (lines 1, 4, 7, 11 and 14)'),(37,13,'RER','Châtelet Les Halles (lines A, B, D)'),(38,13,'BUS','lines 29, 38, 47, 75'),(39,14,'metro','Cardinal Lemoine (line 10)'),(40,14,'RER','Luxembourg (line B'),(41,14,'BUS','lines 21, 27, 38, 82, 84, 85, 89'),(42,15,'metro','Opera (lines 3, 7 and 8'),(43,15,'RER','Auber (line A)'),(44,15,'BUS','lines 20, 21, 22, 27, 29, 42, 52, 53, 66, 68, 81 and 95'),(45,16,'metro','Invalides (lines 8 and 13), La Tour-Maubourg (line 8), Varenne (line 13)'),(46,16,'RER','Invalides (line C)'),(47,16,'BUS','lines 28, 63, 69, 82, 83, 92, 93'),(48,17,'car','A4 exit 14 Val d Europe/Parc Disneyland'),(49,17,'RER','Marne-la-Vallée/Chessy (line A)'),(50,18,'Car','A1 to Lille, exit Parc Asterix'),(51,19,'metro','Concorde (lines 1, 8 and 12)'),(52,19,'BUS','lines 24, 42, 52, 72, 73, 84, 94');
/*!40000 ALTER TABLE `Access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Affluence`
--

DROP TABLE IF EXISTS `Affluence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affluence` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_monument` smallint(5) unsigned NOT NULL,
  `times` varchar(130) DEFAULT NULL,
  `affluence_level` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_monument` (`id_monument`),
  CONSTRAINT `Affluence_ibfk_1` FOREIGN KEY (`id_monument`) REFERENCES `Monument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Affluence`
--

LOCK TABLES `Affluence` WRITE;
/*!40000 ALTER TABLE `Affluence` DISABLE KEYS */;
INSERT INTO `Affluence` VALUES (1,1,'monday, tuesday, wednesday: all day, thursday, friday, saturday, sunday 9am to 11am and 11pm to close','low'),(2,1,'thursday, friday, sunday: 11am to 11pm','medium'),(3,1,'saturday: 11am to 11pm','high'),(4,2,'every day: 9am to 10am','low'),(5,2,'friday: 10am to 11am, wednesday, friday: 8pm to 9pm ','medium'),(6,2,'wednesday:10am to 11am, friday, wednesday: 11am to 7pm, monday,thursday,saturday,sunday: 10am to 6pm','high'),(7,3,'no time','Close'),(8,4,'every day: 9am to 10am','low'),(9,4,'every day 10am to 6pm','high'),(10,5,'monday, tuesday, wednesday, thursday, friday:11am to 2:30pm, every day:8pm to 10:30pm','low'),(11,5,'every day:10am to 11am and 2:30pm to 8pm, saturday and sunday: 11am to 2:30pm','medium'),(12,6,'every day: 9am to 10am','low'),(13,6,'every day:10am to 11am and 5pm to 6pm','medium'),(14,6,'every day: 11am to 5pm','high'),(15,7,'Monday to friday from 23:30 to 8 in the morning','low'),(16,7,'Monday to friday from 8 am to 10 am ','Medium'),(17,7,'Monday to friday: from 10 am to 23:30 and the week ends','High'),(18,8,'Monday to saturday : from 6 am to 8 am','low'),(19,8,'monday to saturday: from 8 am to 22:30 and sunday the whole day','High'),(20,9,'Winter','low'),(21,9,'Summer','High'),(22,10,'wendesday, thursday, friday: from 3 pm to 8:30','low'),(23,10,'tuesday: from 3pm to 8:30,wendesday, thursday, friday: from 10am to 3pm, saturday and sunday: from 5pm to 8:30','Medium'),(24,10,'Tuesday : from 10 am to 3 pm, Saturday and sunday: from 10 am to 5 pm','High'),(25,11,'Thursday: starting from 6 pm','low'),(26,11,'Wednesday and Friday','Medium'),(27,11,'Tuesday and Sunday','High'),(28,12,'Spring and Autumn','low'),(29,12,'Winter','Medium'),(30,12,'Summer: Whole week','High'),(31,13,'monday, wednesday, thrusday, friday : 3pm to 9pm, saturday and sunday : 7pm to 9pm','low'),(32,13,'monday, wednesday, thursday, friday : 1pm to 3pm, saturday and sunday : 5pm to 7pm','medium'),(33,13,'monday, wednesday, thursday, friday : 11am to 1pm, saturday and sunday : 11am to 5pm','high'),(34,14,'monday, tuesday, wednesday, thursday, friday : 10am to 2pm, saturday and sunday : 10am to 11am','low'),(35,14,'monday, tuesday, wednesday, thursday, friday : 2pm to 6pm, saturday and sunday : 11am to 6pm','medium'),(36,15,'monday, tuesday, wednesday, thursday, friday : 10am to 2pm, saturday and sunday : 10am to 11am','low'),(37,15,'monday, tuesday, wednesday, thursday, friday : 2pm to 5pm, saturday and sunday : 11am to 5pm','high'),(38,16,'monday, wednesday, thursday, friday, saturday : 10am to 6pm','low'),(39,16,'tuesday and sunday : 12am to 3pm','medium'),(40,16,'tuesday and sunday : 10am to 12am and 3pm to 6pm','high'),(41,17,'monday, tuesday, wednesday, thursday, friday','high'),(42,17,'saturday and sunday','very high'),(43,18,'monday, tuesday, wednesday, thursday, friday','high'),(44,18,'saturday and sunday','very high'),(45,19,'wednesday, saturday : 9am to 10am, thursday, friday : 9am to 12am','low'),(46,19,'monday, sunday : 9am to 10am, wednesday, saturday : 10am to 2pm, thursday, friday : 12am to 6pm','medium'),(47,19,'monday : 10am to 2pm, wednesday, saturday : 2pm to 6pm, sunday : 10am to 12am','high'),(48,19,'monday : 2pm to 6pm, sunday : 12am to 6pm','very high');
/*!40000 ALTER TABLE `Affluence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Lucie Drevet'),(2,'Thomas Limnavong'),(3,'Adam Dahmoul'),(4,'Remi Pignol'),(5,'Killian Bouyssonnade');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Monument`
--

DROP TABLE IF EXISTS `Monument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Monument` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `times` varchar(110) DEFAULT NULL,
  `prices` varchar(110) DEFAULT NULL,
  `visiting_times` varchar(50) DEFAULT NULL,
  `type_place` varchar(20) DEFAULT NULL,
  `sport_level` varchar(40) DEFAULT NULL,
  `style` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Monument`
--

LOCK TABLES `Monument` WRITE;
/*!40000 ALTER TABLE `Monument` DISABLE KEYS */;
INSERT INTO `Monument` VALUES (1,'Eiffel Tower','The Eiffel tower is a wrought-iron lattice tower on the Champ de Mars in Paris','Paris','Champ de Mars, 5 avenue anatole France, 75007 Paris, France','every day from 9am to 12:45 am','2nd floor by lift 16,30euros, top of the Eiffel tower by lift 25,50 euros and 2nd floor by walk 10,20 euros','30 minutes','monument','elevator easy; walk medium','modern art'),(2,'Louvre Museum','The Louvre is the world largestart museum and a historic monument in Paris','Paris','Rue de Rivoli,75001 Paris, France','monday-thursday-saturday-sunday from 9 am to 6pm, wednesday-friday from 9am to 9:45pm and close on tuesday','17 euros','at least 2 hours','museum','easy','French renaissance'),(3,'Notre Dame Cathedral','Notre-Dame de Paris, referred to simply as Notre-Dame, is a medieval Catholic cathedral on the Île de la Cité in the 4th arrondissement of Paris.','Paris','6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France','close for the moment','Cathedrale: free and Tower: 8 euros','30 min','monument','easy','Gothic architecture'),(4,'Palace of Versailles','The Palace of Versailles was the principal royal residence of France from 1682, under Louis XIV, until the start of the French Revolution in 1789, under Louis XVI.','Versailles',' Place d Armes, 78000 Versailles, France','every day from 9am to 5:30pm close on monday','20euros','half a day','castle/monument','easy','baroque architecture'),(5,'The Arc de Triomphe','The Arc de Triomphe is one of the most famous monuments in Paris, France, standing at the western end of the Champs-Élysées at the centre of Place Charles de Gaulle. It honours those who fought and died for France in the French Revolutionary and Napoleonic Wars, with the names of all French victories and generals inscribed on its inner and outer surfaces.','Paris','Place Charles de Gaulle - 75008 Paris','from april 1st to september 30th : every day, 10am-11pm ; october 1st to march 31st : every day, 10am-10:30pm.','12 euros','30min','monument','easy','Néo-classicisme'),(6,'Abbaye du Mont Saint-Michel','The abbey is an essential part of the structural composition of the town the feudal society constructed. On top, God, the abbey, and monastery; below this, the Great halls, then stores and housing, and at the bottom (outside the walls), fishermens and farmers housing. The abbey has been protected as a French monument historique since 1862.[1] Since 1979, the site as a whole – i.e., the Mont Saint-Michel and its bay – has been a UNESCO world heritage site and is managed by the Centre des monuments nationaux.','Le Mont-SaintMichel','50170 Le Mont Saint-Miche, France','everyday from 9:30am to 6pm ','13 euros','1 to 2 hours','monument/abbey','medium','Gothic and Romane'),(7,'Champs-Elysées','The Avenue des Champs-Élysées is an avenue in the 8th arrondissement of Paris, France, 1.9 kilometers (1.2 mi) long and 70 meters (230 ft) wide','Paris','Champs-Élysées. Faubourg du Roule','Always open but most of the shops close at 22:00','Free','2 to 5 hours depending on if you stop at the shops','Alley','Minimum','Hausmann'),(8,'Sacré Coeur','The Basilica of the Sacred Heart of Paris, commonly known as Sacré-Cœur Basilica and often simply Sacré-Cœur, is a Roman Catholic church and minor basilica, dedicated to the Sacred Heart of Jesus.','Paris','35 Rue du Chevalier de la Barre, 75018 Paris, France','06:00 --10:30','Free','1 hour and 30 minutes','Church','Medium level for the stairs','Roman-Byzantine style'),(9,'Côte d’Azur','The French Riviera (known in French as the Côte d Azur literal translation \"Coast of Azure\") is the Mediterranean coastline of the southeast corner of France.\n','From Toulon to Menton at the France-Italy border','South of France','Always open','Free','Few days','Coast','Easy to hard depending on where you go.','Landscape'),(10,'Catacombs','The Catacombs of Paris are underground ossuaries which hold the remains of more than six million people in a small part of a tunnel network built to consolidate Paris ancient stone quarries.','Paris','1 Avenue du Colonel Henri Rol-Tanguy, 75014 Paris, France','10 :00 -- 20 :30','11 to 17 euros depending on your age','2 hours','Uncommon place/Cave','Medium (Long walk)','Historical vestige'),(11,'Orsay Museum','The Musée d Orsay is a museum. It is housed in the former Gare d Orsay, a Beaux-Arts railway station built between 1898 and 1900. ','Paris','1 Rue de la Légion d Honneur, 75007 Paris, France','9 :30 —21 :30','6 to 14 euros depending on your age','3 hours','Museum','Easy','Fine arts'),(12,'Bateau-Mouche','Bateaux Mouches are open excursion boats that provide visitors to Paris, France, with a view of the city from along the river Seine.','Paris','Port de la Conférence, 75008 Paris, France','10 :00 – 22 :30','6 to 14 euros depending on your age','2 hours','Boat','Easy','Folk ballad'),(13,'Le Centre Pompidou','The Georges-Pompidou National Centre of Art and Culture is a polycultural institution created by the will of President Georges Pompidou, a great lover of modern art, to create in the heart of Paris an original cultural institution entirely dedicated to modern and contemporary creation where the visual arts would share with books, design, music and cinema','Paris','Place Georges-Pompidou','Every day from 11am to 9pm except Tuesday and May 1st','14$','1h-2h','museum','easy','modern arts'),(14,'Le Panthéon','The Pantheon is a neo-classical monument located in the 5th arrondissement of Paris. In the heart of the Latin Quarter, on the Sainte-Geneviève mountain, it is in the centre of Place du Panthéon','Paris','28 place du Panthéon','Every day from 10am to 6pm','9$','1h','Church','easy','neo-classicism'),(15,'L Opéra Garnier','Opéra Garniera is a national theatre with a lyrical and choreographic vocation and a major part of the heritage of the 9th arrondissement of Paris and the capital.','Paris','Place de l Opéra','Every day from 10am to 5pm','10$','1h30-2h','Opera','easy','neo-baroque'),(16,'Les Invalides','The Hôtel des Invalides is a Parisian monument whose construction was ordered by Louis XIV by the royal edict of February 24, 16702, to house the invalids of his armies.','Paris','128 rue de Grenelle','Every day from 10am to 6pm','12$','1h-2h','museum','easy','Classical architecture'),(17,'Disneyland','Disneyland Paris is a 22.30 km2 tourist and urban complex located thirty-two kilometers east of Paris. The resort includes two theme parks – Disneyland Park and Walt Disney Studios','Marne-la-Vallée',' Boulevard de Parc, 77700 Coupvray','Every day from 10am to 6pm','56$','all day','theme park','easy','magic'),(18,'Parc Astérix','The Asterix Park is a tourist complex including a theme park.  The theme park is dedicated to the comic book universe of Uderzo and Goscinny: Asterix.','Plailly','60128 Plailly','Every day from 10am to 6pm, closed between 4th of november and 5th of april','51$','all day','theme park','easy','fun'),(19,'Le Musée de l Orangerie','The National Museum of the Orangerie is a museum of impressionist and postimpressionist paintings located in the Tuileries Garden','Paris','Jardin des Tuileries','Every day from 9am to 6pm except tuesday','9$','1h-2h','museum','easy','impressionism');
/*!40000 ALTER TABLE `Monument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedule` (
  `id_client` smallint(5) unsigned NOT NULL,
  `id_monument` smallint(5) unsigned NOT NULL,
  `date_from` timestamp NULL DEFAULT NULL,
  `date_to` timestamp NULL DEFAULT NULL,
  KEY `id_monument` (`id_monument`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `Schedule_ibfk_1` FOREIGN KEY (`id_monument`) REFERENCES `Monument` (`id`),
  CONSTRAINT `Schedule_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `Customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28 16:23:07
