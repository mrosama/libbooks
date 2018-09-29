/*
Navicat MySQL Data Transfer

Source Server         : MySqlServer
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : books

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-10-06 13:23:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `px_adv`
-- ----------------------------
DROP TABLE IF EXISTS `px_adv`;
CREATE TABLE `px_adv` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `links` text,
  `img` text,
  `IsSlected` enum('true','false') DEFAULT 'false',
  `cat` enum('TOP','RIGHT','LEFT','BOTTOM') DEFAULT 'RIGHT',
  `max_w` varchar(10) DEFAULT NULL,
  `max_h` varchar(10) DEFAULT NULL,
  `flag` int(3) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_adv
-- ----------------------------
INSERT INTO `px_adv` VALUES ('1', 'إعلان يمين 1', 'http://google.com', '1220277046.gif', 'false', 'RIGHT', '160', '80', '0');
INSERT INTO `px_adv` VALUES ('2', 'إعلان شمال', 'http://google.com', '1260558328.gif', 'false', 'LEFT', '147', '500', '0');
INSERT INTO `px_adv` VALUES ('3', 'يمين 2', 'http://google.com', '1294030359.gif', 'false', 'RIGHT', '150', '60', '0');
INSERT INTO `px_adv` VALUES ('4', 'شمال2', 'http://google.com', '1213964334.gif', 'false', 'LEFT', '144', '290', '1');
INSERT INTO `px_adv` VALUES ('9', 'wpf', 'http://google.com', '1412224736.jpg', 'false', 'LEFT', '200', '300', '0');

-- ----------------------------
-- Table structure for `px_books`
-- ----------------------------
DROP TABLE IF EXISTS `px_books`;
CREATE TABLE `px_books` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` text,
  `bookdesc` text,
  `author` varchar(200) DEFAULT NULL,
  `authoremail` varchar(230) DEFAULT NULL,
  `cat` int(11) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `cover` varchar(200) DEFAULT NULL,
  `active` enum('YES','NO') DEFAULT 'NO',
  `IsSelected` enum('true','false') DEFAULT 'false',
  `dat` date DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_books
-- ----------------------------
INSERT INTO `px_books` VALUES ('1', 'التطور لاقتصادي في أسية الشرقية', 'ايريك بوتيّه وميشيل فوكان، التطور لاقتصادي في أسية الشرقية.', 'ايريك بوتيّه وميشيل فوكان', 'info1@yahoo.com', '14', '1411285256.zip', '1411285256.png', 'YES', 'false', '2014-09-22', '12KB');
INSERT INTO `px_books` VALUES ('2', 'حاجات الإنسان الأساسية في الوطن العربي', 'حاجات الإنسان الأساسية في الوطن العربي', 'برنامج الأمم المتحدة للبيئة', 'info1@yahoo.com', '14', '1411285419.zip', '1411285419.png', 'YES', 'false', '2014-09-22', '12KB');
INSERT INTO `px_books` VALUES ('3', 'إعادة الإنتاج', 'إعادة الإنتاج', 'بيير بورديو', 'info1@yahoo.com', '14', '1411285547.zip', '1411285547.png', 'YES', 'false', '2014-09-22', '12KB');
INSERT INTO `px_books` VALUES ('4', 'النظام الاقتصادي الدولي المعاصر', 'النظام الاقتصادي الدولي المعاصر', 'حازم الببلاوي', 'info1@yahoo.com', '14', '1411285681.zip', '1411285681.png', 'YES', 'false', '2014-09-22', '12KB');
INSERT INTO `px_books` VALUES ('5', 'أساسيات Wpf  لمبرمجي سي شارب', 'WPF هي تقنية جديدة، قدمتها ميكروسوفت لمبرمجي دوت نت باعتبارها الجيل التالي لتقنية نماذج الويندوز Windows Forms Applications.\r\n\r\nوقد  ظهرت تقنية Wpf لأول مرة في نوفمبر 2006.. لكن رغم مرور كل هذا الوقت، ما زالت هذه التقنية المدهشة بإمكانياتها الرائعة مجهولة لكثير من المبرمجين العرب.. هذا الكتاب محاولة لكشف هذا المجهول، وتعريف المبرمج العربي بهذا الكنز المخبوء.', 'م. محمد حمدي', 'info1@yahoo.com', '3', '1411391652.zip', '1411391652.jpg', 'YES', 'false', '2014-09-22', '25.25 KB');
INSERT INTO `px_books` VALUES ('6', 'المدخل العملي السريع إلى: VB.NET 2010', 'هذا الكتاب موجه إلى القارئ الشغوف، الذي لا يعرف ما هي VB.NET، أو ما هي البرمجة عموما، ويريد أن يأخذ جولة سريعة مختصرة، ولكن في نفس الوقت وافية وكافية لكي يقرر إن كانت البرمجة هي المجال الذي يناسبه أم لا.\r\nوهو موجه أيضا إلى الطالب أو الدارس الذي يريد أن يلمّ في أسرع وقت بمهارات فيجيوال بيزيك الأساسية التي تؤهله لدراسة أحد المناهج، أو تساعده في إنجاز مشروع التخرج أو برنامج مساند لرسالته البحثية.\r\nوهو موجه كذلك إلى الموظف أو المحاسب الذي سمع عن قدرة فيجيوال بيزيك على تطوير تطبيقات تجارية قوية، فانتابه الفضول للتعرف على هذه اللغة،', 'م. محمد حمدي غانم', 'info1@yahoo.com', '3', '1411392119.zip', '1411392119.jpg', 'YES', 'false', '2014-09-22', '25.25 KB');
INSERT INTO `px_books` VALUES ('7', 'من الصفر إلى الاحتراف: برمجة قواعد البيانات', 'يفترض هذا الكتاب أنك لا تملك أية معرفة مسبقة بقواعد البيانات والبرامج التي تنشئها بها، لهذا فهو يبدأ معك من الصفر، ليعرفك على المفاهيم الأساسية اللازمة للتعامل مع قواعد البيانات، وكيف تنشئها في Access و SQL Server 2008، وكيف تكتب الاستعلامات التي تحصل بها على البيانات باستخدام لغة SQL.. بعد هذا يعلمك الكتاب كيف تتعامل مع قواعد البيانات من داخل مشاريع فيجيوال بيزيك دوت نت باستخدام تقنية ADO.NET.', 'م. محمد حمدي غانم', 'info1@yahoo.com', '5', '1411285256.zip', '1411432761.jpg', 'YES', 'false', '2014-09-23', '4.83 KB');
INSERT INTO `px_books` VALUES ('8', 'من الصفر إلى الاحتراف: برمجة نماذج الويندوز', 'هذا الكتاب هو الخطوة الثالثة في طريقنا إلى احتراف البرمجة بدوت نت، بعد أن تعلمنا في الكتابين السابقين:\r\n1- أساسيات كتابة الكود، والبرمجة الموجهة بالكائنات OOP، وتراكيب البيانات.\r\n2- برمجة إطار العمل.', 'م. محمد حمدي غانم', 'info1@yahoo.com', '2', '1411432864.zip', '1411432864.jpg', 'YES', 'false', '2014-09-23', '25.25 KB');
INSERT INTO `px_books` VALUES ('9', 'من الصفر إلى الاحتراف: برمجة إطار العمل', 'يشرح هذا الكتاب أكثر من 125 عنصرا من العناصر الأساسية لإطار العمل .NET Framework، تتنوع ما بين الواجهات Interfaces والفئات Classes والسجلات Structures، بالإضافة إلى آلاف الخصائص Properties والوسائل Methods والمرقمات Enums التي تنتمي إلى هذه العناصر.', 'م. محمد حمدي غانم', 'info1@yahoo.com', '11', '1411433013.zip', '1411433013.jpg', 'YES', 'false', '2014-09-23', '25.25 KB');
INSERT INTO `px_books` VALUES ('10', 'من الصفر إلى الاحتراف: فيجيوال بيزيك دوت نت 2010، وسي شارب', 'هذا الكتاب مصمّم ليأخذ بيد مبرمج مبتدئ يخطو أولى خطواته على الدرب، ولديه الهمة والحماس للإكمال إلى آخره.. لهذا فإن هذا الكتاب يبدأ فعليا وحرفيا من الصفر: منذ أول إنسان استخدم حصاة كأداة للعد في فجر التاريخ، ليبحر بقارئه في رحلة سريعة عبر تاريخ اختراع الحاسوب وتاريخ تطور نظم التشغيل وتاريخ لغات البرمجة، وتاريخ لغة البيزيك، وصولا إلى أحدث إصداراتها Visual Basic 10 التي تقدمها لنا دوت نت 2010.', 'م. محمد حمدي غانم', 'info1@yahoo.com', '2', '1411285256.zip', '1411433154.jpg', 'YES', 'false', '2014-09-23', '4.83 KB');
INSERT INTO `px_books` VALUES ('11', 'المبرمج الصغير: تعلم البرمجة بفيجيوال بيزيك دوت نت', 'ذا الكتاب موجه إلى المبرمج الصغير من سن 14 إلى 18 عاما، الذي يخطو أولى خطواته في عالم البرمجة، ويريد تعلم لغة فيجيوال بيزيك دوت نت VB.NET بأسلوب شيق وجذاب.\r\nويبدأ هذا الكتاب بمقدمة تحكي تاريخ لغة البيزيك باختصار.', 'م. محمد حمدي غانم.', 'info@google.com', '1', '1412263515.zip', '1412263515.jpg', 'YES', 'false', '2014-10-02', '25.25 KB');
INSERT INTO `px_books` VALUES ('12', 'testtttttttttttttttttttttttttt', 'wwww', 'aaaaa', 'sdasd@asdsad.com', '1', '1412318740.zip', '1412319216.jpg', 'NO', 'false', '0000-00-00', 'undefined');

-- ----------------------------
-- Table structure for `px_cat`
-- ----------------------------
DROP TABLE IF EXISTS `px_cat`;
CREATE TABLE `px_cat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(230) DEFAULT NULL,
  `cat` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_cat
-- ----------------------------
INSERT INTO `px_cat` VALUES ('1', ' ركن لغات البرمجة Programming languages', '0', '0');
INSERT INTO `px_cat` VALUES ('2', 'لغة السي C', '1', '1');
INSERT INTO `px_cat` VALUES ('3', ' لغة السي شارب #C', '1', '1');
INSERT INTO `px_cat` VALUES ('4', 'جافا Java', '1', '1');
INSERT INTO `px_cat` VALUES ('5', 'قواعد البيانات Databases', '0', '0');
INSERT INTO `px_cat` VALUES ('6', ' أوراكل Oracle', '5', '1');
INSERT INTO `px_cat` VALUES ('7', 'لغات SQL المختلفة', '5', '1');
INSERT INTO `px_cat` VALUES ('8', 'قاعدة بيانات mysql', '5', '1');
INSERT INTO `px_cat` VALUES ('9', 'ركن تطوير المواقع Website Development', '0', '0');
INSERT INTO `px_cat` VALUES ('10', 'اتش تي ام ال HTML', '9', '1');
INSERT INTO `px_cat` VALUES ('11', 'بي اتش بي PHP و MySQL', '9', '1');
INSERT INTO `px_cat` VALUES ('12', 'جافاسكربت Javascript', '9', '1');
INSERT INTO `px_cat` VALUES ('13', 'سياسة', '0', '0');
INSERT INTO `px_cat` VALUES ('14', 'اقتصاد', '0', '0');
INSERT INTO `px_cat` VALUES ('15', 'تاريخ', '0', '0');
INSERT INTO `px_cat` VALUES ('16', 'A1', '0', '0');
INSERT INTO `px_cat` VALUES ('17', 'A2', '16', '1');
INSERT INTO `px_cat` VALUES ('18', 'A3', '17', '2');
INSERT INTO `px_cat` VALUES ('19', 'A4', '18', '3');
INSERT INTO `px_cat` VALUES ('20', 'A5', '19', '4');
INSERT INTO `px_cat` VALUES ('21', 'A6', '20', '5');
INSERT INTO `px_cat` VALUES ('22', '1Z', '0', '0');
INSERT INTO `px_cat` VALUES ('23', 'z1', '22', '0');
INSERT INTO `px_cat` VALUES ('24', 'z2', '22', '0');
INSERT INTO `px_cat` VALUES ('25', 'z3', '22', '0');
INSERT INTO `px_cat` VALUES ('26', 'za1', '23', '0');
INSERT INTO `px_cat` VALUES ('27', 'za2', '23', '0');
INSERT INTO `px_cat` VALUES ('28', 'za3', '23', '0');
INSERT INTO `px_cat` VALUES ('29', 'zb1', '24', '0');
INSERT INTO `px_cat` VALUES ('30', 'zb2', '24', '0');
INSERT INTO `px_cat` VALUES ('31', 'zb3', '24', '0');
INSERT INTO `px_cat` VALUES ('32', 'zc1', '25', '0');
INSERT INTO `px_cat` VALUES ('33', 'zc2', '25', '0');
INSERT INTO `px_cat` VALUES ('34', 'zc3', '25', '0');
INSERT INTO `px_cat` VALUES ('35', 'wwwfffffff', '21', '6');

-- ----------------------------
-- Table structure for `px_country`
-- ----------------------------
DROP TABLE IF EXISTS `px_country`;
CREATE TABLE `px_country` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `english` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arabic` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of px_country
-- ----------------------------
INSERT INTO `px_country` VALUES ('1', 'ad', 'Andorra', 'أندورا');
INSERT INTO `px_country` VALUES ('2', 'ae', 'United Arab Emirates', 'الأمارات العربية المتحدة');
INSERT INTO `px_country` VALUES ('3', 'af', 'Afghanistan', 'أفغانستان');
INSERT INTO `px_country` VALUES ('4', 'ag', 'Antigua And Barbuda', 'انتيغا وباربودا');
INSERT INTO `px_country` VALUES ('5', 'ai', 'Anguilla', 'أنجويلا');
INSERT INTO `px_country` VALUES ('6', 'al', 'Albania', 'ألبانيا');
INSERT INTO `px_country` VALUES ('7', 'am', 'Armenia', 'أرمينيا');
INSERT INTO `px_country` VALUES ('8', 'ao', 'Angola', 'أنغولا');
INSERT INTO `px_country` VALUES ('9', 'aq', 'Antarctica', 'القارة القطبية الجنوبية');
INSERT INTO `px_country` VALUES ('10', 'ar', 'Argentina', 'الأرجنتين');
INSERT INTO `px_country` VALUES ('11', 'as', 'American Samoa', 'ساموا الأمريكية');
INSERT INTO `px_country` VALUES ('12', 'at', 'Austria', 'النمسا');
INSERT INTO `px_country` VALUES ('13', 'au', 'Australia', 'أستراليا');
INSERT INTO `px_country` VALUES ('14', 'aw', 'Aruba', 'أروبا');
INSERT INTO `px_country` VALUES ('15', 'ax', 'Aland Islands', 'جزر آلاند');
INSERT INTO `px_country` VALUES ('16', 'az', 'Azerbaijan', 'أذربيجان');
INSERT INTO `px_country` VALUES ('17', 'ba', 'Bosnia And Herzegovina', 'البوسنة و الهرسك');
INSERT INTO `px_country` VALUES ('18', 'bb', 'Barbados', 'بربادوس');
INSERT INTO `px_country` VALUES ('19', 'bd', 'Bangladesh', 'بنغلاديش');
INSERT INTO `px_country` VALUES ('20', 'be', 'Belgium', 'بلجيكا');
INSERT INTO `px_country` VALUES ('21', 'bf', 'Burkina Faso', 'بوركينا فاسو');
INSERT INTO `px_country` VALUES ('22', 'bg', 'Bulgaria', 'بلغاريا');
INSERT INTO `px_country` VALUES ('23', 'bh', 'Bahrain', 'البحرين');
INSERT INTO `px_country` VALUES ('24', 'bi', 'Burundi', 'بوروندي');
INSERT INTO `px_country` VALUES ('25', 'bj', 'Benin', 'بنين');
INSERT INTO `px_country` VALUES ('26', 'bl', 'Saint Barthélemy', 'سانت بارتيليمي');
INSERT INTO `px_country` VALUES ('27', 'bm', 'Bermuda', 'برمودا');
INSERT INTO `px_country` VALUES ('28', 'bn', 'Brunei Darussalam', 'بروناي دار السلام');
INSERT INTO `px_country` VALUES ('29', 'bo', 'Bolivia, Plurinational State Of', 'دولة بوليفيا المتعددة القوميات');
INSERT INTO `px_country` VALUES ('30', 'bq', 'Bonaire, Sint Eustatius And Saba', 'بونير ، و سابا سينت أوستاتيوس');
INSERT INTO `px_country` VALUES ('31', 'br', 'Brazil', 'البرازيل');
INSERT INTO `px_country` VALUES ('32', 'bs', 'Bahamas', 'جزر البهاما');
INSERT INTO `px_country` VALUES ('33', 'bt', 'Bhutan', 'بوتان');
INSERT INTO `px_country` VALUES ('34', 'bv', 'Bouvet Island', 'جزيرة بوفيت');
INSERT INTO `px_country` VALUES ('35', 'bw', 'Botswana', 'بوتسوانا');
INSERT INTO `px_country` VALUES ('36', 'by', 'Belarus', 'روسيا البيضاء');
INSERT INTO `px_country` VALUES ('37', 'bz', 'Belize', 'بليز');
INSERT INTO `px_country` VALUES ('38', 'ca', 'Canada', 'كندا');
INSERT INTO `px_country` VALUES ('39', 'cc', 'Cocos (Keeling) Islands', 'كوكوس ( كيلينغ ) جزر');
INSERT INTO `px_country` VALUES ('40', 'cd', 'Congo, The Democratic Republic Of The', 'الكونغو ، جمهورية الكونغو الديمقراطية');
INSERT INTO `px_country` VALUES ('41', 'cf', 'Central African Republic', 'جمهورية أفريقيا الوسطى');
INSERT INTO `px_country` VALUES ('42', 'cg', 'Congo', 'الكونغو');
INSERT INTO `px_country` VALUES ('43', 'ch', 'Switzerland', 'سويسرا');
INSERT INTO `px_country` VALUES ('44', 'ck', 'Cook Islands', 'جزر كوك');
INSERT INTO `px_country` VALUES ('45', 'cl', 'Chile', 'شيلي');
INSERT INTO `px_country` VALUES ('46', 'cm', 'Cameroon', 'الكاميرون');
INSERT INTO `px_country` VALUES ('47', 'cn', 'China', 'الصين');
INSERT INTO `px_country` VALUES ('48', 'co', 'Colombia', 'كولومبيا');
INSERT INTO `px_country` VALUES ('49', 'cr', 'Costa Rica', 'كوستاريكا');
INSERT INTO `px_country` VALUES ('50', 'cu', 'Cuba', 'كوبا');
INSERT INTO `px_country` VALUES ('51', 'cv', 'Cape Verde', 'الرأس الأخضر');
INSERT INTO `px_country` VALUES ('52', 'cw', 'Curaçao', 'كوراساو');
INSERT INTO `px_country` VALUES ('53', 'cx', 'Christmas Island', 'جزيرة عيد الميلاد');
INSERT INTO `px_country` VALUES ('54', 'cy', 'Cyprus', 'قبرص');
INSERT INTO `px_country` VALUES ('55', 'cz', 'Czech Republic', 'الجمهورية التشيكية');
INSERT INTO `px_country` VALUES ('56', 'de', 'Germany', 'ألمانيا');
INSERT INTO `px_country` VALUES ('57', 'dj', 'Djibouti', 'جيبوتي');
INSERT INTO `px_country` VALUES ('58', 'dk', 'Denmark', 'الدنمارك');
INSERT INTO `px_country` VALUES ('59', 'dm', 'Dominica', 'دومينيكا');
INSERT INTO `px_country` VALUES ('60', 'do', 'Dominican Republic', 'جمهورية الدومينيكان');
INSERT INTO `px_country` VALUES ('61', 'dz', 'Algeria', 'الجزائر');
INSERT INTO `px_country` VALUES ('62', 'ec', 'Ecuador', 'الإكوادور');
INSERT INTO `px_country` VALUES ('63', 'ee', 'Estonia', 'استونيا');
INSERT INTO `px_country` VALUES ('64', 'eg', 'Egypt', 'مصر');
INSERT INTO `px_country` VALUES ('65', 'eh', 'Western Sahara', 'الصحراء الغربية');
INSERT INTO `px_country` VALUES ('66', 'er', 'Eritrea', 'إريتريا');
INSERT INTO `px_country` VALUES ('67', 'es', 'Spain', 'إسبانيا');
INSERT INTO `px_country` VALUES ('68', 'et', 'Ethiopia', 'أثيوبيا');
INSERT INTO `px_country` VALUES ('69', 'fi', 'Finland', 'فنلندا');
INSERT INTO `px_country` VALUES ('70', 'fj', 'Fiji', 'فيجي');
INSERT INTO `px_country` VALUES ('71', 'fk', 'Falkland Islands (Malvinas)', 'جزر فوكلاند ( مالفيناس )');
INSERT INTO `px_country` VALUES ('72', 'fm', 'Micronesia, Federated States Of', 'ولايات ميكرونيزيا الموحدة من');
INSERT INTO `px_country` VALUES ('73', 'fo', 'Faroe Islands', 'جزر فارو');
INSERT INTO `px_country` VALUES ('74', 'fr', 'France', 'فرنسا');
INSERT INTO `px_country` VALUES ('75', 'ga', 'Gabon', 'الغابون');
INSERT INTO `px_country` VALUES ('76', 'gb', 'United Kingdom', 'المملكة المتحدة');
INSERT INTO `px_country` VALUES ('77', 'gd', 'Grenada', 'غرينادا');
INSERT INTO `px_country` VALUES ('78', 'ge', 'Georgia', 'جورجيا');
INSERT INTO `px_country` VALUES ('79', 'gf', 'French Guiana', 'جويانا الفرنسية');
INSERT INTO `px_country` VALUES ('80', 'gg', 'Guernsey', 'غيرنسي');
INSERT INTO `px_country` VALUES ('81', 'gh', 'Ghana', 'غانا');
INSERT INTO `px_country` VALUES ('82', 'gi', 'Gibraltar', 'جبل طارق');
INSERT INTO `px_country` VALUES ('83', 'gl', 'Greenland', 'جرينلاند');
INSERT INTO `px_country` VALUES ('84', 'gm', 'Gambia', 'غامبيا');
INSERT INTO `px_country` VALUES ('85', 'gn', 'Guinea', 'غينيا');
INSERT INTO `px_country` VALUES ('86', 'gp', 'Guadeloupe', 'غوادلوب');
INSERT INTO `px_country` VALUES ('87', 'gq', 'Equatorial Guinea', 'غينيا الاستوائية');
INSERT INTO `px_country` VALUES ('88', 'gr', 'Greece', 'يونان');
INSERT INTO `px_country` VALUES ('89', 'gs', 'South Georgia And The South Sandwich Islands', 'جورجيا الجنوبية و جزر ساندويتش الجنوبية');
INSERT INTO `px_country` VALUES ('90', 'gt', 'Guatemala', 'غواتيمالا');
INSERT INTO `px_country` VALUES ('91', 'gu', 'Guam', 'غوام');
INSERT INTO `px_country` VALUES ('92', 'gw', 'Guinea-Bissau', 'غينيا بيساو');
INSERT INTO `px_country` VALUES ('93', 'gy', 'Guyana', 'غيانا');
INSERT INTO `px_country` VALUES ('94', 'hk', 'Hong Kong', 'هونغ كونغ');
INSERT INTO `px_country` VALUES ('95', 'hm', 'Heard Island And McDonald Islands', 'جزيرة هيرد و جزر ماكدونالد');
INSERT INTO `px_country` VALUES ('96', 'hn', 'Honduras', 'هندوراس');
INSERT INTO `px_country` VALUES ('97', 'hr', 'Croatia', 'كرواتيا');
INSERT INTO `px_country` VALUES ('98', 'ht', 'Haiti', 'هايتي');
INSERT INTO `px_country` VALUES ('99', 'hu', 'Hungary', 'هنغاريا');
INSERT INTO `px_country` VALUES ('100', 'id', 'Indonesia', 'أندونيسيا');
INSERT INTO `px_country` VALUES ('101', 'ie', 'Ireland', 'ايرلندا');
INSERT INTO `px_country` VALUES ('102', 'il', 'Israel', 'إسرائيل');
INSERT INTO `px_country` VALUES ('103', 'im', 'Isle Of Man', 'جزيرة آيل أوف مان');
INSERT INTO `px_country` VALUES ('104', 'in', 'India', 'الهند');
INSERT INTO `px_country` VALUES ('105', 'io', 'British Indian Ocean Territory', 'إقليم المحيط الهندي البريطاني');
INSERT INTO `px_country` VALUES ('106', 'iq', 'Iraq', 'العراق');
INSERT INTO `px_country` VALUES ('107', 'ir', 'Iran, Islamic Republic Of', 'جمهورية إيران الإسلامية');
INSERT INTO `px_country` VALUES ('108', 'is', 'Iceland', 'أيسلندا');
INSERT INTO `px_country` VALUES ('109', 'it', 'Italy', 'إيطاليا');
INSERT INTO `px_country` VALUES ('110', 'je', 'Jersey', 'جيرسي');
INSERT INTO `px_country` VALUES ('111', 'jm', 'Jamaica', 'جامايكا');
INSERT INTO `px_country` VALUES ('112', 'jo', 'Jordan', 'الأردن');
INSERT INTO `px_country` VALUES ('113', 'jp', 'Japan', 'اليابان');
INSERT INTO `px_country` VALUES ('114', 'ke', 'Kenya', 'كينيا');
INSERT INTO `px_country` VALUES ('115', 'kg', 'Kyrgyzstan', 'قرغيزستان');
INSERT INTO `px_country` VALUES ('116', 'kh', 'Cambodia', 'كمبوديا');
INSERT INTO `px_country` VALUES ('117', 'ki', 'Kiribati', 'كيريباتي');
INSERT INTO `px_country` VALUES ('118', 'km', 'Comoros', 'جزر القمر');
INSERT INTO `px_country` VALUES ('119', 'kn', 'Saint Kitts And Nevis', 'سانت كيتس ونيفيس');
INSERT INTO `px_country` VALUES ('120', 'kr', 'Korea, Republic Of', 'جمهورية كوريا');
INSERT INTO `px_country` VALUES ('121', 'kw', 'Kuwait', 'الكويت');
INSERT INTO `px_country` VALUES ('122', 'ky', 'Cayman Islands', 'جزر كايمان');
INSERT INTO `px_country` VALUES ('123', 'kz', 'Kazakhstan', 'كازاخستان');
INSERT INTO `px_country` VALUES ('124', 'lb', 'Lebanon', 'لبنان');
INSERT INTO `px_country` VALUES ('125', 'lc', 'Saint Lucia', 'سانت لوسيا');
INSERT INTO `px_country` VALUES ('126', 'li', 'Liechtenstein', 'ليختنشتاين');
INSERT INTO `px_country` VALUES ('127', 'lk', 'Sri Lanka', 'سري ل انكا');
INSERT INTO `px_country` VALUES ('128', 'lr', 'Liberia', 'ليبيريا');
INSERT INTO `px_country` VALUES ('129', 'ls', 'Lesotho', 'ليسوتو');
INSERT INTO `px_country` VALUES ('130', 'lt', 'Lithuania', 'ليتوانيا');
INSERT INTO `px_country` VALUES ('131', 'lu', 'Luxembourg', 'لوكسمبورغ');
INSERT INTO `px_country` VALUES ('132', 'lv', 'Latvia', 'لاتفيا');
INSERT INTO `px_country` VALUES ('133', 'ly', 'Libya', 'ليبيا');
INSERT INTO `px_country` VALUES ('134', 'ma', 'Morocco', 'مغربي');
INSERT INTO `px_country` VALUES ('135', 'mc', 'Monaco', 'موناكو');
INSERT INTO `px_country` VALUES ('136', 'md', 'Moldova, Republic Of', 'جمهورية مولدوفا');
INSERT INTO `px_country` VALUES ('137', 'me', 'Montenegro', 'الجبل الأسود');
INSERT INTO `px_country` VALUES ('138', 'mf', 'Saint Martin (French Part)', 'سانت مارتن (الجزء الفرنسية )');
INSERT INTO `px_country` VALUES ('139', 'mg', 'Madagascar', 'مدغشقر');
INSERT INTO `px_country` VALUES ('140', 'mh', 'Marshall Islands', 'جزر مارشال');
INSERT INTO `px_country` VALUES ('141', 'mk', 'Macedonia, The Former Yugoslav Republic Of', 'مقدونيا، الجمهورية اليوغوسلافية السابقة');
INSERT INTO `px_country` VALUES ('142', 'ml', 'Mali', 'مالي');
INSERT INTO `px_country` VALUES ('143', 'mm', 'Myanmar', 'ميانمار');
INSERT INTO `px_country` VALUES ('144', 'mn', 'Mongolia', 'منغوليا');
INSERT INTO `px_country` VALUES ('145', 'mo', 'Macao', 'ماكاو');
INSERT INTO `px_country` VALUES ('146', 'mp', 'Northern Mariana Islands', 'جزر ماريانا الشمالية');
INSERT INTO `px_country` VALUES ('147', 'mq', 'Martinique', 'مارتينيك');
INSERT INTO `px_country` VALUES ('148', 'mr', 'Mauritania', 'موريتانيا');
INSERT INTO `px_country` VALUES ('149', 'ms', 'Montserrat', 'مونتسيرات');
INSERT INTO `px_country` VALUES ('150', 'mt', 'Malta', 'مالطا');
INSERT INTO `px_country` VALUES ('151', 'mu', 'Mauritius', 'موريشيوس');
INSERT INTO `px_country` VALUES ('152', 'mv', 'Maldives', 'جزر المالديف');
INSERT INTO `px_country` VALUES ('153', 'mw', 'Malawi', 'مالاوي');
INSERT INTO `px_country` VALUES ('154', 'mx', 'Mexico', 'المكسيك');
INSERT INTO `px_country` VALUES ('155', 'my', 'Malaysia', 'ماليزيا');
INSERT INTO `px_country` VALUES ('156', 'mz', 'Mozambique', 'موزمبيق');
INSERT INTO `px_country` VALUES ('157', 'na', 'Namibia', 'ناميبيا');
INSERT INTO `px_country` VALUES ('158', 'nc', 'New Caledonia', 'كاليدونيا الجديدة');
INSERT INTO `px_country` VALUES ('159', 'ne', 'Niger', 'النيجر');
INSERT INTO `px_country` VALUES ('160', 'nf', 'Norfolk Island', 'جزيرة نورفولك');
INSERT INTO `px_country` VALUES ('161', 'ng', 'Nigeria', 'نيجيريا');
INSERT INTO `px_country` VALUES ('162', 'ni', 'Nicaragua', 'نيكاراغوا');
INSERT INTO `px_country` VALUES ('163', 'nl', 'Netherlands', 'هولندا');
INSERT INTO `px_country` VALUES ('164', 'no', 'Norway', 'النرويج');
INSERT INTO `px_country` VALUES ('165', 'np', 'Nepal', 'نيبال');
INSERT INTO `px_country` VALUES ('166', 'nr', 'Nauru', 'ناورو');
INSERT INTO `px_country` VALUES ('167', 'nu', 'Niue', 'نيوي');
INSERT INTO `px_country` VALUES ('168', 'nz', 'New Zealand', 'نيوزيلندا');
INSERT INTO `px_country` VALUES ('169', 'om', 'Oman', 'عمان');
INSERT INTO `px_country` VALUES ('170', 'pa', 'Panama', 'بنما ');
INSERT INTO `px_country` VALUES ('171', 'pe', 'Peru', 'بيرو');
INSERT INTO `px_country` VALUES ('172', 'pf', 'French Polynesia', 'بولينيزيا الفرنسية');
INSERT INTO `px_country` VALUES ('173', 'pg', 'Papua New Guinea', 'بابوا غينيا الجديدة');
INSERT INTO `px_country` VALUES ('174', 'ph', 'Philippines', 'الفلبين');
INSERT INTO `px_country` VALUES ('175', 'pk', 'Pakistan', 'باكستان');
INSERT INTO `px_country` VALUES ('176', 'pl', 'Poland', 'بولندا');
INSERT INTO `px_country` VALUES ('177', 'pm', 'Saint Pierre And Miquelon', 'سان بيار و ميكلون');
INSERT INTO `px_country` VALUES ('178', 'pn', 'Pitcairn', 'بيتكيرن');
INSERT INTO `px_country` VALUES ('179', 'pr', 'Puerto Rico', 'بورتوريكو');
INSERT INTO `px_country` VALUES ('180', 'ps', 'Palestine, State Of', 'فلسطين، دولة');
INSERT INTO `px_country` VALUES ('181', 'pt', 'Portugal', 'البرتغال');
INSERT INTO `px_country` VALUES ('182', 'pw', 'Palau', 'بالاو');
INSERT INTO `px_country` VALUES ('183', 'py', 'Paraguay', 'باراغواي');
INSERT INTO `px_country` VALUES ('184', 'qa', 'Qatar', 'قطر');
INSERT INTO `px_country` VALUES ('185', 're', 'Réunion', 'ريونيون');
INSERT INTO `px_country` VALUES ('186', 'ro', 'Romania', 'رومانيا');
INSERT INTO `px_country` VALUES ('187', 'rs', 'Serbia', 'صربيا');
INSERT INTO `px_country` VALUES ('188', 'ru', 'Russian Federation', 'الاتحاد الروسي');
INSERT INTO `px_country` VALUES ('189', 'rw', 'Rwanda', 'رواندا');
INSERT INTO `px_country` VALUES ('190', 'sa', 'Saudi Arabia', 'السعودية');
INSERT INTO `px_country` VALUES ('191', 'sb', 'Solomon Islands', 'جزر سليمان');
INSERT INTO `px_country` VALUES ('192', 'sc', 'Seychelles', 'سيشيل');
INSERT INTO `px_country` VALUES ('193', 'sd', 'Sudan', 'سودان');
INSERT INTO `px_country` VALUES ('194', 'se', 'Sweden', 'السويد');
INSERT INTO `px_country` VALUES ('195', 'sg', 'Singapore', 'سنغافورة');
INSERT INTO `px_country` VALUES ('196', 'sh', 'Saint Helena, Ascension And Tristan Da Cunha', 'سانت هيلانة وأسنسيون و تريستان دا كونها');
INSERT INTO `px_country` VALUES ('197', 'si', 'Slovenia', 'سلوفينيا');
INSERT INTO `px_country` VALUES ('198', 'sj', 'Svalbard And Jan Mayen', 'سفالبارد');
INSERT INTO `px_country` VALUES ('199', 'sk', 'Slovakia', 'سلوفاكيا');
INSERT INTO `px_country` VALUES ('200', 'sl', 'Sierra Leone', 'سيراليون');
INSERT INTO `px_country` VALUES ('201', 'sm', 'San Marino', 'سان مارينو');
INSERT INTO `px_country` VALUES ('202', 'sn', 'Senegal', 'السنغال');
INSERT INTO `px_country` VALUES ('203', 'so', 'Somalia', 'الصومال');
INSERT INTO `px_country` VALUES ('204', 'sr', 'Suriname', 'سورينام');
INSERT INTO `px_country` VALUES ('205', 'ss', 'South Sudan', 'جنوب السودان');
INSERT INTO `px_country` VALUES ('206', 'st', 'Sao Tome And Principe', 'ساو تومي و برينسيبي');
INSERT INTO `px_country` VALUES ('207', 'sv', 'El Salvador', 'السلفادور');
INSERT INTO `px_country` VALUES ('208', 'sx', 'Sint Maarten (Dutch Part)', 'سانت مارتن (الجزء الهولندي )');
INSERT INTO `px_country` VALUES ('209', 'sy', 'Syrian Arab Republic', 'الجمهورية العربية السورية');
INSERT INTO `px_country` VALUES ('210', 'sz', 'Swaziland', 'سوازيلاند');
INSERT INTO `px_country` VALUES ('211', 'tc', 'Turks And Caicos Islands', 'جزر تركس و كايكوس');
INSERT INTO `px_country` VALUES ('212', 'td', 'Chad', 'تشاد');
INSERT INTO `px_country` VALUES ('213', 'tf', 'French Southern Territories', 'الأقاليم الجنوبية الفرنسية');
INSERT INTO `px_country` VALUES ('214', 'tg', 'Togo', 'توغو');
INSERT INTO `px_country` VALUES ('215', 'th', 'Thailand', 'تايلاند');
INSERT INTO `px_country` VALUES ('216', 'tj', 'Tajikistan', 'طاجيكستان');
INSERT INTO `px_country` VALUES ('217', 'tk', 'Tokelau', 'توكيلاو');
INSERT INTO `px_country` VALUES ('218', 'tl', 'Timor-Leste', 'تيمور الشرقية');
INSERT INTO `px_country` VALUES ('219', 'tm', 'Turkmenistan', 'تركمانستان ');
INSERT INTO `px_country` VALUES ('220', 'tn', 'Tunisia', 'تونس');
INSERT INTO `px_country` VALUES ('221', 'to', 'Tonga', 'تونغا');
INSERT INTO `px_country` VALUES ('222', 'tr', 'Turkey', 'تركيا');
INSERT INTO `px_country` VALUES ('223', 'tt', 'Trinidad And Tobago', 'ترينيداد وتوباغو');
INSERT INTO `px_country` VALUES ('224', 'tv', 'Tuvalu', 'توفالو');
INSERT INTO `px_country` VALUES ('225', 'tw', 'Taiwan, Province Of China', 'مقاطعة تايوان الصينية');
INSERT INTO `px_country` VALUES ('226', 'tz', 'Tanzania, United Republic Of', 'جمهورية تنزانيا المتحدة');
INSERT INTO `px_country` VALUES ('227', 'ua', 'Ukraine', 'أوكرانيا');
INSERT INTO `px_country` VALUES ('228', 'ug', 'Uganda', 'أوغندا');
INSERT INTO `px_country` VALUES ('229', 'um', 'United States Minor Outlying Islands', 'جزر الولايات المتحدة البعيدة الصغيرة');
INSERT INTO `px_country` VALUES ('230', 'us', 'United States', 'الولايات المتحدة');
INSERT INTO `px_country` VALUES ('231', 'uy', 'Uruguay', 'أوروغواي');
INSERT INTO `px_country` VALUES ('232', 'uz', 'Uzbekistan', 'أوزبكستان');
INSERT INTO `px_country` VALUES ('233', 'va', 'Holy See (Vatican City State)', ' دولة الفاتيكان ');
INSERT INTO `px_country` VALUES ('234', 'vc', 'Saint Vincent And The Grenadines', 'سانت فنسنت وجزر غرينادين');
INSERT INTO `px_country` VALUES ('235', 've', 'Venezuela, Bolivarian Republic Of', 'فنزويلا ، جمهورية البوليفارية');
INSERT INTO `px_country` VALUES ('236', 'vg', 'Virgin Islands, British', 'جزر العذراء البريطانية');
INSERT INTO `px_country` VALUES ('237', 'vi', 'Virgin Islands, U.S.', 'جزر العذراء الأميركية،');
INSERT INTO `px_country` VALUES ('238', 'vn', 'VietNam', 'فيتنام');
INSERT INTO `px_country` VALUES ('239', 'vu', 'Vanuatu', 'فانواتو');
INSERT INTO `px_country` VALUES ('240', 'wf', 'Wallis And Futuna', 'والس وفوتونا');
INSERT INTO `px_country` VALUES ('241', 'ws', 'Samoa', 'ساموا');
INSERT INTO `px_country` VALUES ('242', 'ye', 'Yemen', 'يمني');
INSERT INTO `px_country` VALUES ('243', 'yt', 'Mayotte', 'مايوت');
INSERT INTO `px_country` VALUES ('244', 'za', 'South Africa', 'جنوب أفريقيا');
INSERT INTO `px_country` VALUES ('245', 'zm', 'Zambia', 'زامبيا');
INSERT INTO `px_country` VALUES ('246', 'zw', 'Zimbabwe', 'زيمبابوي');

-- ----------------------------
-- Table structure for `px_members`
-- ----------------------------
DROP TABLE IF EXISTS `px_members`;
CREATE TABLE `px_members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(230) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `IsSelected` enum('false','true') DEFAULT 'false',
  `FavIT` enum('YES','NO') DEFAULT 'NO',
  `FavAd` enum('YES','NO') DEFAULT 'NO',
  `FavHis` enum('YES','NO') DEFAULT 'NO',
  `FavPo` enum('YES','NO') DEFAULT 'NO',
  `FavSc` enum('YES','NO') DEFAULT 'NO',
  `Admin` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_members
-- ----------------------------
INSERT INTO `px_members` VALUES ('1', 'a', 'aa@sadas', 'ae', 'male', 'false', '', '', '', '', '', '0');
INSERT INTO `px_members` VALUES ('2', 'ww', 'ewrewrew2@d', 'ae', 'male', 'false', '', '', '', '', '', '0');
INSERT INTO `px_members` VALUES ('3', 'osama_eg@outlook.com', '25bbdcd06c32d477f7fa1c3e4a91b032', 'eg', 'male', 'false', '', 'YES', 'YES', 'YES', 'YES', '1');
INSERT INTO `px_members` VALUES ('4', 'aa@asdsa', '4124bc0a9335c27f086f', 'ae', 'male', 'false', '', '', '', '', '', '0');
INSERT INTO `px_members` VALUES ('5', 'dsfdsss@sdsdd', '4124bc0a9335c27f086f', 'ae', 'male', 'false', '', '', '', '', '', '0');
INSERT INTO `px_members` VALUES ('6', 'ali@yahoo.com', '4124bc0a9335c27f086f', 'eg', 'female', 'false', '', '', '', '', '', '0');
INSERT INTO `px_members` VALUES ('7', 'mm@mm.com', 'c4ca4238a0b923820dcc', 'ae', 'female', 'false', '', '', '', '', '', '0');
INSERT INTO `px_members` VALUES ('8', 'ap@ss.com', '47bce5c74f589f4867db', 'ae', 'female', 'false', 'YES', 'YES', 'YES', 'YES', 'NO', '0');
INSERT INTO `px_members` VALUES ('9', 'gg@hotmail.com', 'c6f057b86584942e415435ffb1fa93d4', 'ae', 'female', 'false', 'YES', '', '', 'YES', 'YES', '0');
INSERT INTO `px_members` VALUES ('10', 'ahmed@yahoo.com', 'c6f057b86584942e415435ffb1fa93d4', 'ad', 'female', 'false', 'YES', '', 'YES', 'YES', '', '0');
INSERT INTO `px_members` VALUES ('11', 'ko@yahoo.com', 'c6f057b86584942e415435ffb1fa93d4', 'al', 'female', 'false', '', 'YES', '', '', '', '0');
INSERT INTO `px_members` VALUES ('13', 'aasdasdasdasdasdasdasWW@sadsad.com', 'c6f057b86584942e415435ffb1fa93d4', 'ae', 'male', 'false', 'YES', 'YES', 'YES', 'YES', 'YES', '1');

-- ----------------------------
-- Table structure for `px_message`
-- ----------------------------
DROP TABLE IF EXISTS `px_message`;
CREATE TABLE `px_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `message_dat` date DEFAULT NULL,
  `read` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of px_message
-- ----------------------------
INSERT INTO `px_message` VALUES ('1', 'احمد علي', 'ahmed@yahoo.com', 'رءؤر', 'this is message', '2014-03-28', '0');
INSERT INTO `px_message` VALUES ('2', 'علي عبد الواحد', 'kr@hotmail.com', 'ؤءرءؤ', 'test', '2014-03-28', '0');
INSERT INTO `px_message` VALUES ('3', 'asdsa', 'sadas@sdasd', 'aa', 'aa', '0000-00-00', '0');
INSERT INTO `px_message` VALUES ('4', 'سشيشسي', 'asdsa@sdas.com', 'sdf', 'dsf', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('5', 'ali@yahoo.com', 'ali@yahoo.com', 'ali@yahoo.com', 'ali@yahoo.com', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('6', 'smtp', 'smtp@ss.com', 's', 's', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('7', 'asdasdas', 'ali@yahoo.com', 'a', 'a', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('8', 'asdasdas', 'ali@yahoo.com', 'a', 'a', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('9', 'dsfsdfds', 'dfsdfds@safsdf.com', 'sdfd', 'dsf', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('10', 'ewrewr', 'wer@fdsf', 'sfsd', 'df', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('11', 'asdasdas', 'ali@yahoo.com', 'a', 'a', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('12', 'asdasdas', 'asdsa@sdas.com', 'a', 'a', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('13', 'sadas', 'smtp@ss.com', 'a', 'aaaa', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('14', 'sadas', 'sadas@sdasd', 'aa', 'sasd', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('15', 'asdas', 'asdasd@sdsad', 'asd', 'sadas', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('16', 'sadsa', 'asdasd@sdsad', 'a', 'aaa', '2014-09-11', '0');
INSERT INTO `px_message` VALUES ('17', 'sadas', 'sdsds@ssad.com', 'sdsd', 'sdas', '2014-09-11', '1');
INSERT INTO `px_message` VALUES ('18', 'ش', null, 'سشيشسي', null, null, '0');
INSERT INTO `px_message` VALUES ('19', 'سيش', null, 'سشيشسي', null, null, '0');
INSERT INTO `px_message` VALUES ('20', 'سي', null, 'شسي', null, null, '0');
INSERT INTO `px_message` VALUES ('21', 'شسي', null, 'يشسيشسيشسي', null, null, '0');
INSERT INTO `px_message` VALUES ('22', 'شسي', null, 'شسيشسيشس', null, null, '0');
INSERT INTO `px_message` VALUES ('23', 'شسي', null, 'شسيسشيشسي', null, null, '0');
INSERT INTO `px_message` VALUES ('24', 'شسي', null, 'شيشسيشسي', null, null, '0');
INSERT INTO `px_message` VALUES ('25', 'شس', null, 'يسشيسشيس', null, null, '0');
INSERT INTO `px_message` VALUES ('26', 'يشسيش', null, 'شسيشسيشس', null, null, '0');
INSERT INTO `px_message` VALUES ('27', 'سيشسي', null, 'يشسيشسيشسي', null, null, '1');
INSERT INTO `px_message` VALUES ('28', 'شسي', null, 'يشسيسش', null, null, '0');
INSERT INTO `px_message` VALUES ('29', 'شس', null, 'يشسسش', null, null, '0');
INSERT INTO `px_message` VALUES ('30', 'يشس', 'osama_eg@outlook.com', 'hi osama', 'this is message now', '2014-09-30', '1');

-- ----------------------------
-- Table structure for `px_options`
-- ----------------------------
DROP TABLE IF EXISTS `px_options`;
CREATE TABLE `px_options` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `mail_sendmail` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_sender` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_smtp` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_received` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_server` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_port` int(11) DEFAULT NULL,
  `mail_user` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_pwd` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_type` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_title` text COLLATE utf8_unicode_ci,
  `msg_content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of px_options
-- ----------------------------
INSERT INTO `px_options` VALUES ('1', 'retr', 'باعت بريد', 'smtp.gmail.com', 'osama_eg@outlook.com', 'smtp', '587', 'mr.osama.eg@gmail.com', '0022009#d', 'html', 'tls', 'أهداف المكتبة ووظائفها', '<p>هدف المكتبة إلى توفير المعلومات المناسبة وإيصالها إلى المستفيدين في الوقت المناسب بشكل عام والى بناء مجموعات متوازنة من الكتب وأوعية المعلومات الأخرى وذلك لمساندة برامج الكلية الدراسية وأنشطة البحوث وتنظيم هذه المجموعات وتقديمها للباحثين والمستفيدين باستخدام وسائل الاسترجاع التقليدية وغير التقليدية ( الالكترونية ) الحديثة . -:ويتم تحقيق هذه الأهداف من خلال الوظائف والعمليات التالية توفير مجموعة غنية وحديثة من مصادر المعلومات المتخصصة وتنظيمها وإتاحتها للاستخدام نشر المعلومات الجديدة والمهمة بين المتخصصين في الكلية تقديم الخدمات المكتبية والمعلوماتية المناسبة المساهمة في نشر وحفظ وتنظيم واسترجاع المطبوعات التي تنشرها الكلية التعاون مع المكتبات الأخرى ذات الاختصاص</p>');

-- ----------------------------
-- Table structure for `px_page`
-- ----------------------------
DROP TABLE IF EXISTS `px_page`;
CREATE TABLE `px_page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  `content` text,
  `isSelected` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_page
-- ----------------------------
INSERT INTO `px_page` VALUES ('1', 'عن الموقع', '<p>هدف المكتبة إلى توفير المعلومات المناسبة وإيصالها إلى المستفيدين في الوقت المناسب بشكل عام والى بناء مجموعات متوازنة من الكتب وأوعية المعلومات الأخرى وذلك لمساندة برامج الكلية الدراسية وأنشطة البحوث وتنظيم هذه المجموعات وتقديمها للباحثين والمستفيدين باستخدام وسائل الاسترجاع التقليدية وغير التقليدية ( الالكترونية ) الحديثة . -:ويتم تحقيق هذه الأهداف من خلال الوظائف والعمليات التالية توفير مجموعة غنية وحديثة من مصادر المعلومات المتخصصة وتنظيمها وإتاحتها للاستخدام نشر المعلومات الجديدة والمهمة بين المتخصصين في الكلية تقديم الخدمات المكتبية والمعلوماتية المناسبة المساهمة في نشر وحفظ وتنظيم واسترجاع المطبوعات التي تنشرها الكلية التعاون مع المكتبات الأخرى ذات الاختصاص</p>', 'false');
INSERT INTO `px_page` VALUES ('2', 'أعلن معنا', '<p><br />&nbsp;ما يميز أعلانك معنا<br /><br />&nbsp;&nbsp;&nbsp; معدل الزوار باليوم يتجاوز الـ 2 مليون زائر !<br />&nbsp;&nbsp;&nbsp; الزوار متجددون بنسبة 70% تقريبا !<br />&nbsp;&nbsp;&nbsp; أكثر من 60% تقريبا من الزوار من دول الخليج !<br />&nbsp;&nbsp;&nbsp; من افضل 5 مواقع على مستوى المملكة العربية السعودية !<br />&nbsp;&nbsp;&nbsp; ترتيب الموقع على مستوى المواقع السعودية تقريبا هو 2 !<br />&nbsp;&nbsp;&nbsp; الموقع يملك شهرة واسعة جدا على مستوى المواقع العربية وترتيبه عربيا قرابة الـ 2 !! !</p>', 'false');
INSERT INTO `px_page` VALUES ('3', 'ركن المساعدة', '<p style=\"text-align: justify;\"><span style=\"font-family: tahoma, geneva, sans-serif; font-size: 14px;\">- بناء وتنمية المجموعات المعلوماتية بما يضمن توفير مصادر المعلومات اللازمة من الكتب والمخطوطات والدوريات والرسائل العلمية وغير ذلك من أوعية المعلومات المتنوعة والتي تمكن الجامعة من القيام &nbsp;بمهامها في البحث والدراسة والتعليم والتثقيف.</span></p>\n<p style=\"text-align: justify;\">&nbsp;</p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">2- تجميع الرسائل العلميه المجازة لدرجتي الماجستير والدكتوراه التى تم منحها من الجامعة, واقتناء نسخه من اشرطة تسجيل فعاليات المناقشات العلنية لرسائل الماجستير والدكتوراه المجازة من الجامعة واقتناء نسخة الكترونية لهذه الرسائل على أقراص مدمجه (CD&nbsp;) بالاضافة الى النسخ المطبوعة&nbsp;وذلك من خلال إلزام طلاب الدراسات العليا بتسليم عدد (2) نسخه مطبوعة و (1) شريط فيديو ، و (1) قرص مدمج من رسائلهم &nbsp;للمكتبة.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">3-&nbsp;إنشاء مكتبة سمعية وبصرية والكترونية لذوى الاحتياجات الخاصة.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">&nbsp;4-&nbsp;تنظيم مجموعات المكتبة بما في ذلك عمليات التسجيل والتصنيف والفهرسة والترفيف والتكشيف والاستخلاص &nbsp;والحوسبة وغيرها من العمليات التي تكفل ضبط هذه المجموعات وحفظها وتحليلها وتكشيفها وصيانتها وتيسير حصول المستفيدين على ما يريدون من مقالات وبحوث و مراجع ودوريات وكتب وغيرها من مصادر المعرفة وأوعية المعلومات .</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">5- &nbsp;الربط الآلي بين مكتبات كليات الجامعة للإفادة من مقتنياتها وخدماتها وذلك تيسيرا على الباحثين ولترشيد سياسة الاختيار والشراء والربط الآلي مع مكتبات الجامعات الأردنية الرسمية وشبكات المكتبات والمعلومات المثيلة للتعاون والإفادة.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-family: tahoma, geneva, sans-serif; font-size: 14px;\">6- تقديم الخدمات المكتبة والمرجعية واسترجاع المعلومات، وما يشمل ذلك من الإرشاد المكتبي &nbsp;وإصدار القوائم الببليوجرافية اللازمة وتقديم خدمات الإعارة والتصوير والنسخ والإحاطة الجارية والبث الإنتقائي وخدمات الإنترنت وقواعد البيانات والأرشفة الإلكترونية&nbsp; والتدريب وغيرها &nbsp;ومعاونة رواد المكتبة وتوجيههم نحو الإفادة الأمثل من المجموعات المتوفرة.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">7- تعزيز حركة البحث العلمي والمساهمة في نشر المعلومات الجديدة والمهمة بين المختصين والمساهمة&nbsp;في نقل التراث الفكري العلمي وذلك بتبادل الأبحاث العلمية والمعلومات التي تساعدالطالب الباحث والأستاذ على أداء رسالته العلمية ومعرفة مدى ما وصلت إليه المجتمعات&nbsp;الأخرى من تقدم في مجالات المعرفة المختلفة.&nbsp;</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">8- التعاون والتنسيق مع المكتبات الأخرى داخل الدولة وخارجها للوصول إلى مصادر المعلومات الضرورية وتبادلها والمشاركة في شبكات المعلومات المحلية والوطنية والإقليمية والدولية.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">&nbsp;9- تزويد الطلاب والدارسين بالثقافة المكتبية الأساسية لتمكينهم من الوصول إلى الاستفادة المثلى من مقتنيات المكتبة وأوعية معلوماتها.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">10- الاشراف&nbsp;والمتابعة والتوجيه الإداري والفني على مكتبات الفروع وإعداد البرامج التدريبية اللازمة للعاملين بها و تطوير العمل المكتبي، وتحسين الأداء الوظيفي والإعلامي والتوثيقي من خلال الدورات وإقامة المعارض وتنظيم المؤتمرات والملتقيات والندوات العلمية وغيرها من الأنشطة المطلوبة.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">11- دراسة المستفيدين من الخدمات المكتبية، أي القراء، بمختلف فئاتهم، ومعرفة اتجاهاتهم القرائية، بهدف تلبية طلباتهم وحاجاتهم المعرفية والمعلوماتية على أفضل وجه.</span></p>\n<p style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">12- المحافظة على مقتنيات المكتبة ومصادرها المعلوماتية .</span></p>', 'false');
INSERT INTO `px_page` VALUES ('4', 'سؤال وجواب', '<p>سؤال وجواب</p>', 'false');
INSERT INTO `px_page` VALUES ('5', 'كلمة المدير', '<div style=\"text-align: center;\">\n<div style=\"text-align: right;\">\n<div style=\"text-align: justify;\"><span style=\"font-family: tahoma, geneva, sans-serif; font-size: 14px;\">عاماً بعد عام تواصل المكتبة بعون الله ثم برعاية المسؤولين وجهود العاملين مسيرتها نحو تحقيق ما تصبو إليه من أهداف ... تبني وتنمي مجموعاتها المعلوماتية فتوفر كل ما يمكنها توفيره من المصادر وأوعية المعلومات &nbsp; &nbsp; التقليدية وغير التقليدية اللازمة وتجري لها كافة الاجراءات الفنية المطلوبة وتتيحها للاستخدام وتقدم ما يلزم من خدمات..كل ذلك وفق احدث النظم المتاحة، وهي تنشد من ذلك تمكين الجامعة من أداء مهامها التعليمية والبحثية والتثقيفية وأداء رسالتها الحضارية السامية .</span></div>\n<div style=\"text-align: justify;\">&nbsp;</div>\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">وإذا كانت المكتبة قد قطعت حتى الآن مسافة لا بأس بها في الاتجاه الصحيح نحو غاياتها وحققت مستويات جيدة وفي زمن يعد قياسياً سواء في مجال تنمية المقتنيات أو الاعداد والحوسبة اوالاجراءات والمعالجة الفنية أو الخدمات المقدمة .. الا اننا نعترف أن الطريق لا زال طويلاً وشاقاً ومكلفاً قبل بلوغ القمة التي نسعى اليها ...وفي الامثال قالوا: من سار على الدرب وصل.</span></div>\n<div style=\"text-align: justify;\">&nbsp;</div>\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">ولذلك ولضمان مواصلة السير بخطى حثيثة ومدروسة وفي الإتجاه الصحيح نحو الغايات المنشودة ؛ تضع المكتبة خطتها السنوية : ببرامجها ومشاريعها ووسائل تنفيذ هذه البرامج والمشاريع.. وآلية متابعتها، وهي ترتكز في كل ذلك على الطاقات والإمكانات الفعلية المتوفرة وتسترشد بنتائج تقويم خطتها السابقة وما تحقق منها وما لم يتحقق.</span></div>\n<div style=\"text-align: justify;\">&nbsp;</div>\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px; font-family: tahoma, geneva, sans-serif;\">وفريق العمل في المكتبة يحدوه الأمل بأن تكون هذه الخطة إضاءة اخرى تعزز الانارة على الطريق وتحدد المسارات وتعالج الهفوات وتتغلب على الصعاب وترتقي بالنتائج .</span></div>\n</div>\n</div>', 'false');
INSERT INTO `px_page` VALUES ('6', 'مقتنيات', '<p dir=\"RTL\" style=\"text-align: right;\"><strong>&nbsp; &nbsp; الكتب</strong></p>\n<p dir=\"RTL\" style=\"text-align: right;\">&nbsp;</p>\n<p style=\"text-align: right;\"><strong><span dir=\"RTL\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; إحصائية مقتنيات المكتبة من الكتب والرسائل العلمية والأقراص</span>&nbsp;</strong></p>\n<p style=\"text-align: right;\"><strong><span dir=\"RTL\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;حتى 31/1/2012</span></strong></p>\n<p style=\"text-align: right;\">&nbsp;</p>\n<table dir=\"rtl\" style=\"width: 456px;\" border=\"1\" width=\"456\" cellspacing=\"0\" cellpadding=\"0\" align=\"right\">\n<tbody>\n<tr>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">من حيث</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">عدد العناوين</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">الرسائل الجامعية</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">الأقراص الممغنطة</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">الكتب المسقطة</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">إجمالي الكتب المسجلة</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">ملاحظات</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">عربي</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">28.562</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">516</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">463 ماعدا مرفقات الكتب</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">266</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">40.705</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">توجد مجموعات كبيرة من الكتب قيد التسجيل</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">اجنبي</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">4769</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">_</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">3 ما عدا مرفقات الكتب</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">2</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">5.068</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">إجمالي</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">33.331</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">516</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">466</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">268</p>\n</td>\n<td style=\"width: 45px; text-align: right; vertical-align: middle;\">\n<p dir=\"RTL\" style=\"text-align: center;\">45.773</p>\n</td>\n<td style=\"width: 45px; vertical-align: middle; text-align: center;\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<div style=\"clear: both;\">&nbsp;</div>\n<p style=\"direction: rtl;\" align=\"right\"><strong style=\"text-align: left;\">* ملاحظة : تبلغ عدد أجهزة الحاسوب في جميع قاعات المكتبة (23) جهاز منها (10) أجهزة طرفيات لاستعلام الطلبة</strong></p>', 'false');
INSERT INTO `px_page` VALUES ('7', 'المدير والموظفون', '<p>كشف اسماء المير والموظفين</p>', 'false');
INSERT INTO `px_page` VALUES ('8', 'الخطة السنوية', '<p>&nbsp;طباعة<br /><br />الخطة السنوية<br /><br />&nbsp;<br /><br />من 1-9-2011 الى 31-8-2012<br /><br />مقدمة<br /><br />عاماً بعد عام تواصل المكتبة بعون الله ثم برعاية المسؤولين وجهود العاملين مسيرتها نحو تحقيق ما تصبو إليه من أهداف ... تبني وتنمي مجموعاتها المعلوماتية فتوفر كل ما يمكنها توفيره من المصادر وأوعية المعلومات التقليدية وغير التقليدية اللازمة وتجري لها كافة الاجراءات الفنية المطلوبة وتتيحها للاستخدام وتقدم ما يلزم من خدمات..كل ذلك وفق احدث النظم المتاحة، وهي تنشد من ذلك تمكين الجامعة من أداء مهامها التعليمية والبحثية والتثقيفية وأداء رسالتها الحضارية السامية .<br /><br />وإذا كانت المكتبة قد قطعت حتى الآن مسافة لا بأس بها في الاتجاه الصحيح نحو غاياتها وحققت مستويات جيدة وفي زمن يعد قياسياً سواء في مجال تنمية المقتنيات أو الاعداد والحوسبة اوالاجراءات والمعالجة الفنية أو الخدمات المقدمة .. الا اننا نعترف أن الطريق لا زال طويلاً وشاقاً ومكلفاً قبل بلوغ القمة التي نسعى اليها ...وفي الامثال قالوا: من سار على الدرب وصل.<br /><br />ولذلك ولضمان مواصلة السير بخطى حثيثة ومدروسة وفي الإتجاه الصحيح نحو الغايات المنشودة ؛ تضع المكتبة خطتها السنوية : ببرامجها ومشاريعها ووسائل تنفيذ هذه البرامج والمشاريع.. وآلية متابعتها، وهي ترتكز في كل ذلك على الطاقات والإمكانات الفعلية المتوفرة وتسترشد بنتائج تقويم خطتها السابقة وما تحقق منها وما لم يتحقق.<br /><br />وفريق العمل في المكتبة يحدوه الأمل بأن تكون هذه الخطة إضاءة اخرى تعزز الانارة على الطريق وتحدد المسارات وتعالج الهفوات وتتغلب على الصعاب وترتقي بالنتائج .<br /><br />الأهداف العامة للمكتبة وأبرز مهامها ووظائفها :<br /><br /><br />ا- بناء وتنمية المجموعات المعلوماتية بما يضمن توفير مصادر المعلومات اللازمة من الكتب والمخطوطات والدوريات والرسائل العلمية وغير ذلك من أوعية المعلومات المتنوعة والتي تمكن الجامعة من القيام&nbsp; بمهامها في البحث والدراسة والتعليم والتثقيف.<br /><br />ب- تجميع الرسائل العلميه المجازة لدرجتي الماجستير والدكتوراه التى تم منحها من الجامعة, واقتناء نسخه من اشرطة تسجيل فعاليات المناقشات العلنية لرسائل الماجستير والدكتوراه المجازة من الجامعة واقتناء نسخة الكترونية لهذه الرسائل على أقراص مدمجه (CD ) بالاضافة الى النسخ المطبوعة وذلك من خلال إلزام طلاب الدراسات العليا بتسليم عدد (2) نسخه مطبوعة و (1) شريط فيديو ، و (1) قرص مدمج من رسائلهم&nbsp; للمكتبة.<br /><br />ج- إنشاء مكتبة سمعية وبصرية والكترونية لذوى الاحتياجات الخاصة.<br /><br />د- تنظيم مجموعات المكتبة بما في ذلك عمليات التسجيل والتصنيف والفهرسة والترفيف والتكشيف والاستخلاص&nbsp; والحوسبة وغيرها من العمليات التي تكفل ضبط هذه المجموعات وحفظها وتحليلها وتكشيفها وصيانتها وتيسير حصول المستفيدين على ما يريدون من مقالات وبحوث و مراجع ودوريات وكتب وغيرها من مصادر المعرفة وأوعية المعلومات .<br /><br />ه- الربط الآلي بين مكتبات كليات الجامعة للإفادة من مقتنياتها وخدماتها وذلك تيسيرا على الباحثين ولترشيد سياسة الاختيار والشراء والربط الآلي مع مكتبات الجامعات الأردنية الرسمية وشبكات المكتبات والمعلومات المثيلة للتعاون والإفادة.<br /><br />و- تقديم الخدمات المكتبة والمرجعية واسترجاع المعلومات، وما يشمل ذلك من الإرشاد المكتبي&nbsp; وإصدار القوائم الببليوجرافية اللازمة وتقديم خدمات الإعارة والتصوير والنسخ والإحاطة الجارية والبث الإنتقائي وخدمات الإنترنت وقواعد البيانات والأرشفة الإلكترونية&nbsp; والتدريب وغيرها&nbsp; ومعاونة رواد المكتبة وتوجيههم نحو الإفادة الأمثل من المجموعات المتوفرة.<br /><br />ز- تعزيز حركة البحث العلمي والمساهمة في نشر المعلومات الجديدة والمهمة بين المختصين والمساهمة في نقل التراث الفكري العلمي وذلك بتبادل الأبحاث العلمية والمعلومات التي تساعد الطالب الباحث والأستاذ على أداء رسالته العلمية ومعرفة مدى ما وصلت إليه المجتمعات الأخرى من تقدم في مجالات المعرفة المختلفة.<br />ح- التعاون والتنسيق مع المكتبات الأخرى داخل الدولة وخارجها للوصول إلى مصادر المعلومات الضرورية وتبادلها والمشاركة في شبكات المعلومات المحلية والوطنية والإقليمية والدولية.<br />ط- تزويد الطلاب والدارسين بالثقافة المكتبية الأساسية لتمكينهم من الوصول إلى الاستفادة المثلى من مقتنيات المكتبة وأوعية معلوماتها.<br />ي-&nbsp; الاشراف والمتابعة والتوجيه الإداري والفني على مكتبات الفروع وإعداد البرامج التدريبية اللازمة للعاملين بها و تطوير العمل المكتبي، وتحسين الأداء الوظيفي والإعلامي والتوثيقي من خلال الدورات وإقامة المعارض وتنظيم المؤتمرات والملتقيات والندوات العلمية وغيرها من الأنشطة المطلوبة.<br />ك- دراسة المستفيدين من الخدمات المكتبية، أي القراء، بمختلف فئاتهم، ومعرفة اتجاهاتهم القرائية، بهدف تلبية طلباتهم وحاجاتهم المعرفية والمعلوماتية على أفضل وجه.<br /><br />م- المحافظة على مقتنيات المكتبة ومصادرها المعلوماتية .<br /><br />اهداف الخطة العامة :<br /><br />- ان يتواصل المسح وإجراء الاستطلاعات اللازمة لبيان الحالة الراهنة للمكتبة ولتلمس الاحتياجات الفعلية والمشكلات والتحديات القائمة وللتعرف على جوانب القصور والعجز.<br /><br />- وضع كافة التدابير والمشاريع والبرامج لحل المشكلات والتغلب على التحديات ومعالجة اوجه القصور والعجز.<br /><br />- ترحيل ما لم يتحقق من مشاريع الخطة السابقة للخطة الحالية ووضع بدائل ممكنة التنفيذ<br /><br />- ان تتضمن الخطة المشاريع والبرامج الكفيلة ببلوغ معايير الاعتماد في كافة المجالات<br /><br />- ان تتضمن الخطة المشاريع والبرامج التطويرية لبلوغ الجودة والتميز في الاداء وفي الخدمات<br /><br />- ان تتضمن الخطة المشاريع والبرامج الكفيلة بدعم البحث العلمي والاهتمامات الاكاديمية<br /><br />- ان تتضمن الخطة المشاريع والبرامج الخاصة بتفعيل التواصل مع المجتمع المحلي وخدمته<br /><br />- ان تتضمن الخطة المشاريع والبرامج اللازمة لتعزيز التواصل والتعاون والتحالف مع المكتبات ومراكز البحث الوطنية والدولية<br /><br />- مواكبة احدث انماط التكنولوجيا في مجال المكتبات والمعلومات وتسخيرها لخدمة الطلبة واعضاء هيئة التدريس<br /><br /><br />اهداف الخطة الفرعية وابرز الفعاليات<br /><br />- اعتماد تشكيل اللجنة العليا للمكتبة وضمان تشكيل لجنة مكتبة فرعية في كل كلية<br /><br />- استكمال اعتماد تعليمات المكتبة ( اللائحة القانونية ) ونشرها<br /><br />- توسعة المكتبة واضافة المساحة اللازمة لبلوغ الحد الادني الذي حددته معايير الاعتماد المحلية ( 1000م ).. ثم مواصلة الجهود لتحقيق المبنى المستقل للمكتبة<br /><br />- اضافة قاعات جديدة لقاعات المكتبة مثل ( قاعة المراجع، قاعة تخريج الحديث، قاعة الدراسات العليا، قاعة المناقشة، القاعة الوطنية والمتحف الدائم، معمل التوثيق، مكتبة المكفوفين وضعاف البصر...) (في حال انشاء المبنى) .<br /><br />- نقل المكتبة المركزية من مبنى الجامعة رقم(2) الى الموقع الدائم حيث سينتقل الطلبة هناك هذا العام<br /><br />- العمل على سد العجز في الكتب والبالغ ( نحو 47000 عنوان ) مع زيادة الطلبة&nbsp; وفي الدوريات ( نحو 37 عنوان عربي واجنبي ) على ان تكون مرتبطة مباشرة بالتخصصات المعتمدة في الجامعة<br /><br />- اعطاء اولوية لسد العجز الكبير في الكتب الاجنبية والبالغ ( نحو 15000 عنوان ) وهي من اجمالي العجز العام في الكتب المشار اليه اعلاه (والعمل على عقد اتفاقية خاصة بذلك مع مورد متخصص)<br /><br />- تعزيز مكتبة الرسائل العلمية يالتعاون مع المكتبات الجامعية الاخرى محليا وعربيا واقتناء مالا يقل عن (1000) رسالة جامعية في مختلف التخصصات التي تدرسها الجامعة<br /><br />- استكمال مشروع النشر الالكتروني للرسائل العلمية الممنوحة في الجامعة والمطبوعات الصادرة عنها<br /><br />- مواصلة تجليد الكتب غير المجلدة بما لا يقل عن (10000 ) كتاب خلال العام<br /><br />- استكمال مشروع المكتبة الالكترونية<br /><br />- مواصلة تطوير موقع المكتبة وتفعيل خاصية البحث على الشيكة<br /><br />- تنفيذ مشروع مكتبة المكفوفين وضعاف البصر<br /><br />- اعتماد مشروع صندوق دعم المكتبة<br /><br />- العمل على سد العجز في المقاعد والبالغ ( 326 ) مقعد ( بعد توفير المساحات اللازمة) ليصل اجمالي المقاعد في هذا العام الى (550) مقعد على الاقل<br /><br />- العمل على توفير عدد ( 13 ) اجهزة حاسوب كطرفيات للطلبة تضاف الى الاجهزة المتوفرة وذلك لسد العجز في هذا الجانب<br /><br />- اضافة وحدات ارفف بحجم الزيادات القائمة والمتوقعة.<br /><br />- التغلب على مشكلات نظام الحوسبة المستخدم حاليا في المكتبة او استبداله بآخر اكثر ملاءمة ومرونة.<br /><br />- استكمال تصنيف كتب قاعة الدراسات الاسلامية .<br /><br />- استكمال ادخال بيانات الكتب والدوريات واوعية المعلومات غير المحوسبة والبالغ عددها مع بداية العام الجامعي الجديد نحو (10000 ادخال ) ودعم الوصول الامثل لجميع مقتنيات المكتبة من قبل روادها.<br /><br />- تشفير جميع كتب المكتبة ووضع بوابات الحماية الالكترونية للمحافظة على موجودات المكتبة في مختلف القاعات.<br /><br />- تعين مصنف ومشرف لفرعي مبنى(1) وتكليف منسق بينهما وبين الادارة<br /><br />- استكمال تطوير الكفايات والمهارات المهنية اللازمة للعاملين في المكتبة بحسب مجالات عملهم.<br /><br />- اعتماد نظم خاصة لتحفيز الموظفين المجتهدين والمبدعين ( ماديا ومعنويا ).<br /><br />- توفير كافة الادوات والمواد اللازمة للعمل.<br /><br />- طباعة دليل عمل يغطي كافة مجالات العمل وتوزيعه على العاملين في المكتبة.<br /><br />- طباعة دليل ارشادي لاستخدام المكتبة وتوزيعه على الطلبة والباحثين ورواد المكتبة وعقد ما يلزم من الدورات وورش العمل التدريبية للطلبة وللراغبين وتفعيل خدمة الارشاد المرجعي في جميع القاعات.<br /><br />- استكمال استطلاع حاجات الطلبة واعضاء هيئة التدريس فيما يتعلق بالخدمات المكتبية المطلوبة وتنفيذ ما يمكن تنفيذه منها.<br /><br />- تمديد ساعات دوام المكتبة للفترة المسائية وفتح المكتبة ايام السبت في جميع القاعات .<br /><br />- اتاحة خاصية البحث والاستعلام الالي عن اوعية المعلومات في المكتبة من خلال موقع المكتبة على شبكة الانترنت.<br /><br />- العمل على تنفيذ خدمة الاعارة الذاتية (في حال انشاء المبنى واعتماد نظام حوسبة حديث وموثوق).<br /><br />- مواصلة تفعيل خدمة رف الحجز بالتعاون مع الكليات والاقسام الاكاديمية واعضاء هيئة التدريس.<br /><br />- مواصلة تنفيذ خدمة التصوير للطلبة والباحثين.<br /><br />- مواصلة تعزيز الاشتراك في قواعد البيانات اللازمة لخدمة كافة التخصصات المعتمدة.<br /><br />- اتاحة الطباعة المجانية للطلبة واعضاء هيئة التدريس من قواعد البيانات بواقع (150) ورقة في الفصل الدراسي.<br /><br />- مواصلة تطوير خدمات الاحاطة الجارية ومواصلة اصدار نشرات المكتبة الاعلامية الدورية وتفعيل خدمة البث الانتقائي للمعلومات على البريد الالكتروني لاعضاء هيئة التدريس والقيادات الادارية في الجامعة.<br /><br />- عقد اتفاقيات الاعارة التبادلية مع الجامعات ومراكز البحث.<br /><br />- مواصلة استطلاع اراء رواد المكتبة ومقترحاتهم من خلال صنايق الاقتراحات او توزيع استطلاعات الراي او اية وسائل اخرى.<br /><br />- اقامة معارض للكتب وللانشطة الثقافية والمشاركة في اللقاءات والمؤتمرات المتخصصة والمشاركة في معارض الكتب الدولية.<br /><br />- مواصلة اجراء الصيانة اللازمة للقاعات وللمقتنيات.<br /><br /><br />المحاور العامة للخطة<br /><br />اولا: المبنى والاثاث والتجهيزات.<br /><br />ثانيا: المقتنيات واوعية المعلومات.<br /><br />ثالثا: الموارد البشرية ( الموظفون ).<br /><br />رابعا: الاعداد الفني والحوسبة.<br /><br />خامسا: الخدمات والنشاطات.<br /><br /><br />ابرز المشاريع والبرامج :<br /><br />- مواصلة مشروع المسح والاستطلاع للتطوير والارتقاء.<br /><br />- مشروع مبنى المكتبة الخاص.(ملحق رقم 11/أ)<br /><br />- استكمال مشروع نحو مجموعات مكتبية نوعية متكاملة.<br /><br />- مشروع القاعة الوطنية والمتحف الدائم ( يرحل لحين اقامة المبنى الخاص )<br /><br />- مشروع مكتبة الامل للمكفوفين وضعاف البصر( يرحل لحين اقامة المبنى الخاص وتوفر التجهيزات)<br /><br />- مواصلة مشروع الحوسبة ومواكبة احدث التقنيات.<br /><br />- مواصلة الجهود لاتمام انشاء المكتبة الرقمية والالكترونية.<br /><br />- مشروع صندوق دعم المكتبة.<br /><br />- مشروع معرض الكتاب السنوي ( ملحق رقم&nbsp; 11/ب )<br /><br />- معمل التوثيق والنشر( لحين توفر التجهيزات اللازمة في حال انشاء المبنى الخاص)<br /><br />- مواصلة تطوير موقع المكتبة.<br /><br />- استكمال مشروع المساهمة في&nbsp; النشر الالكتروني (رسائل الدكتوراة والماجستير).<br /><br />- مشروع الاعارة الذاتية ( عند الحصول على نظام الحوسبة المناسب) .<br /><br />- مشروع نحو تفعيل المناسبات الدينية والوطنية.<br /><br />- مشروع نحو مهارات فنية عالية (للموظفين)<br /><br />- مشروع الأرشفة الإلكترونية .<br /><br />- مشروع خدمة المجتمع المحلي المقترح (ملحق رقم&nbsp; 11/ج ) .<br /><br />- مشروع مناقشة كتاب الشهر .<br /><br />- مشروع مسابقات أوائل المطالعين .<br /><br />- المساهمة في مشروع تشغيل الطلب</p>', 'false');
INSERT INTO `px_page` VALUES ('9', 'المتبرعون', '<p style=\"text-align: center; margin-top: 0px; margin-bottom: 0px;\">&nbsp;</p>\n<p style=\"text-align: center; margin-top: 0px; margin-right: 40px; margin-bottom: 0px;\">&nbsp;</p>\n<table dir=\"rtl\" style=\"width: 410px;\" border=\"1\" width=\"429\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n<tbody>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 14px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span style=\"color: #800000;\"><strong>الرقم</strong></span></span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 14px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span style=\"color: #800000;\"><strong><span dir=\"RTL\">المتبرعون</span></strong></span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 14px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span style=\"color: #800000;\"><strong><span dir=\"RTL\">عدد الكتب</span></strong></span></span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">1</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور عفيف عبد الرحمن</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">&nbsp;3534</span></span></p>\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\">&nbsp;</p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">2</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">مركز جمعة الماجد &ndash; دبي</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">575</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">3</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">ورثة المرحوم عطية النجار</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">367</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">4</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">جمعية التنمية الاجتماعية</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">375</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">5</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">مؤسسة آل البيت</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">427</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">6</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور احسان دنون</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">161</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">7</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">جامعة اليرموك</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">150</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">8</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">السيدة رحاب الزرو</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">110</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">9</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">السيد مهند ذياب</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">108</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">10</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الجامعة الاردنية</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">115</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">11</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">مديرية الامن العام</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">40</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">12</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">لجنة بلاد الشام</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">48</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">13</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">صحيفة الدستور</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">38</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">14</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور ميشيل حمارنة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">180</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">15</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور سليم حتاملة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">152</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">16</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">وزارة الاوقاف</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">48</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">17</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">دائرة قاضي القضاة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">15</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">18</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور عبد الملك عبد الرحمن السعدي</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">14</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">19</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الفاضلة منى خير يشي</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">20</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">20</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">رئاسة الجامعة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">63</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">21</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور صالح حمارنة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">61</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">22</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">طلاب كلية اصول الدين</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">55</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">23</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور ايوب الصوالحة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">43</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">24</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">القيادة العامة للقوات المسلحة الاردنية</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">34</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">25</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور عواد مفلح القضاة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">26</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">26</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">مؤسسة جائزة عبد العزيز بابطين</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">25</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">27</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">دائرة الاحصاءات العامة الاردنية</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">23</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">28</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور صالح الداهري</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">14</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">29</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور نواف كنعان</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">338</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">30</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">ورثة المرحوم الدكتور خالد الزعبي</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">822</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">31</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الفاضلة فاتن دروزة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">113</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">32</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور محمد الارناؤوط</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">تبرع بالف كتاب ورد منهم</span></span></span></p>\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">( 762)</span></span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">33</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور عصام الصفدي</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">1903</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">34</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">مركز الرموك للتوزيع </span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">115</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">35</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">احمد العبدالله</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">24</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">36</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور صالح خصاونة</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">103</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">37</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">السيد زهير ابو شايب</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">788</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">38</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">المنظمة العربية للتنمية الادارية</span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">54</span></span></p>\n</td>\n</tr>\n<tr>\n<td style=\"width: 48px;\">\n<p dir=\"RTL\" style=\"text-align: center; margin-right: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">39</span></span></p>\n</td>\n<td style=\"width: 229px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\"><span dir=\"RTL\">الدكتور علي اليماني </span></span></span></p>\n</td>\n<td style=\"width: 110px;\">\n<p dir=\"LTR\" style=\"text-align: center; margin-left: 40px;\"><span style=\"font-size: 12px;\"><span style=\"font-family: tahoma,geneva,sans-serif;\">39</span></span></p>\n</td>\n</tr>\n</tbody>\n</table>\n<div style=\"text-align: center; clear: both;\">&nbsp;</div>\n<p style=\"text-align: center; margin-top: 0px; margin-bottom: 0px;\">&nbsp;</p>\n<p style=\"text-align: center; margin-top: 0px; margin-bottom: 0px;\">&nbsp;</p>\n<p style=\"text-align: center;\">&nbsp;</p>', 'false');
INSERT INTO `px_page` VALUES ('10', 'التعليمات', '<p>محتوي التعليمات</p>', 'false');

-- ----------------------------
-- Table structure for `px_poll_answer`
-- ----------------------------
DROP TABLE IF EXISTS `px_poll_answer`;
CREATE TABLE `px_poll_answer` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(200) DEFAULT NULL,
  `poll` int(10) DEFAULT NULL,
  `hits` int(100) DEFAULT NULL,
  `isSelected` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_poll_answer
-- ----------------------------
INSERT INTO `px_poll_answer` VALUES ('41', 'مدهش', '53', '54', 'false');
INSERT INTO `px_poll_answer` VALUES ('42', 'جيد', '53', '41', 'false');
INSERT INTO `px_poll_answer` VALUES ('43', 'مقبول', '53', '33', 'false');
INSERT INTO `px_poll_answer` VALUES ('44', 'سيء', '53', '15', 'false');
INSERT INTO `px_poll_answer` VALUES ('45', '', '53', '1', 'false');
INSERT INTO `px_poll_answer` VALUES ('46', '', '53', '1', 'false');
INSERT INTO `px_poll_answer` VALUES ('47', '', '53', '1', 'false');
INSERT INTO `px_poll_answer` VALUES ('48', '', '53', '1', 'false');
INSERT INTO `px_poll_answer` VALUES ('49', '', '53', '1', 'false');
INSERT INTO `px_poll_answer` VALUES ('50', '', '53', '1', 'false');
INSERT INTO `px_poll_answer` VALUES ('51', 'نعم', '54', '11', 'false');
INSERT INTO `px_poll_answer` VALUES ('52', 'لا', '54', '20', 'false');
INSERT INTO `px_poll_answer` VALUES ('53', 'لا اهتم', '54', '30', 'false');
INSERT INTO `px_poll_answer` VALUES ('54', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('55', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('56', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('57', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('58', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('59', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('60', '', '54', '0', 'false');
INSERT INTO `px_poll_answer` VALUES ('61', '', '1', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('62', '', '2', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('63', '', '3', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('64', '', '4', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('65', '', '5', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('66', '', '1', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('67', '', '2', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('68', '', '3', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('69', '', '4', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('70', '', '5', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('71', '', '1', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('72', '', '2', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('73', '', '3', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('74', '', '4', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('75', '', '5', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('76', 'qweqweqwe', '1', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('77', 'qweqweqwe', '2', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('78', 'qweqweqwe', '3', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('79', 'qweqweqwe', '4', null, 'false');
INSERT INTO `px_poll_answer` VALUES ('80', 'qweqweqwe', '5', null, 'false');

-- ----------------------------
-- Table structure for `px_poll_question`
-- ----------------------------
DROP TABLE IF EXISTS `px_poll_question`;
CREATE TABLE `px_poll_question` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) DEFAULT NULL,
  `active` enum('YES','NO') DEFAULT 'NO',
  `isSelected` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_poll_question
-- ----------------------------
INSERT INTO `px_poll_question` VALUES ('53', 'ما رأيك بالموقع ', 'YES', 'false');
INSERT INTO `px_poll_question` VALUES ('54', 'هل لديك بطاقة إنتخابية', 'NO', 'false');

-- ----------------------------
-- Table structure for `px_website`
-- ----------------------------
DROP TABLE IF EXISTS `px_website`;
CREATE TABLE `px_website` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `website_name` varchar(200) DEFAULT NULL,
  `website_link` varchar(230) DEFAULT NULL,
  `isSelected` enum('true','false') DEFAULT 'false',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of px_website
-- ----------------------------
INSERT INTO `px_website` VALUES ('14', 'معلومه لكى كل ما يهم الأسره', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('15', 'موسوعة الاسرة المسلمة', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('16', 'مجمع المملكة للاستثمارات العقارية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('17', 'منظمة الاسرة العربية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('18', 'شبكة بيت حواء', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('19', 'منتدى سوق للعقارات', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('20', 'بورصتي القاهرة والإسكندرية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('21', 'سوق البحرين للأوراق المالية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('22', 'سوق الإمارات للأوراق المالية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('23', 'بورصة عمّان', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('24', 'المرجع الاقتصادي للاسهم السعودية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('25', 'سوق الدوحة للأوراق المالية', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('26', 'سوق دبي المالي', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('27', 'سوق نيويورك المالي', 'http://google.com', 'false');
INSERT INTO `px_website` VALUES ('28', 'سوق أبوظبي للأوراق المالية', 'http://google.com', 'false');
