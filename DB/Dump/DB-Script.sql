DROP DATABASE IF EXISTS `Conseil_voyage`;
CREATE DATABASE Conseil_voyage CHARACTER SET 'utf8mb4';

use Conseil_voyage;

CREATE TABLE Monument(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    description TEXT,
    city VARCHAR(50),
    address VARCHAR(70),
    times VARCHAR(110),
    prices VARCHAR(110),
    visiting_times VARCHAR(50),
    type_place VARCHAR(20),
    sport_level VARCHAR(40),
    style VARCHAR(25),
    PRIMARY KEY (id)
)
ENGINE=INNODB;

CREATE TABLE Access(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_monument SMALLINT UNSIGNED NOT NULL,
    type VARCHAR(15) NOT NULL,
    information VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (id_monument) REFERENCES Monument(id)
)
ENGINE=INNODB;

CREATE TABLE Affluence(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_monument SMALLINT UNSIGNED NOT NULL,
    times VARCHAR(130),
    affluence_level VARCHAR(10),
    PRIMARY KEY (id),
    FOREIGN KEY (id_monument) REFERENCES Monument(id)
)
ENGINE=INNODB;

CREATE TABLE Customer(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(20),
    PRIMARY KEY (id)
)
ENGINE=INNODB;

CREATE TABLE Schedule(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_client SMALLINT UNSIGNED NOT NULL ,
    id_monument SMALLINT UNSIGNED NOT NULL,
    date_from TIMESTAMP NULL DEFAULT NULL,
    date_to TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_monument) REFERENCES Monument(id),
    FOREIGN KEY (id_client) REFERENCES Customer(id)
)
ENGINE=INNODB;

CREATE TABLE Image(
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_monument SMALLINT UNSIGNED NOT NULL,
    url_image varchar(256),
    PRIMARY KEY (id),
    FOREIGN KEY (id_monument) REFERENCES Monument(id)
)
ENGINE=INNODB;

INSERT INTO Customer(username)VALUES
('Lucie Drevet'),
('Thomas Limnavong'),
('Adam Dahmoul'),
('Remi Pignol'),
('Killian Bouyssonnade');

-- INSERT INTO schedule(id_client,times,id_monument)VALUES
-- (1,'Monday 9am to 11am',1),
-- (1,'Monday 2:30pm to 5pm',7),
-- (1,'Monday5pm to 5:30pm',5),
-- (1,'Tuesday 9am to 12pm',4),
-- (1,'Tuesday 4pm to 7pm',13),
-- (1,'Wednesday10am to 12pm',11),
-- (1,'Wednesday 3pm to 5pm',10),
-- (2,'Thursday all day long',17),
-- (2,'Friday 3pm to 5pm',1),
-- (3,'sunday all day',6),
-- (3,'Monday 10am to 1pm',2),
-- (4,'Monday: 8am' ,12),
-- (4,'Monday: 10am' ,7),
-- (4,'Monday: 5pm' ,11),
-- (4,'Tuesday: 8am' ,18),
-- (4,'From Wednesday to Saturday',9),
-- (5,'Friday: 8am' ,10),
-- (5,'Friday: 2pm' ,8),
-- (5,'Saturday: 11am' ,4),
-- (5,'Sunday: 9am' ,16),
-- (5,'Sunday: 11am' ,18),
-- (5,'Sunday: 3pm' ,13),
-- (5,'Sunday: 6pm' ,14);

INSERT INTO Monument (name, description, city, address, times, prices, visiting_times, type_place, sport_level, style) VALUES
('Eiffel Tower','The Eiffel tower is a wrought-iron lattice tower on the Champ de Mars in Paris'
,'Paris','Champ de Mars, 5 avenue anatole France, 75007 Paris, France','every day from 9am to 12:45 am','2nd floor by lift 16,30euros, top of the Eiffel tower by lift 25,50 euros and 2nd floor by walk 10,20 euros','30 minutes','monument','elevator easy; walk medium','modern art'),
('Louvre Museum','The Louvre is the world largestart museum and a historic monument in Paris'
,'Paris','Rue de Rivoli,75001 Paris, France','monday-thursday-saturday-sunday from 9 am to 6pm, wednesday-friday from 9am to 9:45pm and close on tuesday','17 euros','at least 2 hours','museum','easy','French renaissance' ),
('Notre Dame Cathedral','Notre-Dame de Paris, referred to simply as Notre-Dame, is a medieval Catholic cathedral on the Île de la Cité in the 4th arrondissement of Paris.'
,'Paris','6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France','close for the moment','Cathedrale: free and Tower: 8 euros','30 min','monument','easy','Gothic architecture'),
('Palace of Versailles','The Palace of Versailles was the principal royal residence of France from 1682, under Louis XIV, until the start of the French Revolution in 1789, under Louis XVI.'
,'Versailles',' Place d Armes, 78000 Versailles, France','every day from 9am to 5:30pm close on monday','20euros','half a day','castle/monument','easy','baroque architecture'),
('The Arc de Triomphe','The Arc de Triomphe is one of the most famous monuments in Paris, France, standing at the western end of the Champs-Élysées at the centre of Place Charles de Gaulle. It honours those who fought and died for France in the French Revolutionary and Napoleonic Wars, with the names of all French victories and generals inscribed on its inner and outer surfaces.'
,'Paris','Place Charles de Gaulle - 75008 Paris','from april 1st to september 30th : every day, 10am-11pm ; october 1st to march 31st : every day, 10am-10:30pm.','12 euros','30min','monument','easy','Néo-classicisme'),
('Abbaye du Mont Saint-Michel','The abbey is an essential part of the structural composition of the town the feudal society constructed. On top, God, the abbey, and monastery; below this, the Great halls, then stores and housing, and at the bottom (outside the walls), fishermens and farmers housing. The abbey has been protected as a French monument historique since 1862.[1] Since 1979, the site as a whole – i.e., the Mont Saint-Michel and its bay – has been a UNESCO world heritage site and is managed by the Centre des monuments nationaux.'
,'Le Mont-SaintMichel','50170 Le Mont Saint-Miche, France','everyday from 9:30am to 6pm ','13 euros','1 to 2 hours','monument/abbey','medium','Gothic and Romane'),
('Champs-Elysées','The Avenue des Champs-Élysées is an avenue in the 8th arrondissement of Paris, France, 1.9 kilometers (1.2 mi) long and 70 meters (230 ft) wide'
,'Paris','Champs-Élysées. Faubourg du Roule','Always open but most of the shops close at 22:00','Free', '2 to 5 hours depending on if you stop at the shops','Alley','Minimum','Hausmann'),
('Sacré Coeur','The Basilica of the Sacred Heart of Paris, commonly known as Sacré-Cœur Basilica and often simply Sacré-Cœur, is a Roman Catholic church and minor basilica, dedicated to the Sacred Heart of Jesus.'
,'Paris','35 Rue du Chevalier de la Barre, 75018 Paris, France','06:00 --10:30','Free','1 hour and 30 minutes','Church','Medium level for the stairs','Roman-Byzantine style'),
('Côte d’Azur','The French Riviera (known in French as the Côte d Azur literal translation "Coast of Azure") is the Mediterranean coastline of the southeast corner of France.
','From Toulon to Menton at the France-Italy border','South of France','Always open','Free','Few days','Coast','Easy to hard depending on where you go.','Landscape'),
('Catacombs','The Catacombs of Paris are underground ossuaries which hold the remains of more than six million people in a small part of a tunnel network built to consolidate Paris ancient stone quarries.'
,'Paris','1 Avenue du Colonel Henri Rol-Tanguy, 75014 Paris, France','10 :00 -- 20 :30','11 to 17 euros depending on your age','2 hours','Uncommon place/Cave','Medium (Long walk)','Historical vestige'),
('Orsay Museum','The Musée d Orsay is a museum. It is housed in the former Gare d Orsay, a Beaux-Arts railway station built between 1898 and 1900. '
,'Paris','1 Rue de la Légion d Honneur, 75007 Paris, France','9 :30 —21 :30','6 to 14 euros depending on your age','3 hours','Museum','Easy','Fine arts'),
('Bateau-Mouche','Bateaux Mouches are open excursion boats that provide visitors to Paris, France, with a view of the city from along the river Seine.'
,'Paris','Port de la Conférence, 75008 Paris, France','10 :00 – 22 :30','6 to 14 euros depending on your age','2 hours','Boat','Easy','Folk ballad'),
('Le Centre Pompidou', 'The Georges-Pompidou National Centre of Art and Culture is a polycultural institution created by the will of President Georges Pompidou, a great lover of modern art, to create in the heart of Paris an original cultural institution entirely dedicated to modern and contemporary creation where the visual arts would share with books, design, music and cinema'
, 'Paris','Place Georges-Pompidou','Every day from 11am to 9pm except Tuesday and May 1st','14$','1h-2h','museum','easy','modern arts'),
('Le Panthéon', 'The Pantheon is a neo-classical monument located in the 5th arrondissement of Paris. In the heart of the Latin Quarter, on the Sainte-Geneviève mountain, it is in the centre of Place du Panthéon'
, 'Paris', '28 place du Panthéon','Every day from 10am to 6pm','9$','1h','Church','easy','neo-classicism'),
('L Opéra Garnier', 'Opéra Garniera is a national theatre with a lyrical and choreographic vocation and a major part of the heritage of the 9th arrondissement of Paris and the capital.'
, 'Paris', 'Place de l Opéra','Every day from 10am to 5pm','10$','1h30-2h','Opera','easy','neo-baroque'),
('Les Invalides','The Hôtel des Invalides is a Parisian monument whose construction was ordered by Louis XIV by the royal edict of February 24, 16702, to house the invalids of his armies.'
,'Paris','128 rue de Grenelle','Every day from 10am to 6pm','12$','1h-2h','museum','easy','Classical architecture'),
('Disneyland','Disneyland Paris is a 22.30 km2 tourist and urban complex located thirty-two kilometers east of Paris. The resort includes two theme parks – Disneyland Park and Walt Disney Studios'
,'Marne-la-Vallée',' Boulevard de Parc, 77700 Coupvray','Every day from 10am to 6pm','56$','all day','theme park','easy','magic'),
('Parc Astérix','The Asterix Park is a tourist complex including a theme park.  The theme park is dedicated to the comic book universe of Uderzo and Goscinny: Asterix.'
,'Plailly','60128 Plailly','Every day from 10am to 6pm, closed between 4th of november and 5th of april','51$','all day','theme park','easy','fun'),
('Le Musée de l Orangerie','The National Museum of the Orangerie is a museum of impressionist and postimpressionist paintings located in the Tuileries Garden'
,'Paris','Jardin des Tuileries','Every day from 9am to 6pm except tuesday','9$','1h-2h','museum','easy','impressionism');

INSERT INTO Image(id_monument,url_image)VALUES
(1,"https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/aa/fc.jpg"),
(2,"https://www.boutiquesdemusees.fr/uploads/branding/2/0_l.jpg?m=1529063659"),
(3,"http://scd.rfi.fr/sites/filesrfi/imagecache/rfi_16x9_1024_578/sites/images.rfi.fr/files/aef_image/Notre_Dame_dalla_Senna_crop_0.jpg"),
(4,"http://www.agenor-paris-hotel.com/usermedia/photo-635633248121753983-1.jpg?dummy=0&h=800"),
(5,"https://media.tacdn.com/media/attractions-splice-spp-674x446/06/71/34/bc.jpg"),
(6,"https://cdn.civitatis.com/francia/mont-saint-michel/galeria/mont-saint-michel.jpg"),
(7,"https://upload.wikimedia.org/wikipedia/commons/6/6d/Avenue_des_Champs-%C3%89lys%C3%A9es_July_24%2C_2009_N1.jpg"),
(8,"https://www.nerienlouper.paris/wp-content/uploads/2017/04/basilique-sacre-soeur-montmartre.jpg"),
(9,"https://provence-alpes-cotedazur.com/app/uploads/2019/03/Nice-PACA-credit-Fotolia-e1553851803445.jpg"),
(10,"http://catacombes.paris.fr/sites/default/files/styles/1920x1080/public/2018-10/cat-footer-faq.jpg?itok=_QDHeHmX"),
(11,"https://www.sortiraparis.com/images/80/1467/108625-jeu-de-piste-gratuit-au-musee-d-orsay.jpg"),
(12,"https://media-cdn.tripadvisor.com/media/attractions-splice-spp-540x360/06/70/07/53.jpg"),
(13,"https://www.sortiraparis.com/images/80/1467/304212-le-centre-pompidou-transforme-en-club-pour-ses-40-ans.jpg"),
(14,"https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Pantheon_of_Paris_007.JPG/260px-Pantheon_of_Paris_007.JPG"),
(15,"https://res.cloudinary.com/opera-national-de-paris/image/upload/w_768/v1563286913/visites/accueil-garnier.jpg"),
(16,"https://cdn.britannica.com/14/178014-050-9BBC3027/Les-Invalides-Paris-Most-complex-Liberal-Bruant-1706.jpg"),
(17,"https://www.sortiraparis.com/images/80/76154/455912-laurentp-disneyland-paris.jpg"),
(18,"https://images.musement.com/cover/0003/95/thumb_294977_cover_header.jpeg?&q=60&fit=crop&lossless=true&auto=format&w=412&h=200"),
(19,"https://keewego.com/wp-content/uploads/2018/10/musee-de-lorangerie.jpg");

INSERT INTO Access (id_monument, type, information) VALUES
(1,'Metro','Bir-Hakeim(line:6)'),
(1,'RER','Champ De Mars-Tour Eiffel (RER C)'),
(1,'Bus','Tour Eiffel (line:82,42,30'),
(2,'Metro','Palais-Royale (line: 1,7'),
(2,'RER','Musee d Orsay (have to cross La Seine) RER C  '),
(2,'Bus','Musee Du Louvre(line:95,69,68,39,27)'),
(3,'metro','Chatelet (line: 7,11,14)'),
(3,'RER','Saint-Michel-Notre-Dame (RER B and RER C'),
(3,'Bus','Cité-Palais de Justice (line 21,38,47,85,96)'),
(4,'RER','Versailles Rive-Gauche (RER C)'),
(4,'Bus','Chateau de Versailles (line: 171)'),
(5,'metro','Charles De Gaules Etoile (line:1,2,6)'),
(5,'RER','Charles De Gaules Etoile (RER A)'),
(5,'Bus','Charles De Gaules Etoile (line:22,30,31,52,73,92)'),
(6,'Car','A84 CAEN-Rennes then there is a parking and take the shuffle'),
(6,'Train','station Pontorson, then there is a direct shuttle bus from there to the island '),
(7,'metro','Charles-De-Gaulle-Etoile(lines 1,2,6)'),
(7,'RER','Charles-De-Gaulle-Etoile(RER A)'),
(7,'Bus','Charles-De-Gaulle-Etoile(lines 22,30,31,52,73,92)'),
(8,'metro','Pigale(lines 12,2), Anvers(line 2)'),
(8,'Funiculaire','Cable car'),
(8,'Bus','Norvins (Montmartrobus)'),
(9,'Car',''),
(9,'Train','Nice, Marseille, Montpelier train stations'),
(9,'Plane','Nice, Marseille, Saint tropez, Perpignan Airports'),
(10,'metro','Danfert-Rochereau(line 4,6)'),
(10,'RER','Danfert-Rochereau (RER B'),
(11,'metro','Charles-De-Gaulle-Etoile(lines 1,2,6)'),
(11,'RER','Charles-De-Gaulle-Etoile(RER A)'),
(11,'Bus','Charles-De-Gaulle-Etoile(lines 22,30,31,52,73,92)'),
(12,'metro','Solférino(line 12)'),
(12,'RER','Solferino(RER C)'),
(12,'Bus',' Musée d Orsay (line 63, 68, 69, 73, 83, 84, 87, 94)'),
(13,'metro','Alma-Marceau(line 9), Franklin Roosevelt(line 1)'),
(13,'Bus',' Franklin Roosevelt(lines 28, 42, 49, 63, 72)'),
(13,'metro',' Rambuteau (line 11), Hôtel de Ville (lines 1 and 11), Châtelet (lines 1, 4, 7, 11 and 14)'),
(13,'RER','Châtelet Les Halles (lines A, B, D)'),
(13,'BUS','lines 29, 38, 47, 75'),
(14,'metro', 'Cardinal Lemoine (line 10)'),
(14, 'RER', 'Luxembourg (line B'),
(14, 'BUS','lines 21, 27, 38, 82, 84, 85, 89'),
(15,'metro','Opera (lines 3, 7 and 8'),
(15,'RER','Auber (line A)'),
(15,'BUS','lines 20, 21, 22, 27, 29, 42, 52, 53, 66, 68, 81 and 95'),
(16,'metro','Invalides (lines 8 and 13), La Tour-Maubourg (line 8), Varenne (line 13)'),
(16,'RER','Invalides (line C)'),
(16,'BUS','lines 28, 63, 69, 82, 83, 92, 93'),
(17,'car','A4 exit 14 Val d Europe/Parc Disneyland'),
(17,'RER','Marne-la-Vallée/Chessy (line A)'),
(18,'Car','A1 to Lille, exit Parc Asterix'),
(19,'metro','Concorde (lines 1, 8 and 12)'),
(19,'BUS','lines 24, 42, 52, 72, 73, 84, 94');




INSERT INTO Affluence (id_monument, times, affluence_level) VALUES
(1,'monday, tuesday, wednesday: all day, thursday, friday, saturday, sunday 9am to 11am and 11pm to close','low'),
(1,'thursday, friday, sunday: 11am to 11pm','medium'),
(1,'saturday: 11am to 11pm','high'),
(2,'every day: 9am to 10am','low'),
(2,'friday: 10am to 11am, wednesday, friday: 8pm to 9pm ','medium'),
(2,'wednesday:10am to 11am, friday, wednesday: 11am to 7pm, monday,thursday,saturday,sunday: 10am to 6pm','high'),
(3,'no time','Close'),
(4,'every day: 9am to 10am','low'),
(4,'every day 10am to 6pm','high'),
(5,'monday, tuesday, wednesday, thursday, friday:11am to 2:30pm, every day:8pm to 10:30pm','low'),
(5,'every day:10am to 11am and 2:30pm to 8pm, saturday and sunday: 11am to 2:30pm','medium'),
(6,'every day: 9am to 10am','low'),
(6,'every day:10am to 11am and 5pm to 6pm','medium'),
(6,'every day: 11am to 5pm','high'),
(7, 'Monday to friday from 23:30 to 8 in the morning','low'),
(7, 'Monday to friday from 8 am to 10 am ','Medium'),
(7, 'Monday to friday: from 10 am to 23:30 and the week ends','High'),
(8, 'Monday to saturday : from 6 am to 8 am','low'),
(8, 'monday to saturday: from 8 am to 22:30 and sunday the whole day','High'),
(9, 'Winter','low'),
(9, 'Summer','High'),
(10, 'wendesday, thursday, friday: from 3 pm to 8:30','low'),
(10, 'tuesday: from 3pm to 8:30,wendesday, thursday, friday: from 10am to 3pm, saturday and sunday: from 5pm to 8:30','Medium'),
(10, 'Tuesday : from 10 am to 3 pm, Saturday and sunday: from 10 am to 5 pm','High'),
(11, 'Thursday: starting from 6 pm','low'),
(11, 'Wednesday and Friday','Medium'),
(11, 'Tuesday and Sunday','High'),
(12, 'Spring and Autumn','low'),
(12, 'Winter','Medium'),
(12, 'Summer: Whole week','High'),
(13,'monday, wednesday, thrusday, friday : 3pm to 9pm, saturday and sunday : 7pm to 9pm','low'),
(13,'monday, wednesday, thursday, friday : 1pm to 3pm, saturday and sunday : 5pm to 7pm','medium'),
(13,'monday, wednesday, thursday, friday : 11am to 1pm, saturday and sunday : 11am to 5pm','high'),
(14,'monday, tuesday, wednesday, thursday, friday : 10am to 2pm, saturday and sunday : 10am to 11am','low'),
(14,'monday, tuesday, wednesday, thursday, friday : 2pm to 6pm, saturday and sunday : 11am to 6pm','medium'),
(15,'monday, tuesday, wednesday, thursday, friday : 10am to 2pm, saturday and sunday : 10am to 11am','low'),
(15,'monday, tuesday, wednesday, thursday, friday : 2pm to 5pm, saturday and sunday : 11am to 5pm','high'),
(16,'monday, wednesday, thursday, friday, saturday : 10am to 6pm','low'),
(16,'tuesday and sunday : 12am to 3pm','medium'),
(16,'tuesday and sunday : 10am to 12am and 3pm to 6pm','high'),
(17,'monday, tuesday, wednesday, thursday, friday','high'),
(17,'saturday and sunday','very high'),
(18,'monday, tuesday, wednesday, thursday, friday','high'),
(18,'saturday and sunday','very high'),
(19,'wednesday, saturday : 9am to 10am, thursday, friday : 9am to 12am','low'),
(19,'monday, sunday : 9am to 10am, wednesday, saturday : 10am to 2pm, thursday, friday : 12am to 6pm','medium'),
(19,'monday : 10am to 2pm, wednesday, saturday : 2pm to 6pm, sunday : 10am to 12am','high'),
(19,'monday : 2pm to 6pm, sunday : 12am to 6pm','very high');
