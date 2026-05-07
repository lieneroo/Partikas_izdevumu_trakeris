CREATE DATABASE IF NOT EXISTS food_expense_tracker
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE food_expense_tracker;

CREATE TABLE IF NOT EXISTS categories (
categories_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS receipts (
receipts_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
purchase_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS products (
products_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) NULL,
product_name VARCHAR(150) NOT NULL,
id_categories INT NOT NULL,
CONSTRAINT unique_brand_product 
UNIQUE (brand_name, product_name),
CONSTRAINT products_categories
	FOREIGN KEY (id_categories)
	REFERENCES categories (categories_id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS purchase_item (
purchase_item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
quantity DECIMAL(10,2) NOT NULL,
unit VARCHAR(20) NOT NULL,
price DECIMAL(10,2) NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
meals_count INT NULL,
days_count INT NULL,
id_products INT NOT NULL,
id_receipts INT NOT NULL,
CONSTRAINT purchase_item_products
	FOREIGN KEY (id_products)
	REFERENCES products (products_id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION,
CONSTRAINT purchase_item_receipts
	FOREIGN KEY (id_receipts)
	REFERENCES receipts (receipts_id)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
) ENGINE=InnoDB;

INSERT INTO categories (category_name)
VALUES ('Brokastis'), ('Vakariņas'), ('Ūdens'), ('Proteīns'), ('Saldumi'), ('Čipši'), ('Kafija'), ('Cafe'), ('Citi');

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Ķekava', 'Cāļa pusspārni lieliskie', 2),
('Ķekava', 'Cāļa pusspārni gardie', 2),
('Ķekava', 'Cāļa šķiņķi gardā jogurta marinādē', 2),
('Rimi', 'Šķiņķi grieķu marinādē', 2),
('Ķekava', 'Cāļa pusspārnu vidusdaļas gaileņu marinādē', 2),
('Ķekava', 'Cāļa šķiņķi gardā lauku marinādē atkauloti', 2),
('Rīgas Miesnieks', 'Cāļa šašliks trīs sieru marinādē', 2),
('Nākotne', 'Cāļa gaļa tomātu, ķiploku mērcē', 2),
('Lido', 'Cāļa gaļa krējuma, sīpolu marinādē', 2),
('Bauska', 'Marinēti cāļa filejas gab. Cream marinādē', 2),
('Rimi', 'Cāļa filejas šašliks plūmju marinādē', 2),
('Lido', 'Cāļa gaļa maigajā majonēzes marinādē', 2),
('Rimi', 'Cāļu pusspārni Teriyaki marinādē', 2),
('Rīgas Miesnieks', 'Cāļa fileja Cēzara marinādē', 2),
('Rīgas Miesnieks', 'Cāļu gaļa trīs sieru marinādē', 2),
('Rimi', 'Broileru mazās filejas maigā marinādē', 2),
('Rimi', 'Cāļa fileja zaļumnieku marinādē', 2),
('Lido', 'Cāļa pusspārniņi Lido kimči marinādē', 2),
('Rimi', 'Cāļu šķiņķu šašliks kebaba marinādē', 2),
('Rimi', 'Cāļa šķiņķu šašliks krējuma marinādē', 2),
('Rimi', 'Cāļu mazās filejas', 2),
('Ķekava', 'Cāļa stilbi', 2),
('Ķekava', 'Cāļu stilbi bez locītavas', 2),
('Rimi', 'Cāļa krūtiņas fileja BIO', 2),
('Rimi', 'Cāļu krūtiņas filejas', 2),
('Rimi', 'Cāļa stilbi', 2),
('Rimi', 'Cāļu šķiņķi', 2),
('Rimi', 'Cūkgaļas karbonāde bez kaula šķēlēs', 2),
('Rimi', 'Liellopa plānās filejas steiks', 2),
('Rimi', 'Liellopa antrekota steiks', 2),
('Rimi', 'Liellopa rumpsteiks', 2),
('Rimi', 'Liellopa gaļas lāpstiņa bez kaula', 2),
('Rimi', 'Atlantijas laša fileja', 2),
('Rimi', 'Varavīksnes foreles filejas', 2),
('Rimi', 'Garneles ar čaulu 16/20 nevārītas saldētas', 2),
('Rimi', 'Garneles vārītas 31/40 mizotas ar asti ātri sasaldētas', 2),
('Zigmas', 'Mintaja filejas porcijas, saldētas', 2),
('Viči', 'Zivju filejas porcijas panējumā', 2);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Lido', 'Pelmeņi ar cāļa gaļu', 2),
('Lido', 'Cepampelmeņi ar cāļa gaļu', 2),
('Lido', 'Pelmeņi spinātu ar biezpienu un sieru', 2),
('Lido', 'Pelmeņi klasiskie, ar cūkgaļu un liellopa gaļu', 2),
('Lido', 'Pelmeņi ar jēra gaļu', 2);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Rimi', 'Salāti Roman', 2),
('Rimi', 'Zaļie lapu salāti 1.šķira', 2),
('Baltijas Dārzeņi', 'Salāti lapu Latvijas gab. 1.šķ.', 2),
('Rimi', 'Provansas salāti 1.šķira', 2),
('Rimi', 'Salāti bistro 1.šķira', 2),
('Fit&Easy', 'Salātu maisījums "Gourmet"', 2),
('Fit&Easy', 'Burkānu salmiņi', 2),
('Fit&Easy', 'Baltais kāposts sagriezts', 2),
('Fit&Easy', 'Dārzeņu maisījums Coleslaw', 2),
('Fit&Easy', 'Salātu maisījums "Green&Red"', 2),
('Fit&Easy', 'Ķīnas kāposts sagriezts', 2),
('Fit&Easy', 'Salātu maisījums "Active"', 2),
('Fit&Easy', 'Grilla maisījums ar burkāniem"', 2),
('Fit&Easy', 'Sarkanais kāposts sagriezts', 2),
('Fit&Easy', 'Salātu maisījums "Family"', 2),
('VEG', 'Salāti Rosso&Biondo 1.šķira', 2),
('Itālija', 'Salātu maisījums Oriental 1.šķ.', 2),
('Itālija', 'Salātu maisījums Valeriana 1.šķ.', 2),
('Itālija', 'Salātu maisījums Misticanza 1.šķ.', 2),
('Itālija', 'Salātu mix Eko', 2),
('Džiugas', 'Siers rīvēts 40%', 2),
('Rimi', 'Ciets siers rīvēts', 2),
('Siera Nams', 'Rīvēts siers Mozzarella', 2),
('Džiugas', 'Rīvēta siera maisījums makaroniem', 2),
('Džiugas', 'Rīvēta siera maisījums salātiem', 2),
('Džiugas', 'Rīvēta siera maisījums picai', 2),
('Rimi', 'Siers Mozzarella 45%', 2),
('Rimi', 'Mozzarella siers rīvēts', 2),
('Rimi', 'Salātu siers 40%', 2),
('Rimi', 'Siers Feta Planet', 2),
('Rimi', 'Siers Mozzarella mini', 2),
('Galbani', 'Siers Mozzarella', 2),
('Formagia', 'Siers mozzarella', 2),
('Smiltene', 'Svaigais siers Mozzarella Mini', 2),
('Baltais', 'Siers Grieķu salātiem', 2),
('Smiltene', 'Svaigais siers Mozzarella', 2);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Valmiera ', 'Pilnpiena biezpiens 9%', 2),
('Valmiera ', 'Biezpiens 5%', 2),
('Valmiera ', 'Vājpiena biezpiens 0,5%', 2),
('Kaija ', 'Tunzivju filejas citronu eļļā ar zaļajiem pipariem', 2),
('Kaija ', 'Tuncis savā sulā ar ūdeni', 2);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Rimi', 'Svaigā siera bumbas ar tomātiem un baziliku, rapšu eļļā', 1),
('Rimi', 'Olas Iecavas kūtī dētas A/L No.2', 1),
('Balticovo', 'Olas brīvo vistu A/LM Nr.1', 1),
('Balticovo', 'Olas Zemnieku A/LM nr2', 1),
('Rimi', 'Olas kūtī dētas A/L Nr.2', 1),
('Oluksne', 'Olas kūtī dētas A/LM Nr.2', 1),
('Marge', 'Piens UHT 3,2%', 1),
('Marge', 'Piens UHT 2%', 1),
('Marge', 'Piens UHT 0,5%', 1),
('Annele', 'Piens UHT 2,5%', 1),
('Annele', 'Piens bez laktozes pasterizēts UHT 2,5%', 1),
('Marge', 'Piens bez laktozes 1.5%, UHT', 1),
('NOO', 'Fileja tītara gaļas šķēlēs', 1),
('Nākotne', 'Karbonāde jubilāra', 1),
('Druva', 'Tostermaize sagriezta', 1),
('Fazer', 'Tostermaize Gardā', 1),
('Fazer', 'Tostermaize Ierauga', 1),
('Tostē', 'Tostermaize klasiskā sagriezta', 1),
('Rimi', 'Daudzsēklu maize šķēlēs', 1),
('Rimi', 'Maize ar olīvām kalamata', 1),
('Rimi', 'Maize Ciabatta tumšā', 1),
('Rimi', 'Tomāti plūmes sarkani mini', 1),
('Rimi', 'Tomāti plūmju mini oranži', 1),
('Rimi', 'Mini tumšie tomāti', 1),
('Rimi', 'Tomāti Romantica', 1),
('Rimi', 'Plūmju tomāti Mix mini', 1),
('Mario', 'Rīsu sausmaizītes', 1),
('Rimi', 'Šampinjoni', 1),
('Rimi', 'Šampinjoni brūnie', 1),
('Philadelphia', 'Krēmsiers Extra Protein', 1),
('Philadelphia', 'Krēmsiers Light', 1),
('Philadelphia', 'Krēmsiers Original', 1),
('Baltais', 'Sviests Exporta 82,5%', 1),
('Rimi', 'Sviests 82% tauku', 1),
('Straupe', 'Sviests saldkrējuma 82%', 1),
('Cesvaine', 'Sviests saldkrējuma 82%', 1);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Venden', 'AVOTA ŪDENS MEŽAVOTS 18.9L', 3);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Baltais', 'Biezpiena krēms Protein zemeņu', 4),
('Baltais', 'Biezpiena krēms Protein vaniļas', 4),
('Smiltene', 'Proteīna smūtijs ananasu un mango', 4),
('Smiltene', 'Proteīna smūtijs ābolu un dzērveņu', 4),
('Smiltene', 'Proteīna smūtijs Blumpower šokolādes un banānu', 4),
('Smiltene', 'Proteīna smūtijs Blumpower bezpiedevu', 4),
('Smiltene', 'Olbaltumvielu dzēriens Piena Spēks zemeņu', 4),
('Smiltene', 'Olbaltumvielu dzēriens Piena Spēks vaniļas', 4),
('Smiltene', 'Olbaltumvielu dzēriens Piena Spēks', 4),
('Smiltene', 'Olbaltumvielu dzēriens Piena Spēks šokolādes', 4),
('Smiltene', 'Olbaltumvielu dzēriens Piena Spēks bezlaktozes ar D3 vitamīnu', 4),
('Lakto', 'Jogurts Protein mango, marakujas, čia sēklu, bez laktozes', 4),
('Lakto', 'Jogurts Protein aveņu, linsēklu, saulespuķu sēklu, bez laktozes', 4),
('Lakto', 'Jogurts Protein ķiršu, bez laktozes', 4);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Latvijas Maiznieks', 'Kūko kūka medus', 5),
('Latvijas Maiznieks', 'Kūko kūka Vīnes šokolādes', 5),
('Latvijas Maiznieks', 'Krēma kūka Kūko burkānu', 5),
('Latvijas Maiznieks', 'Kūka Kūko Bueno', 5),
('Latvijas Maiznieks', 'Braunijs Kūko šokolādes', 5),
('Staburadze', 'Kūciņas Cielaviņa', 5),
('Staburadze', 'Kūciņas Vēja pikas ar biezpienu', 5),
('Staburadze', 'Deserts Cielaviņa', 5),
('Staburadze', 'Kūciņas Skudrupūznīši', 5),
('Staburadze', 'Kūciņas Vēja pikas ar vārīto krēmu', 5),
('Liepkalni', 'Eklēri', 5),
('Smiltene', 'Torte biezpiena ar ķiršiem', 5),
('Smiltene', 'Torte biezpiena ar mellenēm', 5),
('Smiltene', 'Torte siera ar citronu krēmu', 5),
('Smiltene', 'Biezpiena torte ar avenēm', 5),
('Smiltene', 'Siera kūka ar sāļo karameli', 5),
('Staburadze', 'Torte Cielaviņa ar lazdu riekstiem', 5),
('Rimi', 'Groziņi ar iebiezinātā piena krēmu', 5),
('Latvijas Maiznieks', 'Kūka Kūko medus-karameļu', 5),
('Latvijas Maiznieks', 'Torte Taste Story Rainbow', 5),
('Karl Fazer', 'Piena šokolāde', 5),
('Karl Fazer', 'Šokolāde ar rozīnēm un lazdu riekstiem', 5),
('Karl Fazer', 'Piena šokolāde ar ogām', 5),
('Karl Fazer', 'Piena šokolāde ar piparmētru garšu un mandeļu kraukšķiem', 5),
('Karl Fazer', 'Piena šokolāde ar dražejām', 5),
('Geisha', 'Šokolāde ar karameli un jūras sāli', 5),
('Geisha', 'Piena šokolāde', 5),
('Milka', 'Šokolāde Biscoff ar karamelizētu cepumu gabaliņiem', 5),
('Milka', 'Piena šokolāde ar Daim karameles gabaliņiem', 5),
('Haribo', 'Željkonfektes ar ogu garšu', 5),
('Haribo', 'Želejkonfektes Starmix ar dažādu augļu un kolas garšu', 5),
('Haribo', 'Želejkonfektes Mix Fizz sāļās ar augļu garšu', 5),
('Haribo', 'Želejas konfektes TropiFrutti', 5),
('Haribo', 'Želejkonfektes Goldbears', 5),
('Mamba', 'Košļājamās konfektes magic sticks', 5),
('Mamba', 'Košļājamā konfekte Mamba', 5),
('Fazer', 'Želejkonfektes Tutti Frutti Passion', 5),
('Geisha', 'Konfektes piena šokolādes', 5),
('Geisha', 'Konfektes ar karameli un jūras sāli', 5),
('Raffaello', 'Konfektes Raffaello', 5),
('Ferrero', 'Konfektes Ferrero Rocher', 5),
('Karuna', 'Šokolādes konfektes Migle', 5),
('Laima', 'Konfektes Rudzupuķe', 5),
('Laima', 'Konfektes Vētrasputns', 5),
('Pergalė', 'Šokolādes konfektes Fortūna', 5),
('Toffifee', 'Konfektes Toffifee', 5),
('Toffifee', 'Konfektes Toffifee White', 5),
('Laima', 'Konfektes Rīts', 5),
('Skrīveru', 'Marcipāns šokolādē ar zemeņu garšu', 5),
('Smash', 'Uzkodas ar piena šokolādi', 5);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('Ādažu', 'Čipsi ar tomātu garšu', 6),
('Ādažu', 'Čipsi Mazāk sāls Klasiskie', 6),
('Ādažu', 'Čipsi Salmiņi', 6),
('Ādažu', 'Čipsi ar diļļu garšu', 6),
('Ādažu', 'Čipsi ar siera garšu', 6),
('Ādažu', 'Čipsi kraukšķīgie kartupeļi ar sāli', 6),
('Ādažu', 'Čipsi virpuļi', 6),
('Ādažu', 'Čipsi ar čili un citrusu', 6),
('Ādažu', 'Čipsi kraukšķīgie kartupeļi ar pikanto tomātu', 6),
('Ādažu', 'Čipsi krēmīgais čedars', 6),
('Long Chips', 'Kartupeļu plāksnes ar siera garšu', 6),
('Long Chips', 'Kartupeļu plāksnes ar bekona garšu', 6),
('Lays', 'Kartupeļu čipsi ar sāli', 6),
('Pringles', 'Sāļā uzkoda Original', 6),
('Lays', 'Krāsnī cepti kartupeļu čipsi ar jogurta un zaļumu garšu', 6),
('Lays', 'Krāsnī cepti kartupeļu čipsi ar sāli', 6),
('Lays', 'Kartupeļu čipsi ar čili un laima garšu', 6),
('Lays', 'Rievoti kartupeļu čipsi ar siera un pikantās paprikas garšu', 6),
('Ādažu', 'Čipsi sirsniņas', 6);

INSERT INTO products (brand_name, product_name, id_categories)
VALUES ('LaMolisana', 'Makaroni Gnocchetti', 9),
('Rimi', 'Apaļgraudu rīsi', 9),
('Rimi', 'Jasmīna rīsi', 9),
('Rimi', 'Basmati rīsi', 9),
('Rimi', 'Gargraudu rīsi', 9),
('Valdo', 'Basmati Gold rīsi', 9),
('Rimi', 'Kartupeļi frī 7mm saldēti', 9),
('Rimi', 'Saldo kartupeļu frī ātri sasaldēti', 9),
('Rimi', 'Brokoļi saldēti', 9),
('Rimi', 'Ziedkāposti saldēti', 9),
('Rimi', 'Sviesta pupiņas saldētas', 9),
('Solveza', 'Alus dzēriens Rosado 4,5%', 9),
('Solveza', 'Alus Agave & Lemon 6%', 9),
('Tērvete', 'Alus tumšais 5,4%', 9),
('Madonas', 'Alus tumšais 5,2%', 9),
('Valmiermuižas', 'Alus tumšais 5,8%', 9),
('Valmiermuižas', 'Alus gaišais 5,2%', 9),
('Madonas', 'Alus nefiltrētais 5,6%', 9),
('Lido', 'Alus speciālais 4,8%', 9),
('Maori Bay', 'Baltvīns Sauvignon Blanc 20 12,5%', 9),
('RUDYS', 'Kombucha', 9);