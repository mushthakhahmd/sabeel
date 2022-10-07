import 'package:flutter/foundation.dart';
import 'package:sabeel/model/item_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Items>> itemsNotifier = ValueNotifier([]);

List<Items> searchItemsNotifier = [];
late Database _db;

Future<void> initializeDatabase() async {
// open the database
  _db = await openDatabase("items.db", version: 1,
      onCreate: (Database db, int version) async {
    // When creating the db, create the table
    // Insert some records in a transaction
    await db.execute(
        'CREATE TABLE Items ( id  INTEGER, cat_id  INTEGER, title  TEXT, subTitle  TEXT, isFavorite  TEXT ,imgUrl  TEXT )');
    //   await insertIntoTable();
  });
}

Future<void> getCount() async {
  // Count the records
  final count =
      Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Items'));
  if (count! == 0) {
    insertIntoTable();
  }
}

Future<void> insertIntoTable() async {
  await _db.transaction((txn) async {
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(1,1, "Dua after wake up", "عند الاستيقاظ من النّوم", "false", "assets/pdf/01 Dua after wake up.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        ' (2,1, "Surah Al-Imran 190-200", "آخر آيات من آل عمران", "false", "assets/pdf/01 Surah Al-Imran 190-200.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(3,1, "Tahajjud Prayer", "صلاة التهجد", "false", "assets/pdf/01 Tahajjud prayer")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(4,1, "Dua of Asma-Ul-Husna", "دعاء أسماء الله الحسنى", "false", "assets/pdf/01 Dua of Asma-ul-Husna.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(5,1, "Qaseeda of Imam Haddad", "النفحة العنبرية للإمام الحداد", "false", "assets/pdf/01 Qaseeda of Imam Haddad.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(6,1, "Wird of Sheikh Abubakar Ibn Salim", "ورد الشيخ أبو بكر بن سالم", "false", "assets/pdf/01 Wird of Sheikh Abubakar.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(7,1, "Azkar after Thahajjud Prayer", "بعض الأذكار بعد التهجد", "false", "assets/pdf/01 Azkar After the Tahajjud.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(8,2, "Recite In Sunnah Of Fajr Prayer", "ما يقرأ في سنة الفجر", "false", "assets/pdf/02 Recite In Sunnah of Fajr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(9,2, "Zikr After Lying on Right Side", "مع الاضطجاع بعد سنة الفجر", "false", "assets/pdf/02 Zikr After Lying on Right Side.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(10,2, "Azkar between Fajr Prayer and its Sunnah", "الأذكار بين صلاة الفجر وسنتها", "false", "assets/pdf/02 new Azkar between fajr its sunnah.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(11,2, "Dua-ul-Fajr of Prophet Before Fajr Prayer", "دعاء الفجر", "false", "assets/pdf/02 Dua-ul-Fajr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(12,2, "Ilaika Ya Rabbi Baith After Fajr Prayer", "قصيدة إليك يارب", "false", "assets/pdf/02 Ilaika Ya Rabbi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(13,2, "Wird-ul-Latíf of Imam Haddad", "الورد اللطيف للإمام الحداد", "false", "assets/pdf/02 Wird-ul-Latif.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(14,2, "The Sevens", "المسبّعات", "false", "assets/pdf/02 The sevens.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(15,2, "Salamat-ul-Iman Dua", "دعاء سلامة الإيمان", "false", "assets/pdf/02 Salamat-ul-iman.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(16,2, "Swalat-ul-Hulur and Other Azkar", "صلاة الحضور وبعض الأذكار", "false", "assets/pdf/02 Swalat-ul-Hulur.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(17,2, "Dua After Reciting Surah Al-Fathiha", "كيفية إهداء ثواب سور الفاتحة إلى الصالحين", "false", "assets/pdf/02 Gifting the reward of reciting Surah Fatiha.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(18,2, "Wird-ul-Imam Nawawi", "ورد الإمام النووي","false", "assets/pdf/02 Wird-ul-Imam Nawawi.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(19,3, "Azkar After Five Daily Prayers", "الأذكار بعد صلوات الخمس", "false", "assets/pdf/03 Azkar After Five Prayers.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(20,3, "Surahs in Audible Prayers according to Order", "ترتيب سور الجهرية للإمام الحداد", "false", "assets/pdf/03 Surahs to be Recited Haddad Order.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(21,4, "Luha Prayer", "صلاة الضحى", "false", "assets/pdf/04 Luha prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(22,4, "Zikr and Dua after Luha", "الأذكار والدعاء بعد صلاة الضحى", "false", "assets/pdf/04 Zikr and Dua after Luha.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(23,5, "Four Rak’ahs Sunnah Before Luhr", "أربع ركعات قبل الظهر", "false", "assets/pdf/05 Four Rakahs Before Luhr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(24,5, "Four Rak’ahs Sunnah After Luhr", "أربع ركعات بعد الظهر", "false", "assets/pdf/05 Four Rakahs After Luhr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(25,5, "Azkar & Dua After Sunnah of Luhr", "الأذكار والدعاء بعد سنة الظهر", "false", "assets/pdf/05 Dua After Sunnah of Luhr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(26,5, "Hizb-al-Nasar of Imam Haddad", "حزب النصر للإمام الحداد", "false", "assets/pdf/05 Hizb-al-Nasar of Imam Haddad.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(27,5, "Hizb-al-Nasar of Imam Shaduli", "حزب النصر للإمام الشاذلي", "false", "assets/pdf/05 Hizb-al-Nasar of Imam Shaduli.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(28,6, "Four Rak’ahs Before Asar Prayer", "أربع ركعات قبل العصر", "false", "assets/pdf/06 Four Rakahs Before Asar Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(29,6, "Hizb-ul-Bahar of Imam Shaduli", "حزب البحر للإمام الشاذلي", "false", "assets/pdf/06 Hizb-ul-Bahar of Imam Shaduli.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(30,6, "Sayyidul Istigfar", "سيد الاستغفار", "false", "assets/pdf/06 Sayyidul Istigfar in Morning and Evening.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(31,6, "Azkar Before Magrib", "الأذكار قبل الغروب", "false", "assets/pdf/06 Azkar Before Magrib.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(32,7, "Two rak’ahs before and after Magrib", "ركعتان قبل صلاة المغرب وبعدها", "false", "assets/pdf/07 Perform two rakahs Sunnah magrib.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(33,7, "Janaza Prayer upon who died on that day", "صلاة الميت لمن مات ذاك اليوم", "false", "assets/pdf/07 Janaza Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(34,7, "Awwabín Prayer", "صلاة الأوابين", "false", "assets/pdf/07 Awwabin Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(35,7, "Saif-ul-Yamâni Dua", "دعاء سيف اليماني", "false", "assets/pdf/07 Saif-ul-Yamani Dua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(36,7, "Aqeeda for Strengethining Your Faith", "عقيدة الإمام أبي بكر السكران", "false", "assets/pdf/07 Aqeeda for Faith.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(37,8, "Surah Yasín", "سورة يس", "false", "assets/pdf/08 Surah Yasin.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(38,8, "Dua of Surah Yasín", "دعاء سورة يس", "false", "assets/pdf/08 Dua of Surah Yasin.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(39,8, "Surah Al-Waqia", "سورة الواقعة ", "false", "assets/pdf/08 Surah Al-Waqia.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(40,8, "Dua of Surah Al-Waqia", "دعاء سورة الواقعة ", "false", "assets/pdf/08 Dua of Surah Al-Waqia.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(41,8, "Surah Al-Sajda", "سورة السجدة", "false", "assets/pdf/08 Surah Al-Sajda.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(42,8, "Surah Al-Mulk", "سورة الملك", "false", "assets/pdf/08 Surah Al-Mulk.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(43,8, "Surah Ad-Dukhan", "سورة الدخان", "false", "assets/pdf/08 Surah Ad-Dukhan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(44,8, "Three Ayath from Surah Al-Hashr", "آخر آيات من سورة الحشر", "false", "assets/pdf/08 Three Ayath.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(45,9, "Two rak’ahs before Isha & its Dua", "ركعتان قبل صلاة العشاء", "false", "assets/pdf/09 before Isha Prayer & Dua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(46,9, "Two rak’ahs after Isha & its Dua", "ركعتان بعد صلاة العشاء", "false", "assets/pdf/09 after Isha Prayer & Dua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(47,9, "Ratib-ul-Haddad", "راتب الإمام الحداد", "false", "assets/pdf/09 Ratib-ul-Haddad.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(48,9, "Ratib-ul-Attas", "راتب الإمام العطاس", "false", "assets/pdf/09 Ratib-ul-Attas.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(49,9, "Witr Prayer", "صلاة الوتر", "false", "assets/pdf/09 Witr Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(50,9, "Zikr & Dua After Witr Prayer", "الأذكار والدعاء بعد صلاة الوتر", "false", "assets/pdf/09 Zikr & Dua After Witr Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(51,9, "Long Qunut", "القنوت الكبير", "false", "assets/pdf/09 Long Qunut.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(52,10, "Zikr & Ayahs Before Sleeping", "الأذكار والآيات قبل الظهر", "false", "assets/pdf/10 Zikr & Ayahs Before Sleeping.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(53,10, "To Make a daily routine", "واظبوا كل يوم", "false", "assets/pdf/10 To Make a daily routine.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(54,11, "Awrad of Friday", "أوراد يوم الجمعة", "false", "assets/pdf/11 Awrad of Friday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(55,11, "Ilahí Nas’aluka Baith", "قصيدة إلهي نسألك", "false", "assets/pdf/11 Ilahi Nas aluka Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(56,11, "Qad Kafani Baith", "قصيدة قد كفاني", "false", "assets/pdf/11 Qad Kafani Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(57,11, "Surah Al-kahf", "سورة الكهف", "false", "assets/pdf/11 Surah Al-kahf.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(58,11, "Recite Seven Times After Jumua", "يقرأ بعد صلاة الجمعة سبعا", "false", "assets/pdf/11 Recite Seven Times After Jumua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(59,11, "Qaseeda For Strengthening Faith", "إلهي لست للفردوس", "false", "assets/pdf/11 Qaseeda For Strengthening Faith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(60,11, "100 Thasbeeh after Jumua", "التسبيح", "false", "assets/pdf/11 100 Thasbeeh after Jumua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(61,11, "Seven Times To Get rid of Debt", "سبعون مرة لقضاء الدين", "false", "assets/pdf/11 To Get rid of Debt.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(62,11, "Swalath After Friday Asar", "الصلوات بعد عصر يوم الجمعة", "false", "assets/pdf/11 Swalath After Friday Asar.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(63,12, "After Drinking", "بعد شرب الماء", "false", "assets/pdf/12 After Drinking.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(64,12, "After Eating", "بعد الأكل", "false", "assets/pdf/12 After Eating.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(65,12, "After the First Salam of Prayer", "بعد التسليمة الأولى من الصلاة", "false", "assets/pdf/12 After First Salam.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(66,12, "After the Second Salam of Prayer", "بعد التسليمة الثانية من الصلاة", "false", "assets/pdf/12 After Second Salam.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(67,12, "After Sneezing", "بعد العطاس", "false", "assets/pdf/12 After Sneezing.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(68,12, "After Waking up", "إذا استيقظ من النوم", "false", "assets/pdf/12 After Waking up.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(69,12, "After Washing", "بعد الاستنجاء", "false", "assets/pdf/12 After Washing.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(70,12, "Baith and Ayath at the End of Majlis and Class", "القصيدة التي تقرأ في آخر المجالس", "false", "assets/pdf/12 Baith at the End of Majlis.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(71,12, "Before Wearing New Dress, etc", "لـمن لبس الثوب الجديد", "false", "assets/pdf/12 Before Wearing New..pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(72,12, "By Raising Hands towards the sky after Ablution", "بعد الوضوء مع رفع اليدين إلى السماء", "false", "assets/pdf/12 after Ablusion.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(73,12, "Congratulating the Bridegroom", "التهنئة للمتزوج", "false", "assets/pdf/12 Congratulating the Bridegroom.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(74,12, "Dua after the Two Rak’ah Sunnah Before the Sexual Intercourse", "الدعاء بعد الركعتين قبل الجماع", "false", "assets/pdf/12 Dua Before the Sexual Intercourse.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(75,12, "Dua Before Dispersing the Gathering", "قبل المفارقة من المجالس", "false", "assets/pdf/12 Dua before Dispersing the Gathering.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(76,12, "Dua in the Begining of Class And Reading", "دعاء يقرأ في بداية الدروس والمطالعة", "false", "assets/pdf/12 Dua in the Begining of Class And in the Begining of Reading.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(77,12, "Dua Between Azaan And Iqamah", "الدعاء بين الأذان والإقامة", "false", "assets/pdf/12 Dua  Between Azaan And Iqamah.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(78,12, "Dua of Tawba Prayer", "دعاء صلاة التوبة", "false", "assets/pdf/12 Dua of Tawba Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(79,12, "Dua after five prayers for easy completion of home", "الدعاء الذي يقرأ بعد كل صلاة لسهولة المنزل", "false", "assets/pdf/12 Dua to habituate after five times prayer of home.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(80,12, "During Ejaculation", "عند خروج المني من المجامعة", "false", "assets/pdf/12 During Ejaculation.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(81,12, "During one’s first meeting with his wife", "ما يقول الزوج عند التقاء الزوجة أولا", "false", "assets/pdf/12 During ones first meeting with his wife.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(82,12, "During Pregnency", "عند الحمل", "false", "assets/pdf/12 During Pregnency.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(83,12, "During the Intercourse", "عند المجامعة", "false", "assets/pdf/12 During the Intercourse.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(84,12, "Especially after FajrAzaan", "بعد أذان الصبح خاصة", "false", "assets/pdf/12 Especially after Fajr Azaan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(85,12, "Especially after MagribAzaan", "بعد أذان المغرب خاصة", "false", "assets/pdf/12 Especially after Magrib Azaan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(86,12, "Especially in FajrAzaan", "في أذان الصبح خاصة", "false", "assets/pdf/12 Especially in Fajr Azaan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(87,12, "Form of Calling Name of the Baby", "كيفية تسمية  الولد", "false", "assets/pdf/12 Form of Calling a Name of the Baby.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(88,12, "Form of Calling Fatiha in New Home", "كيفية قراءة سورة الفاتحة في المنزل الجديد", "false", "assets/pdf/12 Form of Calling Surah Fatiha in New Home.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(89,12, "If Something Surprises you", "إذا أعجبك شيء", "false", "assets/pdf/12 If Something Surprises you.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(90,12, "If you Fall into a Ditch, etc", "إذا سقط في الحفر", "false", "assets/pdf/12 If you Fall into a Ditch.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(91,12, "If you Find Difficult To Get out of your Debts", "إذا عسر قضاء الدين", "false", "assets/pdf/12 If you Find it Difficult Debts.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(92,12, "If you Find Difficult to Reach your Goal", "إذا ضاق حصول المقصود", "false", "assets/pdf/12 If you Find it Difficult to Reach your Goal.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(93,12, "If You Hear the News of the Death of a Muslim", "إذا سمع نعي المؤمن", "false", "assets/pdf/12 If You Hear Death of a Muslim.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(94,12, "In Case of Disaster", "إذا أصيب بمصيبة", "false", "assets/pdf/12 In Case of Disaster.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(95,12, "In Iqamah", "في الإقامة", "false", "assets/pdf/12 In Iqamah.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(96,12, "In the Beginning of any Good Thing", "في بداية كل خير", "false", "assets/pdf/12 In the Beginning of any Good Thing.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(97,12, "Istikharath Prayer and Dua", "صلاة الاستخارة ودعاءها", "false", "assets/pdf/12 Istikharath Prayer and Dua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(98,12, "Nahs Days of Every Month", "أيام النحس المكررة في كل شهر", "false", "assets/pdf/12 Nahs Days of Every Month.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(99,12, "Nahs of Various Months", "أيام النحس المخصوصة بكل شهر", "false", "assets/pdf/12 Nahs of Various Months.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(100,12, "Nikah Khutuba", "خطبة النكاح", "false", "assets/pdf/12 Nikah Khutuba.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(101,12, "Niyyah While Teaching And Studying", "نية التعلم والتعليم", "false", "assets/pdf/12 Niyyah to Recite While Teaching.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(102,12, "Prophetic Dua for Healing", "عند عيادة المريض", "false", "assets/pdf/12 Prophetic Dua for Healing.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(103,12, "Some Ayahs to Cure Illness", "آيات الشفاء", "false", "assets/pdf/12 Some Ayahs to Cure Illness.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(104,12, "Sujood-u-Thilawath", "سجود التلاوة", "false", "assets/pdf/12 Sujood-u-Thilawath.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(105,12, "Tasbíh Prayer", "صلاة التسبيح", "false", "assets/pdf/12 Tasbih Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(106,12, "Tawba Prayer", "صلاة التوبة", "false", "assets/pdf/12 Tawba Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(107,12, "Things to Do When a New Baby is Born", "ما يعمل للولد الجديد", "false", "assets/pdf/12 Things to Do When a New Baby is Born.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(108,12, "To Become Childbirth Easier", "لسهولة وضع الحمل", "false", "assets/pdf/12 To Become Childbirth Easier.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(109,12, "To Chant in Sujood-u-Shukr", "سجود الشكر", "false", "assets/pdf/12 To Chant in Sujood-u-Shukr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(110,12, "When Starting to Live in a New Home", "ما يقرأ في المنزل الجديد", "false", "assets/pdf/12 To Chant When Starting to Live in a New Home.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(111,12, "To Get Included among Good People", "لتكون في زمرة الصالحين", "false", "assets/pdf/12 To Get Included among Good People (At Fajr).pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(112,12, "To One Who Wears New Dress", "لـمن لبس الثوب الجديد", "false", "assets/pdf/12 To One Who Wears New Dress.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(113,12, "To See What you wished for Your Family", "لرؤية ما رجوناه في الزوجة والأولاد", "false", "assets/pdf/12 To see what you wished for Your Family.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(114,12, "When Combing Beard", "عند تمشيط اللحية", "false", "assets/pdf/12 When Combing Beard.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(115,12, "When Entering into Bathroom", "عند الدخول إلى المستحم", "false", "assets/pdf/12 When Entering into Bathroom.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(116,12, "When Entering into Home", "عند دخول المنزل", "false", "assets/pdf/12 When Entering into Home.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(117,12, "When Entering Masjid", "عند الدخول إلى المسجد", "false", "assets/pdf/12 When Entering Masjid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(118,12, "When Entering To an Unoccupied Place", "عند الدخول إلى المكان الخالي", "false", "assets/pdf/12 When Entering To an Unoccupied Place.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(119,12, "When Facing Diffuculty with Vomiting", "إذا ضاقت الحامل بالقيء", "false", "assets/pdf/12 When Facing Diffuculty with Vomiting.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(120,12, "When Finishing from Azaan", "عند الفراغ من الأذان", "false", "assets/pdf/12 When Finishing from Azaan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(121,12, "When Getting angry", "عند الغضب", "false", "assets/pdf/12 When Getting angry.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(122,12, "When Going to Masjid", "عند الذهاب إلى المسجد", "false", "assets/pdf/12 When Going to Masjid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(123,12, "When Hearing Azaan", "جواب الأذان", "false", "assets/pdf/12 When Hearing Azaan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(124,12, "When It Rains", "عند المطر", "false", "assets/pdf/12 When It Rains.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(125,12, "When Leaving Home", "عند الخروج من المنزل", "false", "assets/pdf/12 When Leaving Home.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(126,12, "When Looking at the Sky", "عند النظر إلى السماء", "false", "assets/pdf/12 When Looking at the Sky.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(127,12, "When Looking into a Mirror", "عند النظر إلى المرآة", "false", "assets/pdf/12 When Looking into a Mirror.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(128,12, "When Returning from Masjid", "عند الخروج من المسجد", "false", "assets/pdf/12 When Returning from Masjid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(129,12, "When Returning from Toilet", "عند الخروج من الخلاء", "false", "assets/pdf/12 When Returning from Toilet.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(130,12, "When Sighting the New Moon", "عند رؤية الهلال", "false", "assets/pdf/12 When Sighting the New Moon.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(131,12, "When Undressing", "عند نزع الثوب", "false", "assets/pdf/12 When Undressing.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(132,12, "When Using Perfume", "عند شمّ العطر", "false", "assets/pdf/12 When Using Perfume.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(133,12, "When Visiting a Patient", "عند عيادة المريض", "false", "assets/pdf/12 When Visiting a Patient.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(134,12, "When Wearing Dress", "عند لبس الثوب", "false", "assets/pdf/12 When Wearing Dress.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(135,12, "While Donating", "عند التصدق", "false", "assets/pdf/12 While Donating.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(136,12, "While Drinking Milk", "عند شرب اللبن", "false", "assets/pdf/12 While Drinking Milk.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(137,12, "While Drinking Zamzam Water", "عند شرب ماء زمزم", "false", "assets/pdf/12 While Drinking Zamzam Water.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(138,12, "While Entering Toilet", "عند دخول الخلاء", "false", "assets/pdf/12 While Entering Toilet.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(139,12, "While Facing Difficulties", "عند الكرب", "false", "assets/pdf/12 While Facing Difficulties.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(140,12, "While paying off the debt", "عند قضاء الدين", "false", "assets/pdf/12 While paying off the debt.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(141,12, "While Shaking Hands with Each other", "عند المصافحة", "false", "assets/pdf/12 While Shaking Hands.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(142,12, "While Thundering", "عند الرعد", "false", "assets/pdf/12 While Thundering.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(143,12, "While Yawning", "عند التثاؤب", "false", "assets/pdf/12 While Yawning.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(144,13, "Names of prophet Muhammed (s)", "أسماء النبي (ص)", "false","assets/pdf/13 Names of prophet Muhammed (s)_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(145,13, "Before the beginning of Dala’ilul Khairaat", "حزب يوم الاثنين", "false","assets/pdf/13 Before the beginning of Dalailul Khairaat.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(146,13, "Monday", "حزب يوم الاثنين", "false","assets/pdf/13 _1-Monday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(147,13, "Tuesday", "حزب يوم الثلاثاء", "false","assets/pdf/13 _2- Tuesday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(148,13, "Wednesday", " حزب يوم الأربعاء", "false","assets/pdf/13 _3- Wednesday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(149,13, "Thursday", "حزب يوم الخميس", "false","assets/pdf/13  _4 - Thursday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(150,13, "Friday", "حزب  يوم الجمعة", "false","assets/pdf/13 _5- Friday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(151,13, "Saturday", "حزب يوم السبت", "false","assets/pdf/13 _6-Saturday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(152,13, "Sunday", "حزب يوم الأحد", "false","assets/pdf/13 _7- Sunday.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(153,13, "Dua And Qaseeda After Dala’ilul Khairath", "الدعاء والأبيات بعد قراءة الدلائل", "false","assets/pdf/13 Dua and Qaseeda after Dalailul Khairat.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(154,13, "Swalath Of Imam Ibn Hajar", "صلاة الإمام ابن حجر", "false","assets/pdf/13 The best form of Swalat as said by Imam Ibn Hajar Haithami.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(155,13, " Two Swalawat that necessitate the Shafaah", "الصلاة التي تحصل بها الشفاعة", "false","assets/pdf/13 Two Swalawat that necessitate the Shafaah of the Holy Prophet.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(156,13, "Swalath For Seeing Prophet Habeeb In Dream", "الصلاة التي تحصل بها رؤية الحبيب في المنام", "false","assets/pdf/13 The Swalat, whoever recites it will see the holy prophet in dream.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(157,13, "Swalath That Facilitaties Fulfillment ", "الصلاة التي يحصل بها قضاء الحواج", "false","assets/pdf/13 Swalath  fulfilled.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(158,13, "Two Swalath Of Imam Shafi", "صلاتان للإمام الشافعي", "false","assets/pdf/13 Two Swalawat of Imam Shafiee.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(159,13, "Swalath Of Sheikh Abdul Khader Jeelani", "صلاة الشيخ عبد القادر الجيلاني", "false","assets/pdf/13 Swalat of Sheikh Muhyidheen Abdul Qadir _Jeelani.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(160,13, "Swalath Of Sheikh Ahmad Al-Khabeer Arrifayi", "صلاة الشيخ أحمد الرفاعي", "false","assets/pdf/13 Swalat of Sheikh Ahmadul Kabeer Arrifaii.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(161,13, "Swalath Of Sheikh Ahmad Al-Badawi", "صلاة الشيخ أحمد البدوي", "false","assets/pdf/13 Swalat of Sheikh Ahmad Al-Badawi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(162,13, "Swalath Of Sheikh Ibrahim Al-Dasoqi", "صلاة الشيخ إبراهيم الدسوقي", "false","assets/pdf/13 Swalat of Sheikh Ibrahim Al-Dasuqi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(163,13, "Swalath Of Imam Qazzali", "صلاة الإمام الغزالي", "false","assets/pdf/13 Swalat of Imam Gazzali.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(164,13, "Swalath Of Sheikh Muhyudheen Ibn Arabi", "صلاة الشيخ محي الدين ابن عربي", "false","assets/pdf/13 Swalat of Sheikh Muhyudheen Ibn Arabi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(165,13, "Swalath Of Sheikh Abdul Salam Bin Al-Masheeshi", "الصلاة المشيشية", "false","assets/pdf/13 Swalat of Sheikh Abdul Salam Bin Al-Masheeshi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(166,13, "Swalath Of Sheikh Abi Hasan Al-Shaduli", "صلاة الشيخ أبي الحسن الشاذلي", "false","assets/pdf/13 Swalat of Sheikh Abul Hasan Al-Shaduli.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(167,13, "Swalath Of Imam Navavi", "صلاة الإمام النووي", "false","assets/pdf/13 Swalat of Imam Nawawi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(168,13, " Swalat of Sheikh Muhammedul Bakri", "صلاة الفاتح", "false","assets/pdf/13 Swalat of Sheikh Muhammedul Bakri.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(169,13, "Swalath-ul In’am", "صلاة الإنعام", "false","assets/pdf/13 Swalat-ul Inam.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(170,13, "Swalath-ul Alil Qadr", "صلاة العالي القدر", "false","assets/pdf/13 Swalat-ul Alil Qadr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(171,13, "Swalath-ul Kamaliya", "الصلاة الكمالية", "false","assets/pdf/13 Swalat-ul Kamaliyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(172,13, "Swalath-ul Nariya", "الصلاة النارية", "false","assets/pdf/13 Swalat-ul Nariya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(173,13, "Swalath-ul Munjiya", "الصلاة المنجية", "false","assets/pdf/13 Swalat-ul Munjiya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(174,13, "Swalath of Sheikh Aliyyul Hibshi", "صلاة الشيخ عليّ الحبشي", "false","assets/pdf/13 Swalat of Al-Habeeb Aliyyul Muhammed Habshi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(175,13, "Swalath of Imam Haddad", "صلاة الإمام الحداد", "false","assets/pdf/13 Swalat of Imam Haddad.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(176,13, "Swalath-ul Thaaj", "صلاة التاج", "false","assets/pdf/13 Swalat-ul Thaaj.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(177,13, "Swalath-ul Thwibb", "صلاة الطب", "false","assets/pdf/13 Swalat-ul Twibb.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(178,14, "Salam Baith", "قصيدة السّلام عليك", "false", "assets/pdf/14 Salam Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(179,14, "Sharrafal Anam Moulid", "مولد شرف الأنام", "false", "assets/pdf/14 sharrafal anam moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(180,14, "Manqoos Moulid", "المولد المنقوص", "false", "assets/pdf/14 Manqoos Moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(181,14, "Barzanji Moulid", "مولد البرزنجي", "false", "assets/pdf/14 Barzanji Moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(182,14, "Badr Moulid", "مولد بدر", "false", "assets/pdf/14 Badr Moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(183,14, "Amladul Gusnain moulid", "مولد أملد الغصنين مختصر مولد الحسنين", "false", "assets/pdf/14 Amladul Gusnain moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(184,14, "Muhyidheen Moulid", "مولد محي الدين", "false", "assets/pdf/14 Muhyidheen Moulid.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(185,15, "Qaseedat-ul Burda", "قصيدة البردة", "false", "assets/pdf/15 Qaseedat-ul Burda of Imam Busweeri.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(186,15, "Qaseedat-ul Mulariyya", "القصيدة المضرية", "false", "assets/pdf/15 Qaseedat-ul Mulariyya of Imam Busweeri.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(187,15, "Qaseedath-ul Muhammadiyya", "القصيدة المحمدية", "false", "assets/pdf/15 Qaseedath-ul Muhammadiyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(188,15, "Qaseedat-ul Witriyya", "قصائد الوترية", "false", "assets/pdf/15 Qaseedat-ul Witriyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(189,15, "Qaseeda Swallal Ilah", "قصيدة صلى الإله", "false", "assets/pdf/15 Qaseeda Swallal Ilah of Sheikh.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(190,15, "Qaseeda Ahmadullahil Wali", "قصيدة  أحمد الله الولي", "false", "assets/pdf/15 Qaseeda Ahmadullahil Wali.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(191,15, "Qaseeda Written on The Wall of Raula", "القصيدة المكتوبة في جدران الروضة", "false", "assets/pdf/15 Qaseeda Written on The Wall.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(192,15, "Sayyidatuna Khadeeja Tawassul", "التوسل بسيدتنا خديجة الكبرى", "false", "assets/pdf/15 Sayyidatuna Khadeeja Tawassul.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(193,15, "Sayyidatuna Fatima Tawassul", "التوسل بسيدتنا فاطمة الزهراء", "false", "assets/pdf/15 Sayyidatuna Fatima Tawassul.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(194,15, "Sayyidatuna Mariyam Tawassul", "التوسل بسيدتنا مريم", "false", "assets/pdf/15 Sayyidatuna Mariyam Tawassul.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(195,15, "Al-Qutbiyya", "القطبية للشيخ صدقة الله القاهري", "false", "assets/pdf/15 Al-Qutbiyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(196,15, "Al-Mahlaratul Badriyya", "المحضرة البدرية", "false", "assets/pdf/15 Al-Mahlaratul Badriyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(197,15, "Tha’ajeelul futhooh", "تعجيل الفتوح", "false", "assets/pdf/15 Thaajeelul futhooh.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(198,15, "Muhyudheen Mala", "محي الدين مال", "false", "assets/pdf/15 Muhyudheen Mala.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(199,15, "Al-Qaseedatul Qamriyya", "القصيدة الخمرية", "false", "assets/pdf/15 Al-Qaseedatul khamriyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(200,15, "Qaseeda of Sheikh Jifri Calicut", "قصيدة دفع البلاء للشيخ الجفري الكالكوتي", "false", "assets/pdf/15 Qaseeda of Sheikh Jifri Calicut.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(201,15, "Qaseeda Ajmeeriyya", "القصيدة الأجميرية", "false", "assets/pdf/15 Qaseeda Ajmeeriyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(202,15, "Ajmeer Khwaja Madh", "تحفة المحبين في مدح سلطان الهند ", "false", "assets/pdf/15 Ajmeer Khwaja Madh.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(203,15, "C.M Waliyyullah TawassulBaith", "التوسل بولي الله سي يم المدووري", "false", "assets/pdf/15 C.M Waliyyullah Tawassul Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(204,15, "Aaramba Poovaya Baith", "نشيدة الشيخ الكندوري في مدح الحبيب", "false", "assets/pdf/15 Aaramba Poovaya Baith.pdf")');
  });
}

Future<void> getItems(int id) async {
  itemsNotifier.value.clear();

  if (id == -1) {
    final _values = await _db.rawQuery(' SELECT * FROM Items ');
    for (var item in _values) {
      final items = Items.fromJson(item);
      itemsNotifier.value.add(items);
      itemsNotifier.notifyListeners();
      searchItemsNotifier.add(items);
    }
  } else {
    final _values =
        await _db.rawQuery(' SELECT * FROM Items  WHERE cat_id = ?', [id]);
    for (var item in _values) {
      final items = Items.fromJson(item);
      itemsNotifier.value.add(items);
      itemsNotifier.notifyListeners();
      searchItemsNotifier.add(items);
    }
  }
}

void search2(String value) {
  itemsNotifier.value.clear();
  if (value.isEmpty) {
    itemsNotifier.value.addAll(searchItemsNotifier);
  } else {
    itemsNotifier.value = searchItemsNotifier
        .where((element) =>
            element.title.toLowerCase().contains(value.toLowerCase()))
        .toList();
    itemsNotifier.notifyListeners();
  }
}

Future<void> getFavItems() async {
  itemsNotifier.value.clear();

  final _values = await _db
      .rawQuery(' SELECT * FROM Items  WHERE isFavorite = ?', ['true']);

  print(_values);

  for (var item in _values) {
    //final  Items.fromJson(item);
    final items = Items.fromJson(item);

    itemsNotifier.value.add(items);
    itemsNotifier.notifyListeners();
    print(itemsNotifier.value);
  }
}

Future<void> updateFavorite(int id, String value) async {
  await _db.rawQuery(
      ' UPDATE Items SET  isFavorite =?  WHERE   id = ?', [value, id]);

  if (value == 'false') {
    getFavItems();
  }
  itemsNotifier.notifyListeners();
}
