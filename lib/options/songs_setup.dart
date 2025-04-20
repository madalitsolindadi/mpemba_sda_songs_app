
import 'package:flutter/widgets.dart';

import '../database_helper/database_helper.dart';

class SongsSetup {
  Future<void> initializeSongs() async {
    final songs = await DatabaseHelper().getFruits_dor();
     final songDesc = await DatabaseHelper().getAllSongs_dor();
  if (songs.isEmpty && songDesc.length == 0){
      await DatabaseHelper().insertAllFruits_dor();
      await DatabaseHelper().insertAllSongs_dor();
      await DatabaseHelper().insertAllSongInfo_dor();

      await DatabaseHelper().insertAllFruits_Sw();
      await DatabaseHelper().insertAllSongs_Sw();
      await DatabaseHelper().insertAllSongInfo_Sw();

      await DatabaseHelper().insertAllFruits_amo();
      await DatabaseHelper().insertAllSongs_amo();
      await DatabaseHelper().insertAllSongInfo_amo();

      await DatabaseHelper().insertAllFruits_family();
      await DatabaseHelper().insertAllSongs_family();
      await DatabaseHelper().insertAllSongInfo_family();

      await DatabaseHelper().insertAllFruits_chur();
      await DatabaseHelper().insertAllSongs_chur();
      await DatabaseHelper().insertAllSongInfo_chur();

      await DatabaseHelper().insertAllFruits_senior();
      await DatabaseHelper().insertAllSongs_senior();
      await DatabaseHelper().insertAllSongInfo_senior();

      await DatabaseHelper().insertAllFruits_ivet();
      await DatabaseHelper().insertAllSongs_ivet();
      await DatabaseHelper().insertAllSongInfo_ivet();

      await DatabaseHelper().insertAllFruits_comf();
      await DatabaseHelper().insertAllSongs_comf();
      await DatabaseHelper().insertAllSongInfo_comf();

      await DatabaseHelper().insertAllFruits_path();
      await DatabaseHelper().insertAllSongs_path();
      await DatabaseHelper().insertAllSongInfo_path();

      await DatabaseHelper().insertAllFruits_fam();
      await DatabaseHelper().insertAllSongs_fam();
      await DatabaseHelper().insertAllSongInfo_fam();

      await DatabaseHelper().insertAllFruits_bles();
      await DatabaseHelper().insertAllSongs_bles();
      await DatabaseHelper().insertAllSongInfo_bles();

      await DatabaseHelper().insertAllFruits_new();
      await DatabaseHelper().insertAllSongs_new();
      await DatabaseHelper().insertAllSongInfo_new();

      await DatabaseHelper().insertAllFruits_young();
      await DatabaseHelper().insertAllSongs_young();
      await DatabaseHelper().insertAllSongInfo_young();

      await DatabaseHelper().insertAllFruits_tawo();
      await DatabaseHelper().insertAllSongs_tawo();
      await DatabaseHelper().insertAllSongInfo_tawo();

      await DatabaseHelper().insertAllFruits_tow();
      await DatabaseHelper().insertAllSongs_tow();
      await DatabaseHelper().insertAllSongInfo_tow();

      await DatabaseHelper().insertAllFruits_kab();
      await DatabaseHelper().insertAllSongs_kab();
      await DatabaseHelper().insertAllSongInfo_kab();

      await DatabaseHelper().insertAllFruits_zib();
      await DatabaseHelper().insertAllSongs_zib();
      await DatabaseHelper().insertAllSongInfo_zib();
    }
  }
}