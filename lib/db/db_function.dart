// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sabeel/model/item_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Items>> itemsNotifier = ValueNotifier([]);

List<Items> searchItemsNotifier = [];
late Database _db;

Future<void> initializeDatabase() async {
// open the database
  _db = await openDatabase(
    "items.db",
    version: 2,
    onCreate: (Database db, int version) async {
      // When creating the db, create the table
      // Insert some records in a transaction
      await db.execute(
          'CREATE TABLE Items ( id  INTEGER, cat_id  INTEGER, title  TEXT, subTitle  TEXT, isFavorite  TEXT ,imgUrl  TEXT , malayalam_text TEXT)');
      //   await insertIntoTable();
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        await db.execute("ALTER TABLE Items ADD COLUMN malayalam_text TEXT;");
      }
    },
  );
}

Future<void> getCount() async {
  // Count the records
  final count =
      Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Items'));
  if (count! == 0) {
    await insertIntoTable();

    await updateData2();
  }
}

Future updateData2() async {
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉറക്കിൽ നിന്ന് എഴുന്നേറ്റാൽ ചൊല്ലേണ്ട ദുആ', 1]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആലുഇംറാൻ അവസാന ആയത്തുകൾ', 2]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തഹജ്ജുദ് നിസ്കാരം ദുആ', 3]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അസ്മാഉൽ ഹുസ്നാ ദുആ', 4]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തഹജ്ജുദിന് ശേഷം ഇമാം ഹദ്ദാദ്(റ) ചൊല്ലിയ ബൈത്ത്', 5]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് അബൂബക്ർ സാലിം(റ) വിന്റെ വിർദ്', 6]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തഹജ്ജുദിന് ശേഷമുള്ള ചില ദിക്റുകൾ', 7]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുബ്ഹിയുടെ സുന്നത്തിൽ ഓതേണ്ടത്', 8]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വലത് ഭാഗത്തേക്ക് ചെരിഞ്ഞ് കിടന്ന് ചൊല്ലേണ്ടത്', 9]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുബ്ഹിയുടെ സുന്നത്തിന് ശേഷമുള്ള ദിക്റ്', 10]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുബ്ഹിയുടെ ശേഷമുള്ള ദുആഉൽ ഫജ്റ്', 11]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇലൈക യാ റബ്ബി ബൈത്ത്', 12]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിർദുല്ലത്വീഫ്', 13]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുസബ്ബആത്ത്', 14]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സലാമതുൽ ഈമാൻ ദുആ', 15]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തുൽ ഹളൂർ', 16]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മരണപ്പെട്ട സ്വാലിഹീങ്ങൾക്കുള്ള ഫാതിഹയും ദുആയും', 17]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിർദുന്നവവി', 18]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഫർള് നിസ്കാരങ്ങൾക്ക് ശേഷമുള്ള ദിക്റുകൾ', 19]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉറക്കെ ഓതുന്ന നിസ്കാരങ്ങളിലെ സൂറത്തുകൾ', 20]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ളുഹാ നിസ്ക്കാരം', 21]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ളുഹാ നിസ്കാരത്തിന്റെ ശേഷമുള്ള ദിക്റും ദുആയും', 22]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ളുഹ്റിന് മുമ്പ് നാല് റക്അത്ത്', 23]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ളുഹ്റിന് ശേഷം നാല് റക്അത്ത്', 24]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ളുഹ്റിന്റെ സുന്നത്തിന് ശേഷമുള്ള ദിക്റും ദുആയും', 25]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഹിസ്ബ്ന്നസ്റ് (ഇമാം ഹദ്ദാദ്(റ))', 26]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഹിസ്ബുന്നസ്റ് (ഇമാം ശാദുലി (റ))', 27]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അസറിന്റെ മുമ്പ് നാല് റക്അത്ത്', 28]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഹിസ്ബുൽ ബഹ്റ് (ഇമാം ശാദുലി (റ))', 29]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സയ്യിദുൽ ഇസ്തിഖ്ഫാർ', 30]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അസ്തമയത്തിന് മുമ്പുള്ള ദിക്റുകൾ', 31]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മഗ്‌രിബ് നിസ്കാരത്തിന്റെ സുന്നത്തുകൾ', 32]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['എല്ലാ ദിവസവുമുള്ള മയ്യത്ത് നിസ്കാരം', 33]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അവ്വാബീൻ നിസ്കാരം', 34]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൈഫുൽ യമാനി ദുആ', 35]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഈമാൻ ഊട്ടിയുറപ്പിക്കാൻ ചൊല്ലേണ്ടത്', 36]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്ത് യാസീൻ', 37]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['യാസീൻ സൂറത്തിന്റെ ദുആ', 38]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുൽ വാഖിഅ', 39]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വാഖിഅ സൂറത്തിന്റെ ദുആ', 40]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുസ്സജദ', 41]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുൽ മുൽക്', 42]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുദുഖാൻ', 43]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുൽ ഹശ്റിലെ അവസാന ആയത്തുകൾ', 44]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇശാഇന്റെ മുമ്പ് രണ്ട് റക്അത്ത്', 45]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇശാഇന്റെ ശേഷം രണ്ട് റക്അത്ത്', 46]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഹദ്ദാദ് റാതീബ്', 47]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റാതിബുൽ അത്ത്വാസ്', 48]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിത്റ് നിസ്ക്കാരം', 49]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിത്റ് നിസ്ക്കാര ശേഷമുള്ള ദിക്റ്', 50]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വലിയ ഖുനൂത്', 51]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉറങ്ങുന്നതിന് മുമ്പ് ചൊല്ലേണ്ടത്', 52]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പതിവായി ചെയ്യേണ്ട കാര്യങ്ങൾ', 53]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അസ്മാഉന്നബി (സ്വ)', 144]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അസ്മാഉൽ ബദ്റ്', 310]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പൊതുവായ ദുആ', 309]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഏത് രോഗത്തിനുമുളള മന്ത്രം', 102]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വെള്ളിയാഴ്ചയിലെ വിർദുകൾ', 54]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇലാഹീ നസ്അലുക ബൈത്ത്', 55]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖദ് കഫാനീ ബൈത്ത്', 56]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുൽ കഹ്ഫ്', 57]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ജുമുഅക്ക് ശേഷം 7 പ്രാവശ്യം', 58]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കടം വീടാൻ 70 പ്രാവശ്യം', 326]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇലാഹീ ലസ്തു ബൈത്ത്', 59]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നൂറ് തസ്ബീഹ്', 60]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ജീവിതം സന്തോഷമാവാൻ', 61]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ജുമുഅ ദിവസം അസറിന് ശേഷം ചൊല്ലേണ്ട സ്വലാത്ത്', 62]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വെള്ളം കുടിച്ച ശേഷം', 63]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഭക്ഷണം കഴിച്ച ശേഷം', 64]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നിസ്കാരത്തിൽ നിന്ന് ഒന്നാം സലാം വീട്ടിയ ശേഷം', 65]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നിസ്കാരത്തലിൽ നിന്ന് രണ്ടാം സലാം വീട്ടിയ ശേഷം', 66]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തുമ്മിയ ശേഷം', 67]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉറക്കിൽ നിന്ന് ഉണർന്നാൽ', 68]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മനോഹരം ചെയ്ത ശേഷം', 69]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പുതിയ വസ്ത്രത്തിൽ മന്ത്രിക്കേണ്ടത്', 71]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വുളൂഇന്റെ ശേഷമുള്ള ദുആ', 72]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വധുവരന്മാർക്കുളള ആശംസ', 73]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആദ്യ രാത്രിയിലെ നിസ്കാരശേഷമുള്ള ദുആ', 74]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സദസ്സ് പിരിയും മുമ്പ് ചൊല്ലേണ്ട ദുആ', 75]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ക്ലാസുകളുടെയും വായനയുടേയും തുടക്കത്തിലെ ദുആ', 76]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബാങ്കിന്റേയും ഇഖാമത്തിന്റേയും ഇടയിലുള്ള ദുആ', 77]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തൗബ നിസ്കാരത്തിന്റെ ദുആ', 78]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വീട് എളുപ്പമായിക്കിട്ടാനുള്ള ദുആ', 79]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇണചേർന്ന് മനിയ്യ് പുറപ്പെടുമ്പോൾ കരുതേണ്ടത്', 80]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഭാര്യയെ ആദ്യമായി കണ്ട്മുട്ടുമ്പോൾ ചൊല്ലുക', 81]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഗർഭിണിയായാൽ ചെയ്യേണ്ടത്', 82]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇണചേരും മുമ്പ് ചൊല്ലുക', 83]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുബ്ഹ് ബാങ്കിന് ശേഷം പ്രത്യേകമായി ചൊല്ലേണ്ടത്', 84]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മഗ്‌രിബ് ബാങ്കിന് ശേഷം പ്രത്യേകമായി ചൊല്ലുക', 85]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുബ്ഹ് വാങ്കിൽ പ്രത്യേകമായി', 86]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കുട്ടിക്ക് പേര് വിളിക്കേണ്ട രൂപം', 87]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പുതിയ വീട്ടിൽ ഫാത്തിഹ വിളിക്കേണ്ട രൂപം', 88]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അത്ഭുപ്പെടുത്തുന്ന കാഴ്ച കണ്ടാൽ', 89]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കുഴിയിൽ വീണാൽ', 90]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കടം വീടൽ പ്രയാസമായാൽ', 91]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ലക്ഷ്യപൂർത്തീകരണം പ്രയാസമായാൽ', 92]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുഅ്മിനിന്റെ മരണവാർത്ത കേട്ടാൽ', 93]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിപത്തിൽ അകപ്പെട്ടാൽ', 94]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇഖാമത്തിൽ ചൊല്ലേണ്ടത്', 95]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['എല്ലാ നല്ലകാര്യത്തിന്റെയും തുടക്കത്തിൽ ചൊല്ലുക', 96]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇസ്തിഖാറത്ത്‌ നിസ്കാരവും ദുആയും', 97]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['എല്ലാ മാസവും ആവർത്തിക്കുന്ന നഹ്സ് ദിനങ്ങൾ', 98]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഓരോ മാസത്തിലെയും നഹ്സ് ദിനങ്ങൾ', 99]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['മആശിറ', 325]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നികാഹിന്റെ ഖുത്വുബ', 100]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പഠിക്കുമ്പോഴും പഠിപ്പിക്കുമ്പോഴും കരുതേണ്ട നിയ്യത്ത്', 101]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശിഫയുടെ ആയത്തുകൾ', 103]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തിലാവതിന്റെ സുജൂദ്', 104]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തസ്ബീഹ് നിസ്കാരം', 105]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തൗബ നിസ്കാരം', 106]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കുഞ്ഞ് പിറന്നാൽ മന്ത്രിക്കേണ്ടത്', 107]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പ്രസവം എളുപ്പമാവാൻ', 108]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശുക്റിന്റെ സുജൂദ്', 109]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പുതിയ വീട്ടിൽ ഓതേണ്ടത്', 110]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വാലിഹീങ്ങളിൽ ഉൾപ്പെടാനുള്ള ദുആ', 111]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പുതിയ വസ്ത്രം ധരിച്ചവനോട് പറയുക', 112]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഭാര്യ, മക്കളിൽ ആഗ്രഹിച്ചത് കാണാൻ', 113]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['താടി ചീകുമ്പോൾ', 114]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കുളിപ്പുരയിൽ പ്രവേശിക്കുമ്പോൾ', 115]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വീട്ടിൽ പ്രവേശിക്കുമ്പോൾ', 116]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പളളിയിൽ പ്രവേശിക്കുമ്പോൾ', 117]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഒഴിഞ്ഞ സ്ഥലത്ത് പ്രവേശിക്കുമ്പോൾ', 118]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഗർഭിണി ചർദി കൊണ്ട് പ്രയാസമായാൽ', 119]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വാങ്കിന്റെ ശേഷമുള്ള പ്രാർത്ഥനകൾ', 120]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദേഷ്യം വന്നാൽ', 121]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പള്ളിയിലേക്ക് പോവുമ്പോഴുള്ള പ്രാർഥന', 122]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വാങ്കിന് ഉത്തരം ചെയ്യേണ്ടൺ വിധം', 123]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മഴ പെയ്യുമ്പോൾ', 124]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വീട്ടിൽ നിന്ന് പുറപ്പെടുമ്പോൾ', 125]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആകാശത്തേക്ക് നോക്കുമ്പോൾ', 126]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കണ്ണാടിയിലേക്ക് നോക്കുമ്പോൾ', 127]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പള്ളിയിൽ നിന്ന് പുറപ്പെടുമ്പോൾ', 128]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിസർജ്യ സ്ഥലത്ത് നിന്ന് പുറപ്പെടുമ്പോൾ', 129]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മാസം കാണുമ്പോൾ', 130]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വസ്ത്രം ഊരുമ്പോൾ', 131]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അത്തർ മണക്കുമ്പോൾ', 132]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['രോഗിയെ സന്ദർശിക്കുമ്പോൾ', 133]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വസ്ത്രം ധരിക്കുമ്പോൾ', 134]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദാനം ചെയ്യുന്ന സമയത്ത്', 135]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പാല് കുടിക്കുമ്പോൾ', 136]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സംസം വെള്ളം കുടിക്കുമ്പോൾ', 137]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിസർജ്യ സ്ഥലത്ത് പ്രവേശിക്കുമ്പോൾ', 138]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പ്രയാസമനുഭവിക്കുമ്പോൾ', 139]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കടം വീട്ടുമ്പോൾ', 140]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഹസ്തദാനം ചെയ്യുമ്പോൾ', 141]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇടിവെട്ടുമ്പോൾ', 142]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കോട്ടുവായ ഇടുമ്പോൾ', 143]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദലാഇലുൽ ഖൈറാത്ത് ആരംഭിക്കുന്നതിന് മുമ്പ് ചൊല്ലുക', 145]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തിങ്കളാഴ്ചയിലെ ഹിസ്ബ്', 146]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ചൊവ്വാഴ്ചയിലെ ഹിസ്ബ്', 147]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബുധനാഴ്ചയിലെ ഹിസ്ബ്', 148]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വ്യാഴ്ചയിലെ ഹിസ്ബ്', 149]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വെള്ളിയാഴ്ചയിലെ ഹിസ്ബ്', 150]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശനിയാഴ്ചയിലെ ഹിസ്ബ്', 151]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഞായറാഴ്ചയിലെ ഹിസ്ബ്', 152]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദലാഇലിന് ശേഷമുള്ള ദുആയും ബൈതും', 153]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇബ്നു ഹജർ തങ്ങളുടെ സ്വലാത്ത്', 154]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശഫാഅത്തിന് കാരണമാവുന്ന സ്വലാത്ത്', 155]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നബിതങ്ങളെ സ്വപ്നത്തിൽ കാണാനുള്ള സ്വലാത്ത്', 156]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആവശ്യപൂർത്തീകരണത്തിനുള്ള സ്വലാത്ത്', 157]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇമാം ശാഫി (റ) വിന്റെ രണ്ട് സ്വലാത്തുകൾ', 158]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് ജീലാനി (റ) വിന്റെ സ്വലാത്ത്', 159]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് രിഫാഈ (റ) വിന്റെ സ്വലാത്ത്', 160]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് ബദവീ (റ) വിന്റെ സ്വലാത്ത്', 161]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് ദസൂഖീ (റ) വിന്റെ സ്വലാത്ത്', 162]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇമാം ഗസ്സാലി (റ) വിന്റെ സ്വലാത്ത്', 163]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് ഇബ്നു അറബി (റ) വിന്റെ സ്വലാത്ത്', 164]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മശീശിയ്യ സ്വലാത്ത്', 165]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് ശാദുലീ (റ) വിന്റെ സ്വലാത്ത്', 166]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇമാം നവവീ (റ) വിന്റെ സ്വലാത്ത്', 167]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തുൽ ഫാതിഹ്', 168]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തുൽ ഇൻആം', 169]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തുൽ ആലിൽ ഖദ്റ്', 170]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തുൽ കമാലിയ്യ', 171]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നാരിയ്യത്തുസ്വലാത്ത്', 172]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തുൽ മുൻജിയ്യ', 173]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് അലിയ്യുൽ ഹബ്ശി (റ) വിന്റെ സ്വലാത്ത്', 174]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇമാം ഹദ്ദാദ് (റ) വിന്റെ സ്വലാത്ത്', 175]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['താജു സ്വലാത്ത്', 176]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വലാത്തു ത്വിബ്ബ്', 177]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് ഉമർ ഹഫീസ് തങ്ങളുടെ ചില സ്വലാത്തുകൾ', 337]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശൈഖ് അബൂബക്ർ സാലിം (റ) വിന്റെ സ്വലാത്ത്', 338]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മിഫ്താഹുൽ ഖൈറാത്ത്', 205]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബശാഇറുൽ ഖൈറാത്ത്', 324]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സലാം ബൈത്', 178]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശറഫൽ അനാം മൗലിദ്', 179]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മൻഖൂസ് മൗലിദ്', 180]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബർസൻജി മൗലിദ്', 181]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബദ്ർ മൗലിദ്', 182]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുഹിയുദ്ദീൻ മൗലിദ്', 183]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അംലദുൽ ഗുസ്നൈൻ മൗലിദ്', 184]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അശ്റഖ ബൈത്ത്', 185]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['യാ അക്റമ ബൈത്ത്', 186]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['ബുർദ', 329]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുളരിയ്യ', 330]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുഹമ്മദിയ്യ', 187]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['വിതരിയ', 188]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വല്ലൽ ഇലാഹു ബൈത്ത് (ഉമർ ഖാസി (റ))', 189]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അഹമദുല്ലാഹൽ വലീ ബൈത്ത്', 190]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റൗളയിൽ എഴുതപ്പെട്ട ബൈത്ത്', 191]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖദീജ ബീവി തവസ്സുൽ ബൈത്ത്', 192]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഫാത്തിമാ ബീവി തവസ്സുൽ ബൈത്ത്', 193]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മറിയം ബീവി തവസ്സുൽ ബൈത്ത്', 194]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖുത്ബിയ്യത്ത്', 195]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മഹ്ളറത്തുൽ ബദ്രിയ്യ', 196]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തഅ്ജീലുൽ ഫുതൂഹ്', 197]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുഹ്‌യിദ്ധീൻ മാല', 198]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖംരിയ്യ ബൈത്ത്', 322]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദഫ്ഉൽ ബലാഅ് ബൈത്ത് (ശൈഖ് ജിഫ്രി (റ))', 200]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അജ്മീർ തവസ്സുൽ ബൈത്ത്', 201]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുൽത്താനുൽ ഹിന്ദ് മദ്ഹ് ബൈത്ത്', 202]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സി എം വലിയുല്ലാഹി തവസ്സുൽ ബൈത്ത്', 203]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആരംഭപൂവായ ബൈത്ത്', 204]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആദി അവ്വൽ ബൈത്ത്', 312]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആദി അമൈത്തെ ബൈത്ത്', 313]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബദ്രീങ്ങളെ തവസ്സുലാക്കിയുള്ള ബൈത്ത്', 314]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മക്കത്തുദിത്ത ബൈത്ത്', 315]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അബ്ജദ് ബൈത്ത്', 316]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അഖ്സാം ബൈത്ത്', 317]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സി എം വലിയുല്ലാഹി തവസ്സുൽ ബൈത്ത് 2', 318]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആമിന ബീവി തവസ്സുൽ ബൈത്ത്', 319]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആഇശ ബീവി തവസ്സുൽ ബൈത്ത്', 320]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മജ്ലിസ്, ക്ലാസ് തുടങ്ങിയവയുടെ ഒടുവിൽ ചൊല്ലേണ്ട ബൈത്ത്', 70]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വർഷാവസാനത്തിൽ ചൊല്ലേണ്ട ദുആ', 206]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വർഷാദ്യത്തിൽ ചൊല്ലേണ്ട ദുആ', 207]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വർഷാദ്യത്തിലെ മറ്റൊരു ദുആ', 208]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുഹറം ആദ്യ പത്തിൽ ചൊല്ലേണ്ടത്', 209]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['113 ബിസ്മി എഴുതൽ', 210]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['360 ആയതുൽ കുർസി  ഓതൽ', 211]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ജീവികളുടെ ശല്യങ്ങളിൽ നിന്ന് വീടിന് കാവലുണ്ടവാൻ', 212]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആശൂറാ നാളിലെ ദുആ', 213]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആശൂറാ നാളിൽ 70 വട്ടം', 214]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആശൂറാ നാളിൽ 360 വട്ടം', 215]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആശൂറാ നാളിൽ 1000 വട്ടം', 216]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സൂറത്തുൽ ഇഖ്ലാസ് 1000 ഓതിയ ശേഷമുള്ള പ്രാർഥന', 217]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ആശൂറാ നാളിലെ മറ്റൊരു ദുആ', 218]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സ്വഫർ ആദ്യ ദിനത്തിലും ഒടുവിലത്തെ ബുധനിലും', 219]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റജബ് ആദ്യ രാവിലെ ദുആ', 220]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഇമാം ഹദ്ദാദ് (റ) വിന്റെ റജബിലെ ഇസ്തിഗാഫാർ', 221]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റജബിലെ മഗ്രിബിനും സുബ്ഹിക്കും ശേഷം 70 വട്ടം', 222]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റജബിൽ നബി (സ്വ) തങ്ങൾ ചെയ്തിരുന്ന ദുആ', 223]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റജബ് എല്ലാ രാവിലും ചൊല്ലേണ്ട ഇസ്തിഗ്ഫാർ', 224]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശഅ്ബാൻ 15 വരെ ദുഖാൻ ആദ്യ 8 ആയതുകൾ', 225]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശഅ്ബാൻ 14 അസറിന് യാസീൻ ഓതിയ ശേഷം ദുആ', 226]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ശഅ്ബാൻ 15 ന്റെ രാവിൽ യാസീൻ ഓതിയ ശേഷം ദുആ', 227]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദുഖാൻ സൂറത്ത് ഓതിയ ശേഷമുള്ള ദുആ', 228]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബറാഅത്ത് രാവിലെ മറ്റൊരു ദുആ', 229]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദാരിദ്രത്തിൽ നിന്ന് മോചനം ലഭിക്കാനുള്ള ദുആ', 230]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബറാഅത്ത് രാവിൽ 70 വട്ടം', 231]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബറാഅത്ത് രാവിൽ 100 വട്ടം', 232]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബറാഅത്ത് രാവിൽ ശൈഖ് ജീലാനി (റ) വിന്റെ ദുആ', 233]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബറാഅത്ത് രാവിൽ ഇമാം ഹദ്ദാദ് (റ) വിന്റെ ദുആകൾ', 234]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖുർആൻ ഖത്മ് ചെയ്തശേഷമുള്ള ദുആ', 235]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ലൈലതുൽ ഖദ്റിന്റെ രാവുകളിൽ അധികരിപ്പിക്കേണ്ടൺ ദുആ', 236]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റമളാൻ മൂന്ന് പത്തിലും അധികരിപ്പിക്കേണ്ട ദുആ', 237]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഒന്നാം പത്തിൽ', 238]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['രണ്ടാം  പത്തിൽ', 239]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മൂന്നാം പത്തിൽ', 240]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റമളാൻ നോമ്പിന്റെ നിയ്യത്ത്', 241]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നോമ്പ് തുറന്നയുടനെ ചൊല്ലേണ്ടത്', 242]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തറാവീഹ് നിസ്കാരത്തിന്റെ നിയ്യത്ത്', 243]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തറാവീഹിന് ശേഷമുള്ള ദുആ', 244]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തറാവീഹിന് ശേഷമുള്ള മറ്റൊരു ദുആ', 245]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തറാവീഹിന് ശേഷം ഇമാം അത്വാസ് (റ) വിന്റെ ദുആ', 246]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ലൈലതുൽ ഖദ്റിന്റെ രാവുകളിലെ ദുആ', 247]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഒന്നാം പത്തിൽ ചൊല്ലേണ്ട ബൈത്ത്', 248]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['രണ്ടാം പത്തിൽ ചൊല്ലേണ്ട ബൈത്ത്', 249]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മൂന്നാം പത്തിൽ ചൊല്ലേണ്ട ബൈത്ത്', 250]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മാതാപിതാക്കൾക്ക് വേണ്ടിയുള്ള പ്രത്യേക ദുആ', 251]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദുൽഹിജ്ജ ആദ്യ പത്തുദിനങ്ങളിൽ ചൊല്ലേണ്ട ദിക്റ്', 252]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ദുൽഹിജ്ജ ആദ്യപത്തിൽ ചെയ്യേണ്ട ദുആ', 253]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['രണ്ട് പെരുന്നാൾ നിസ്കാരങ്ങൾക്ക് മുമ്പ് 400 തവണ', 254]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ചെറിയ പെരുന്നാൾ നിസ്കാരത്തിന്റെ നിയ്യത്ത്', 255]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബലിപെരുന്നാൾ നിസ്കാരത്തിന്റെ നിയ്യത്ത്', 256]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['പെരുന്നാൾ നിസ്കാരത്തിന്റെ രൂപം', 257]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തക്ബീറിന്റെ പൂർണ രൂപം', 258]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുന്നത്ത് നോമ്പിന്റെ ദിനങ്ങൾ', 259]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സുന്നത്ത് നോമ്പുകളുടെ നിയ്യത്തുകൾ', 260]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അഞ്ച് പുണ്യ രാവുകൾ', 323]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['യാത്രയുടെ മുമ്പുള്ള നിസ്കാരവും ദുആയും', 261]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['യാത്ര തുടങ്ങുമ്പോൾ', 262]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വാഹനം നീങ്ങിത്തുടങ്ങിയാൽ', 263]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിമാനം, കപ്പൽ യാത്രികർ പ്രത്യേകമായി ചൊല്ലുക', 264]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വീട്ടിലേക്ക് തിരിച്ചെത്തുമ്പോൾ', 265]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മയ്യിത്തിന് ആശ്വാസം ലഭിക്കാൻ രണ്ട് റക്അത്ത്', 266]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അതാഖതു സ്സുഖ്റയും കുബ്റയും', 267]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['കഫൻപുടവയിൽ മന്ത്രിച്ച മണ്ണ് വെക്കൽ', 268]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മയ്യിത്ത് നിസ്കാരം', 269]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മയ്യിത്തിനെ ഖബറിൽ വെക്കുമ്പോൾ ചൊല്ലേണ്ടത്', 270]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['തസ്ബീത്', 271]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['തഅ്സിയതിന്റെ സന്ദർഭത്തിൽ പറയേണ്ടത്', 272]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['തൽഖീൻ', 273]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖബ്റിസ്ഥാനിൽ പ്രവേശിക്കുമ്പോൾ', 274]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖബ്റിലേക്ക് മണ്ണിടുമ്പോൾ പറയേണ്ടത്', 275]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഖബറിന്റെ മുകളിൽ വെള്ളമൊഴിക്കുമ്പോൾ', 276]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['ഇഹ്റാം', 280]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മക്കയിലേക്ക് പ്രവേശിക്കുമ്പോൾ ചൊല്ലുക', 281]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['ത്വവാഫ്', 282]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുൽതസമിലെ ദുആ', 283]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മഖാമു ഇബ്റാഹീമിലെ ദുആ', 284]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഹിജ്റ് ഇസ്മായിലിലെ ദുആ', 285]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സംസം കുടിക്കുമ്പോൾ ചൊല്ലുക', 286]);
  await _db.rawQuery(
      ' UPDATE Items SET  malayalam_text =?  WHERE   id = ?', ['സഈയ്', 287]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുടികളയുന്നതിന് മുമ്പും ശേഷവും ചൊല്ലുക', 288]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മിനയിലേക്ക് പുറപ്പെടുമ്പോൾ', 289]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അറഫയിലെ ദിക്റുകൾ', 290]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മുസ്ദലിഫയിലും മസ്ജിദുൽ ഹറാമിലും', 291]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മിനയിൽ രണ്ടാം പ്രാവശ്യം എത്തുമ്പോൾ ചൊല്ലുക', 292]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ജംറത്തുൽ അഖബയിൽ', 293]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['വിടവാങ്ങൽ ത്വവാഫ്', 294]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മദീനയിലേക്ക് പ്രവേശിക്കുമ്പോൾ ചൊല്ലുക', 295]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['മസ്ജിദുന്നബവിയിലേക്ക് പ്രവേശിക്കുമ്പോൾ', 296]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['റൗളയിൽ തഹിയ്യത്ത് നിസ്കരിച്ച ശേഷം ചൊല്ലേണ്ടത്', 297]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നബി (സ്വ) തങ്ങൾക്ക് സലാം ചൊല്ലേണ്ട രൂപം', 298]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['അബൂബക്ർ (റ) വിന് സലാം ചൊല്ലേണ്ട രൂപം', 299]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉമർ (റ) വിന് സലാം ചൊല്ലേണ്ട രൂപം', 300]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['സലാം ചൊല്ലിയ ശേഷമുള്ള ദുആ', 301]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ജന്നതുൽ ബഖീഇൽ ഉള്ളവർക്ക് സലാം ചൊല്ലേണ്ട രൂപം', 302]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉസ്മാൻ (റ) വിന് സലാം ചൊല്ലേണ്ട രൂപം', 303]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നബി (സ്വ) യുടെ മക്കൾക്കും മുഅ്മിനീങ്ങൾക്കുമുള്ള സലാം', 304]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നബി (സ്വ) യുടെ ഭാര്യമാർക്കുള്ള സലാം', 305]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നബി (സ്വ) യുടെ പെൺമക്കൾക്കുള്ള സലാം', 306]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉഹ്ദ് ശുഹദാക്കളോട് സലാം പറയേണ്ട രൂപം', 307]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['നാട്ടിലേക്ക് മടങ്ങുമ്പോൾ അധികരിപ്പിക്കുക', 308]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ബദ്ർ തവസ്സുൽ ബൈത്', 327]);
  await _db.rawQuery(' UPDATE Items SET  malayalam_text =?  WHERE   id = ?',
      ['ഉഹ്ദ് തവസ്സുൽ ബൈത്', 328]);
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
        '(3,1, "Tahajjud Prayer", "صلاة التهجد", "false", "assets/pdf/01 Tahajjud prayer.pdf")');
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
        '(21,2, "Luha Prayer", "صلاة الضحى", "false", "assets/pdf/04 Luha prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(22,2, "Zikr and Dua after Luha", "الأذكار والدعاء بعد صلاة الضحى", "false", "assets/pdf/04 Zikr and Dua after Luha.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(19,3, "Azkar After Five Daily Prayers", "الأذكار بعد صلوات الخمس", "false", "assets/pdf/03 Azkar After Five Prayers.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(20,3, "Surahs in Audible Prayers according to Order", "ترتيب سور الجهرية للإمام الحداد", "false", "assets/pdf/03 Surahs to be Recited Haddad Order.pdf")');

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
        '(36,7, "Aqeeda for Strengethining Your Faith", "عقيدة الإمام أبي بكر السكران", "false", "assets/pdf/07 Aqeeda for  Faith.pdf")');

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
    // await txn.rawInsert(
    //     'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
    //     '(51,9, "Long Qunut", "القنوت الكبير", "false", "assets/pdf/09 Long Qunut.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(52,9, "Zikr & Ayahs Before Sleeping", "الأذكار والآيات قبل النوم", "false", "assets/pdf/10 Zikr & Ayahs Before Sleeping.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(53,9, "To Make a daily routine", "واظبوا كل يوم", "false", "assets/pdf/10 To Make a daily routine.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(4,10, "Dua of Asma-Ul-Husna", "دعاء أسماء الله الحسنى", "false", "assets/pdf/01 Dua of Asma-ul-Husna.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(144,10, "Names of prophet Muhammed (s)", "أسماء النبي (ص)", "false","assets/pdf/13 Names of prophet Muhammed (s)_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(47,10, "Ratib-ul-Haddad", "راتب الإمام الحداد", "false", "assets/pdf/09 Ratib-ul-Haddad.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(310,10, "Asma-ul-Badr", "أسماء البدر", "false", "assets/pdf/09 Asma-ul-Badr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(309,10, "Regular dua.pdf", "أدعية العام", "false", "assets/pdf/09 Regular dua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(102,10, "Prophetic Dua for Healing", "الأدعية النبوية للشفاء", "false", "assets/pdf/12 Prophetic Dua for Healing.pdf")');

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
        '(326,11, "Zikr for Ease of Livelihood", "سبعون مرة لقضاء الدين", "false", "assets/pdf/11 Seventy Times of Livelihood.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(59,11, "Qaseeda For Strengthening Faith", "إلهي لست للفردوس", "false", "assets/pdf/11 Qaseeda For Strengthening Faith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(60,11, "100 Thasbeeh after Jumua", "التسبيح", "false", "assets/pdf/11 100 Thasbeeh after Jumua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(61,11, "Seventy Times To Get rid of Debt", "سبعة مرة لتسهيل الرزق", "false", "assets/pdf/11 To Get rid of Debt.pdf")');
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
        '(325,12, "Ma-ashira", "معاشر", "false", "assets/pdf/12 Ma-ashira.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(100,12, "Nikah Khutuba", "خطبة النكاح", "false", "assets/pdf/12 Nikah Khutuba.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(101,12, "Niyyah While Teaching And Studying", "نية التعلم والتعليم", "false", "assets/pdf/12 Niyyah to Recite While Teaching.pdf")');
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

    // await txn.rawInsert(
    //     'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
    //     '(144,13, "Names of prophet Muhammed (s)", "أسماء النبي (ص)", "false","assets/pdf/13 Names of prophet Muhammed (s)_.pdf")');
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
        '(337,13, "Swalat of Habeeb Umer Bin Hafeez", "بعض الصلوات للحبيب عمر", "false", "assets/pdf/13 Some Forms of Swalat of Habeeb Umer Bin Hafeez.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(338,13, "Swalat of Sheikh Abu Backer Bin Salim", "بعض الصلوات للشيخ أبو بكر بن سالم", "false", "assets/pdf/13 Another Swalat of Sheikh Abu Backer Bin Salim.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(205,13, "Mifthaul  Hairath", "مفتاح الخيرات", "false", "assets/pdf/13 swalath mifthahul khairat compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(324,13, "Bashair-ul-khairat", "بشائر الخيرات", "false", "assets/pdf/13 Bashair-ul-Khairat.pdf")');

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
        '(183,14, "Muhyidheen Moulid", "مولد محي الدين", "false", "assets/pdf/14 Muhyidheen Moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(184,14, "Amladul Gusnain moulid", "مولد أملد الغصنين مختصر مولد الحسنين", "false", "assets/pdf/14 Amladul Gusnain moulid.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(198,14, "Muhyudheen Mala", "محي الدين مال", "false", "assets/pdf/14 Muhyudheen Mala.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(185,15, "Ashraqa Baith", "أشرق بيت", "false", "assets/pdf/15 Ashraqa Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(186,15, "Ya Akrama Baith", "يا أكرم بيت", "false", "assets/pdf/15 Ya Akrama Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(329,15, "Qaseedat-ul Burda", "قصيدة البردة", "false", "assets/pdf/15 Qaseedat-ul Burda of Imam Busweeri.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(330,15, "Qaseedat-ul Mulariyya", "القصيدة المضرية", "false", "assets/pdf/15 Qaseedat-ul_ _Mulariyya of Imam Busweeri.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(187,15, "Qaseedath-ul Muhammadiyya", "القصيدة المحمدية", "false", "assets/pdf/15 Qaseedath-ul Muhammadiyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(188,15, "Qaseedat-ul Witriyya", "قصائد الوترية", "false", "assets/pdf/15 Qaseedat-ul Witriyya.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(316,15, "Abjad Baith", "أبجد بيت", "false", "assets/pdf/15 Abjad Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(317,15, "Aqsam baith", "أقسام بيت", "false", "assets/pdf/15 Aqsam Baith.pdf")');
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
    // await txn.rawInsert(
    //     'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
    //     '(198,15, "Muhyudheen Mala", "محي الدين مال", "false", "assets/pdf/15 Muhyudheen Mala.pdf")');
    // await txn.rawInsert(
    //     'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
    //     '(321,15, "Majlisunnoor", "مجلس النور", "false", "assets/pdf/15 Majlisunnoor.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(322,15, "Al-Qaseedatul Qamriyya", "القصيدة الخمرية", "false", "assets/pdf/15 Al-Qaseedatul khamriyya.pdf")');
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
        '(203,15, "C.M Waliyyullah Tawassul Baith", "التوسل بولي الله سي يم المدووري", "false", "assets/pdf/15 C.M Waliyyullah Tawassul Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(204,15, "Aaramba Poovaya Baith", "نشيدة الشيخ الكندوري في مدح الحبيب", "false", "assets/pdf/15 Aaramba Poovaya Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(312,15, "Aadi Avval Baith", "آد أول بيت", "false", "assets/pdf/15 Aadi Awwal Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(313,15, "Aadi Amaite Baith", "آد أميت بيت", "false", "assets/pdf/15 Aadi Amaite Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(314,15, "Badr Tawassul Baith", "بدر توسل بيت", "false", "assets/pdf/15 Badr Tawassul Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(315,15, "Makkathuditha Baith", "مكتدت بيت ", "false", "assets/pdf/15 Makkathuditha Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(318,15, "C.M Waliyyullah Tawassul Baith 2", "سي ام ولي الله بيت ", "false", "assets/pdf/15 C.M Waliyyullah_ _Tawassul_ _Baith 2.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(319,15, "Sayyidatuna Amina Tawassul Baith", "سيدتنا آمنة توسل بيت", "false", "assets/pdf/15 Sayyidatuna Amina_ _Tawassul_ _Baith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(320,15, "Sayyidatuna Ayisha Tawassul", "سيدتنا عائشة توسل بيت", "false", "assets/pdf/15 Sayyidatuna Ayisha Tawassul.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(327,15, "Badr Tawassul Baith -1", "التوسل بأهل بدر ", "false", "assets/pdf/15 ashabul badr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(328,15, "Uhd Thawassul Baith", "التوسل بأهل أحد", "false", "assets/pdf/15 uhd tawassil.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(70,15, "Baith and Ayath at the End of Majlis and Class", "القصيدة التي تقرأ في آخر المجالس", "false", "assets/pdf/12 Baith at the End of Majlis.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(206,16, "Dua on the Last Day of the Year", "دعاء آخر العام", "false", "assets/pdf/18 Dua on the Last Day of the Year.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(207,16, "Dua on the First Day of the Year", "دعاء أول العام", "false", "assets/pdf/18 Dua on the First Day of the Year.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(208,16, "Dua on the First Day of the Year By Imam Ali Al-habshi ", "دعاء أول العام للحبشي", "false", "assets/pdf/18 Another Dua on the First Day of the Year By Imam Ali Bin Muhammed Al-habshi.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(209,16, "Dua to be Done on the First Ten Days of Muharram", "دعاء يقال في العشر الأول من المحرم", "false", "assets/pdf/18 Dua to be Done on the First Ten Days of Muharram in order to be Guarded from the Devil.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(210,16, "Writing of Bismi 113 Times", "كتابة البسمة مائة وثلاثة عشر مرة", "false", "assets/pdf/18 Writing of Bismi 113 Times.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(211,16, "Ayathulkursi 360 times", "قراءة آية الكرسي ثلاثمائة وستين مرة", "false", "assets/pdf/18 Ayathul_ _kursi 360 times.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(212,16, "To Get Protection for Home From Difficult Creature", "لحفظ المنزل من الحيوانات المضرة", "false", "assets/pdf/18 To Get Protection for Home From Difficult Creature.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(213,16, "Dua on Ashoora Day", "دعاء في يوم عاشوراء", "false", "assets/pdf/18 Dua on Ashura Day.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(214,16, "70 Times on Ashura Day", "سبعون مرة في يوم عاشوراء", "false", "assets/pdf/18 _70 Times on Ashura Day.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(215,16, "300 Times on Ashura Day", "ثلاثمائة مرة في يوم عاشوراء", "false", "assets/pdf/18 _300 Times on Ashura Day_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(216,16, "1000 Times on Ashura Day", "ألف مرة في يوم عاشوراء", "false", "assets/pdf/18 _1000 Times on Ashura Day_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(217,16, "Dua after Reciting Al-Ikhlas 1000 Times on Ashura Day", "الدعاء بعد قراءة سورة الإخلاص ألف مرة في يوم عاشوراء", "false", "assets/pdf/18 Dua after Reciting Surah Al-Ikhlas 1000 Times on Ashura Day_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(218,16, "Another Dua on Ashura Day", "دعاء آخر في يوم عاشوراء", "false", "assets/pdf/18 Another Dua on Ashura Day.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(219,16, "Dua in first day of Month Safar", "دعاء اليوم الأول ويوم الأربعاء الآخر من صفر", "false", "assets/pdf/18 Dua in first day of Month Safar _.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(220,16, "Dua for First Night of Rajab By Sheikh Jeelani", "دعاء يقال في أول ليلة من شهر رجب", "false", "assets/pdf/18 Dua for First Night of Rajab Taught By Sheikh Jeelani.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(221,16, "Istighfaar by Imam Haddad to be recited seven times everyday in Rajab", "استغفار الإمام الحداد في رجب", "false", "assets/pdf/18 Istighfaar Suggested by Imam Haddad to be _recited seven times everyday in the month of _Rajab.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(222,16, "70 Times Istighfar Daily in Rajab", "استغفار يقرأ سبعون مرة وقت الفجر والمغرب", "false", "assets/pdf/18 _70 Times Istighfar Daily in the Holy Month of Rajab during the Time of Fajr and Maghrib.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(223,16, "Dua of Prophet (S.A) when the moon of Rajab is sighted", "دعاء النبي (ص) إذا حضر شهر رجب", "false", "assets/pdf/18 Duaof Prophet Muhammed (S.A) when the moon of Rajab is sighted_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(224,16, "Istighfaru Rajab in every night of Rajab", "استغفار رجب يقرأ كل ليلة من رجب", "false", "assets/pdf/18 Istighfaru Rajab to be chanted every night of Rajab.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(225,16, "First Eight Ayahs from Sura Al-Dukhan", "ثمانية آيات من أول سورة الدخان في شعبان", "false", "assets/pdf/18 First Eight Ayahs from Sura Al-Dukhan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(226,16, "After asr of shahban 14", "دعاء سورة يس بعد عصر رابع عشر من شعبان", "false", "assets/pdf/18 After asr of shahban 14_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(227,16, "Between Isha and Maghrib on Baraat Night", "دعاء سورة يس في ليلة النصف من شعبان", "false", "assets/pdf/18 Between Isha and Maghrib on Baraat Night.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(228,16, "Dua On Baraat Day, after Magrib", "دعاء يقرأ بعد قراءة سورة الدخان", "false", "assets/pdf/18 Dua On Baraat Day, after reciting SuraFatiha and Al-Dhukhan after Magrib.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(229,16, "Special Dua on Baraat Day", "دعاء آخر في ليلة البراءة", "false", "assets/pdf/18 Special Dua on Baraat Day.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(230,16, "Dua to Prevent Proverty", "دعاء للسلامة من الفقر", "false", "assets/pdf/18 Dua to Prevent Proverty.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(231,16, "70 Times on Baraat night", "سبعون مرة في ليلة البراءة", "false", "assets/pdf/18 _70 Times on Baraat night.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(232,16, "100 Times on Baraat night", "مائة مرة في ليلة البراءة", "false", "assets/pdf/18 _100 Times on Baraat night.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(233,16, "Dua of Sheikh Jeelani in the Night of Baraat", "دعاء الشيخ الجيلاني في ليلة البراءة", "false", "assets/pdf/18 Dua of Sheikh Jeelani in the Night of Baraat.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(234,16, "Two Dua of Imam Abdullahil Haddad", "دعاءان للإمام الحداد في ليلة البراءة", "false", "assets/pdf/18 Two Dua of Imam Abdullahil Haddad.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(235,16, "Dua Khatam-ul Quran", "دعاء ختم القرآن", "false", "assets/pdf/18 Dua Khatam-ul Quran.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(236,16, "To Increase in LailathulQadr", "يكثر هذا الدعاء في ليالي ليلة القدر", "false", "assets/pdf/18 To Increase in Lailathul_ _Qadr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(237,16, "To Increase in the three Tens of Ramadan", "يكثر في العشر الثلاث", "false", "assets/pdf/18 To Increase in the three Tens of Ramadan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(238,16, "Dua in the First Ten", "دعاء العشر الأول", "false", "assets/pdf/18 Dua in the First Ten.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(239,16, "Dua in the Second Ten", "دعاء العشر الثاني", "false", "assets/pdf/18 Dua in the Second Ten.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(240,16, "Dua in the Third Ten", "دعاء العشر الثالث", "false", "assets/pdf/18 Dua in the Third Ten.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(241,16, "Intention for fast in ramadan", "نية صوم رمضان", "false", "assets/pdf/18 Intention For Fast_ __ in Ramadan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(242,16, "Dua after Breaking Fast", "يقال عقب الفطر", "false", "assets/pdf/18 Azkar & Dua after Breaking Fast.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(243,16, "Intention of Taraweeh", "نية التراويح", "false", "assets/pdf/18 Intention of Taraweeh.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(244,16, "Dua after Taraweeh Prayer", "دعاء يقال بعد التراويح", "false", "assets/pdf/18 Dua after Taraweeh Prayer new.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(245,16, "Another Dua after Taraweeh", "دعاء آخر بعد التراويح", "false", "assets/pdf/18 Another Dua after Taraweeh.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(246,16, "Another Dua of Imam Al-Atwaas after Taraweeh", "دعاء الإمام العطاس بعد التراويح", "false", "assets/pdf/18 Another Dua of Imam Al-Atwaas after Taraweeh_.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(247,16, "Dua in Lailathul Qadr", "دعاء يقال في ليالي ليلة القدر", "false", "assets/pdf/18 Dua in Lailathul Qadr.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(248,16, "Qaseeda in the First Ten of Ramadan", "قصيدة للعشر الأول", "false", "assets/pdf/18 Qaseeda in the First Ten of Ramadan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(249,16, "Qaseeda in the Second Ten of Ramadan", "قصيدة للعشر الثاني", "false", "assets/pdf/18 Qaseeda in the Second Ten of Ramadan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(250,16, "Qaseeda in the Third Ten of Ramadan", "قصيدة للعشر الثالث", "false", "assets/pdf/18 Qaseeda in the Third Ten of Ramadan.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(251,16, "Dua for Parents", "دعاء بر الوالدين للإمام أبي الحب", "false", "assets/pdf/18 Dua_ _For Parents.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(252,16, "In Ten Days of Dul-Hijja", "ما يقال في العشر الأول من ذي الحجة", "false", "assets/pdf/18 In Ten Days of Dul-Hijja.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(253,16, "Dikr  on the Ten Days of Dul-Hijja to Get rid of Debt", "دعاء في العشر الأول من ذي الحجة", "false", "assets/pdf/18 Zikhr to Do on the Ten Days of Dul-Hijjato Get rid of Debt.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(254,16, "400 Times Before Both Eid Prayers", "ما يقال قبل صلاتي العيدين أربعمائة مرة", "false", "assets/pdf/18 _400 Times Before Both Eid Prayers.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(255,16, "Intention of Eid-ul-Fitr Prayer", "نية صلاة العيد الأصغر", "false", "assets/pdf/18 Intention of Eid-ul-Fitr Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(256,16, "Intention of Eid-ul-Alha Prayer", "نية صلاة عيد الأضحى", "false", "assets/pdf/18 Intention of Eid-ul-Alha Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(257,16, "Form of Performing Eid Prayer", "كيفية صلاة العيدين", "false", "assets/pdf/18 Form of Performing Eid Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(258,16, "Thakbeer", "التكبير الكامل", "false", "assets/pdf/18 Thakbeer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(259,16, "Special Days For Voluntary Fasts", "أيام صيام التطوع", "false", "assets/pdf/18 Special Days For Voluntary Fasts.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(260,16, "Niyyah of Voluntary Fasts", "نيات صيام التطوع", "false", "assets/pdf/18 Niyyah of Voluntary Fasts.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(323,16, "Five Holy Nights", "الليالي الخمسة الفاضلة", "false", "assets/pdf/16 Five Holy Nights.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(261,17, "Two Rak’ahs Before Journey & Dua", "ركعتان قبل السفر", "false", "assets/pdf/19 Two Rakahs Before Journey _ __& Dua.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(262,17, "At the Begening of Journey", "ما يقال وقت الخروج", "false", "assets/pdf/19 At the Begening of Journey.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(263,17, "When Getting into The Vehicle", "ما يقال عند الركوب", "false", "assets/pdf/19 When Getting into the Vehicle new.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(264,17, "Additional Adkar for Plane and Ship Passengers", "ما يقول مسافر الطائرة والسفينة خاصة", "false", "assets/pdf/19 Additional Azkar for Plane and Ship Passengers.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(265,17, "To Recite When Entering Home", "ما يقول قبل الدخول إلى المنزل", "false", "assets/pdf/19 To Recite When Entering Home.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(266,18, "Two Rak’ahs For the Deceased", "صلاة الأنس", "false", "assets/pdf/20 Two Rakahs For the Deceased.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(267,18, "Azkar upon mayyith", "العتاقة الصغرى والعتاقة الكبرى", "false", "assets/pdf/20 Azkar upon mayyith.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(268,18, "Soil Chanted with Zikr on the Kafan Cloth", "وضع التربة في الكفن", "false", "assets/pdf/20 Soil Chanted with Zikr on the Shroud (Kafan Cloth).pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(269,18, "Janaza Prayer", "صلاة الجنازة", "false", "assets/pdf/20 Janaza Prayer.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(270,18, "When Laying the Janaza in The Grave", "عند وضع الميت في القبر", "false", "assets/pdf/20 When Laying the Janaza in The Grave.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(271,18, "Tasbeeth", "التثبيت", "false", "assets/pdf/20 Tasbeeth.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(272,18, "To the Family of the Deceased (Taaziya)", "ما يقال أيام التعزية لأهل الميت", "false", "assets/pdf/20 To the Family of the Deceased_ _on the Day _of Condolence (Taaziya).pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(273,18, "Talqeen", "التلقين", "false", "assets/pdf/20 Talqeen.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(274,18, "When Entering the Graveyard", "عند الدخول إلى المقابر", "false", "assets/pdf/20 When Entering the Graveyard.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(275,18, "When Putting the Soil into the Grave", "عند تصريف التربة إلى القبر", "false", "assets/pdf/20 When Putting_ _the Soil into the Grave.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(276,18, "While Pouring Water on the Grave", "عند صبّ الماء على القبر", "false", "assets/pdf/20 While Pouring Water on the Grave.pdf")');

    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(280,19, "Ihram", "الإحرام", "false", "assets/pdf/21 01 ihram_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(281,19, "While Entering Mecca & Haram", "يقول عند الدخول إلى مكة والحرم", "false", "assets/pdf/21 02 While Entering Mecca _& Haram_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(282,19, "Tawaf", "الطواف", "false", "assets/pdf/21 03 Tawaf_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(283,19, "Dua in Multazam", "دعاء الـملتزم", "false", "assets/pdf/21 04 Dua in Multazam_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(284,19, "Dua in Maqam Ibrahim", "دعاء مقام إبراهيم", "false", "assets/pdf/21 05 Dua in Maqam Ibrahim_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(285,19, "Dua in Hijr-Ismaeel", "دعاء حجر إسماعيل", "false", "assets/pdf/21 06 Dua in Hijr-Ismaeel_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(286,19, "While Drinking Zam Zam Water", "يقول عند شرب ماء زمزم", "false", "assets/pdf/21 07 While Drinking Zam Zam Water_compressed (1).pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(287,19, "Sai", "السعي بين الصفا والـمروة", "false", "assets/pdf/21 08 Sai_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(288,19, "Dua before cutting hair", "الدعاء عند حلق الشعر", "false", "assets/pdf/21 09 Dua before cutting hair __compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(289,19, "While Travelling to Mina", "يقول عند الخروج إلى منى", "false", "assets/pdf/21 10 While Travelling to Mina_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(290,19, "Adkar of Arafa", "أذكار  عرفة", "false", "assets/pdf/21 11 Adkar of Arafa __compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(291,19, "To Say in Muzthalifah and Mashar al-Haram", "يقول في المزدلفة والمشعر الحرام", "false", "assets/pdf/21 12 To Say in Muzthalifah and Mashar al-_Haram_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(292,19, "While Reaching in Mina Again", "يقول في منى مرّة ثانية", "false", "assets/pdf/21 13 While Reaching in Mina Again_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(293,19, "Jamratul Aqabah", "جمرة العقبة", "false", "assets/pdf/21 14 Jamratul Aqabah_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(294,19, "Intention of Tawaf of Wida", "طواف الوداع", "false", "assets/pdf/21 15 Intention of Tawaf of Wida_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(295,19, "While Entering Madeena", "يقول عند الدخول إلى المدينة", "false", "assets/pdf/21 16 While Entering Madeena_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(296,19, "While Entering Masjid Nabavi", "يقول عند الدخول إلى مسجد النبوي", "false", "assets/pdf/21 17 While Entering Masjid Nabavi_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(297,19, "To Say After Tahiyyah in Roula", "يقول بعد صلاة التحية في الروضة", "false", "assets/pdf/21 18 To Say After Tahiyyah in Roula_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(298,19, "Salam To Muhammad (S)", "كيفية السلام للنبي (ص)", "false", "assets/pdf/21 19 Salam To Muhammad (S)__compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(299,19, "Salam to Aboobaker (R)", "كيفية السلام لأبي بكر (ر)", "false", "assets/pdf/21 20 Salam to Aboobaker (R)__compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(300,19, "Salam to Umer(R)", "كيفية السلام لعمر (ر)", "false", "assets/pdf/21 21 Salam to Umer(R)__compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(301,19, "Dua After Salam", "الدعاء بعد السلام", "false", "assets/pdf/21 22 Dua After Salam_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(302,19, "Salam for Jannat al-Baqi", "كيفية السلام لأهل البقيع", "false", "assets/pdf/21 23 Salam for Jannat al-Baqi_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(303,19, "Salam to Uthman Bin Affan", "كيفية السلام لعثمان (ر)", "false", "assets/pdf/21 24 Salam to Uthman Bin Affan_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(304,19, "Salam to Childrens of Prophet(S)", "كيفية السلام لأولاد النبي (ص)", "false", "assets/pdf/21 25 Salam to Childrens of Prophet(S) __compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(305,19, "Salam to Wives of Prophet(S)", "كيفية السلام لزوجات النبي (ص)", "false", "assets/pdf/21 26 Salam to Wives of Prophet  __(S)__compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(306,19, "Salam to Daughters of Prophet(S)", "كيفية السلام لبنات النبي (ص)", "false", "assets/pdf/21 27 Salam to Daughters of Prophet _(S)__compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(307,19, "Salam to Shuhada of Uhud", "كيفية السلام لشهداء أحد (ر)", "false", "assets/pdf/21 28 Salam to Shuhada of Uhud_compressed.pdf")');
    await txn.rawInsert(
        'INSERT INTO Items(id,cat_id, title, subTitle,isFavorite, imgUrl) VALUES'
        '(308,19, "To Increase in Returning", "يكثر في الرجوع إلى البلد", "false", "assets/pdf/21 29 To Increase in Returning __compressed.pdf")');
    //start with 331
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
  itemsNotifier.notifyListeners();
  if (value.isEmpty) {
    itemsNotifier.value.addAll(searchItemsNotifier);
  } else {
    searchItemsNotifier.forEach((userDetail) {
      if (userDetail.title.toLowerCase().contains(value.toLowerCase()) ||
          userDetail.subTitle.toLowerCase().contains(value.toLowerCase()))
        itemsNotifier.value.add(userDetail);
    });

    // itemsNotifier.value = searchItemsNotifier
    //     .where((element) =>
    //         element.title.toLowerCase().contains(value.toLowerCase()))
    //     .toList();

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
