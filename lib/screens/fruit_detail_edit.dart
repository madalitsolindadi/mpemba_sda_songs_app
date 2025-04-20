import 'package:flutter/material.dart';
import 'package:sweet/options/colors_file.dart';
import 'package:sweet/screens/home/blessedtidings_home.dart';
import 'package:sweet/screens/home/church_home.dart';
import 'package:sweet/screens/home/kabango_home.dart';
import 'package:sweet/screens/home/newlines_home.dart';
import 'package:sweet/screens/home/pathfinders_home.dart';
import 'package:sweet/screens/home/sweet_home.dart';
import 'package:sweet/screens/home/tawomboledwa_home.dart';
import 'package:sweet/screens/home/tower_home.dart';
import 'package:sweet/screens/home/youngdorcas_home.dart';
import 'package:sweet/screens/home/ziboda_home.dart';

import '../database_helper/database_helper.dart';
import 'home/amo_home.dart';
import 'home/the_comfort_home.dart';
import 'home/dorica_home.dart';
import 'home/fam_home.dart';
import 'home/family_home.dart';
import 'home/ivet_home.dart';
import 'home/senioryouth_home.dart';

class FruitDetailEdit extends StatefulWidget {
  final int fruitId; // Pass the fruit ID
  final int choir_Id;

  FruitDetailEdit({required this.fruitId, required this.choir_Id});

  @override
  _FruitDetailEditState createState() => _FruitDetailEditState();
}

class _FruitDetailEditState extends State<FruitDetailEdit> {
  late TextEditingController _descriptionController;
  late TextEditingController _fruitConController;
  late TextEditingController _infoController;
  bool _hasChanges = false; // Track if changes have been made
  String? OriginalDescription;
  String? OriginalTitle;
  String? OriginalInfo;
  String choir_title = '';

  late List<Map<String, dynamic>> songs = [];
  late List<Map<String, dynamic>> songInfo = [];
  late List<Map<String, dynamic>> songDesc = [];

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _fruitConController = TextEditingController();
    _infoController = TextEditingController();
    // Load existing details for this fruit
    _loadFruitDetails();
    // Listen for changes in the text field
    _descriptionController.addListener(checkDscChanges);
    // Listen for changes in the text field
    _fruitConController.addListener(checkChanges);
    _infoController.addListener(checkinfoChanges);
  }

  @override
  void dispose() {
    _fruitConController.dispose();
    _descriptionController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  void _loadFruitDetails() async {
    if (widget.choir_Id == 1) {
      final ctitle = 'AMO Choir SongBook';
      final details = await DatabaseHelper().getFruit_amo(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_amo(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_amo(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 2) {
      final ctitle = 'Blessed Tidings SongBook';
      final details = await DatabaseHelper().getFruit_bles(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_bles(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_bles(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 3) {
      final ctitle = 'Church Choir SongBook';
      final details = await DatabaseHelper().getFruit_chur(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_chur(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_chur(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 4) {
      final ctitle = 'The Comforters SongBook';
      final details = await DatabaseHelper().getFruit_comf(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_comf(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_comf(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 5) {
      final ctitle = 'Dorica SongBook';
      final details = await DatabaseHelper().getFruit_dor(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_dor(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_dor(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 6) {
      final ctitle = 'FAM SongBook';
      final details = await DatabaseHelper().getFruit_fam(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_fam(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_fam(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 7) {
      final ctitle = 'Family Voices SongBook';
      final details = await DatabaseHelper().getFruit_family(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_family(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_family(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 8) {
      final ctitle = 'iVet Choir SongBook';
      final details = await DatabaseHelper().getFruit_ivet(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_ivet(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_ivet(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 9) {
      final ctitle = 'Kabango Choir SongBook';
      final details = await DatabaseHelper().getFruit_kab(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_kab(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_kab(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 10) {
      final ctitle = 'Newlines Choir SongBook';
      final details = await DatabaseHelper().getFruit_new(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_new(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_new(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 11) {
      final ctitle = 'PathFinder Choir SongBook';
      final details = await DatabaseHelper().getFruit_path(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_path(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_path(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 12) {
      final ctitle = 'SeniorYouth Choir SongBook';
      final details = await DatabaseHelper().getFruit_senior(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_senior(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_senior(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 13) {
      final ctitle = 'Sweet toTrust SongBook';
      final details = await DatabaseHelper().getFruit_Sw(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_Sw(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_Sw(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 14) {
      final ctitle = 'Tawomboledwa SongBook';
      final details = await DatabaseHelper().getFruit_tawo(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_tawo(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_tawo(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 15) {
      final ctitle = 'Tower ofHope SongBook';
      final details = await DatabaseHelper().getFruit_tow(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_tow(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_tow(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else if (widget.choir_Id == 16) {
      final ctitle = 'Young Dorcas SongBook';
      final details = await DatabaseHelper().getFruit_young(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_young(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_young(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    } else {
      final ctitle = 'Ziboda Choir SongBook';
      final details = await DatabaseHelper().getFruit_zib(widget.fruitId);
      final infor = await DatabaseHelper().getSongInfo_zib(widget.fruitId);
      final detailsz =
          await DatabaseHelper().getFruitDetails_zib(widget.fruitId);

      if (details.isNotEmpty) {
        setState(() {
          OriginalDescription = detailsz.first['description'];
          //_descriptionController.text = details[0]['description'];
          _descriptionController.text = OriginalDescription!;
          OriginalTitle = details.first['name'];
          OriginalInfo = infor.first['song_ref'];
          //_fruitConController.text = details[0]['name'];
          _fruitConController.text = OriginalTitle!;
          _infoController.text = OriginalInfo!;
          songInfo = infor;
          songs = details;
          songDesc = detailsz;
          choir_title = ctitle;
        });
      }
    }
  }

  void checkChanges() {
    if (_fruitConController.text != OriginalTitle) {
      setState(() {
        _hasChanges = true;
      });
    }
  }

  void checkinfoChanges() {
    if (_infoController.text != OriginalInfo) {
      setState(() {
        _hasChanges = true;
      });
    }
  }

  void checkDscChanges() {
    if (_descriptionController.text != OriginalDescription) {
      setState(() {
        _hasChanges = true;
      });
    }
  }

  void _saveChanges() async {
    if (widget.choir_Id == 1) {
      await DatabaseHelper()
          .updateFruitDetail_amo(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_amo(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_amo(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 2) {
      await DatabaseHelper()
          .updateFruitDetail_bles(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_bles(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_bles(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 3) {
      await DatabaseHelper()
          .updateFruitDetail_chur(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_chur(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_chur(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 4) {
      await DatabaseHelper()
          .updateFruitDetail_comf(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_comf(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_comf(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 5) {
      await DatabaseHelper()
          .updateFruitDetail_dor(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_dor(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_dor(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 6) {
      await DatabaseHelper()
          .updateFruitDetail_fam(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_fam(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_fam(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 7) {
      await DatabaseHelper().updateFruitDetail_family(
          widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_family(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_family(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 8) {
      await DatabaseHelper()
          .updateFruitDetail_ivet(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_ivet(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_ivet(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 9) {
      await DatabaseHelper()
          .updateFruitDetail_kab(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_kab(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_kab(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 10) {
      await DatabaseHelper()
          .updateFruitDetail_new(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_new(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_new(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 11) {
      await DatabaseHelper()
          .updateFruitDetail_path(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_path(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_path(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 12) {
      await DatabaseHelper().updateFruitDetail_senior(
          widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_senior(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_senior(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 13) {
      await DatabaseHelper()
          .updateFruitDetail_Sw(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_Sw(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_Sw(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 14) {
      await DatabaseHelper()
          .updateFruitDetail_tawo(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_tawo(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_tawo(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 15) {
      await DatabaseHelper()
          .updateFruitDetail_tow(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_tow(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_tow(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 16) {
      await DatabaseHelper()
          .updateFruitDetail_young(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_young(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_young(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    } else if (widget.choir_Id == 17) {
      await DatabaseHelper()
          .updateFruitDetail_zib(widget.fruitId, _descriptionController.text);
      await DatabaseHelper()
          .updateFruit_zib(widget.fruitId, _fruitConController.text);
      await DatabaseHelper()
          .updateSongInfo_zib(widget.fruitId, _infoController.text);
      setState(() {
        OriginalDescription = _descriptionController.text;
        OriginalTitle = _fruitConController.text;
        _hasChanges = false;
      });
    }
    // Show confirmation message or navigate back
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        getContentNumber(widget.fruitId - 1) +
            "- " +
            _fruitConController.text +
            "\nSaved successfully",
        style: TextStyle(fontSize: 20),
      ),
      duration: Duration(seconds: 5),
    ));
    var HomePage;
    int choir_Id = widget.choir_Id;

    switch (choir_Id) {
      case 1:
        HomePage = AmoHome();
        break;
      case 2:
        HomePage = BlessedHome();
        break;
      case 3:
        HomePage = ChurchHome();
        break;
      case 4:
        HomePage = ComfortHome();
        break;
      case 5:
        HomePage = DoricaHome();
        break;
      case 6:
        HomePage = FamHome();
        break;
      case 7:
        HomePage = FamilyHome();
        break;
      case 8:
        HomePage = IvetHome();
        break;
      case 9:
        HomePage = KabangoHome();
        break;
      case 10:
        HomePage = NewlinesHome();
        break;
      case 11:
        HomePage = PathfindersHome();
        break;
      case 12:
        HomePage = SenioryouthHome();
        break;
      case 13:
        HomePage = SweetHome();
        break;
      case 14:
        HomePage = TawomboledwaHome();
        break;
      case 15:
        HomePage = TowerHome();
        break;
      case 16:
        HomePage = YoungdorcasHome();
        break;
      case 17:
        HomePage = ZibodaHome();
        break;
      default:
    }
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage));
    //Navigator.pop(context); // Go back to previous screen after saving changes
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          // Check if there's a previous screen and pop if so
          if (Navigator.canPop(context)) {
            // Navigate back to the home screen
            Navigator.pop(context);
            return false;
          }
          return true;
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              //backgroundColor: const Color.fromARGB(255, 33, 138, 40),
              title: Text(choir_title,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: widget.choir_Id == 5 || widget.choir_Id == 16
                      ? ColorsFile().dorColor()
                      : widget.choir_Id == 11
                          ? ColorsFile().pathColor()
                          : [
                              const Color.fromARGB(255, 46, 105, 48),
                              const Color.fromARGB(255, 46, 105, 48),
                            ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
              ),

              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  if (_hasChanges) {
                    saveDialog(context, widget.fruitId);
                  } else {
                    Navigator.pop(context);
                  }
                },
                color: Colors.white,
              ),
              actions: [
                /*IconButton(
            icon: Icon(Icons.save,color: Colors.green,),
            onPressed: _hasChanges ? _saveChanges : null, // Enable only if changes are made
            
          ),*/
                TextButton(
                  onPressed: () async {
                    if (_hasChanges) {
                      saveDialog(context, widget.fruitId);
                    } else {
                      null;
                    }
                  }, // Enable only if changes are made
                  child: Text('Save',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'VarelaRound',
                        fontWeight: FontWeight.bold,
                        color: _hasChanges
                            ? Colors.white
                            : widget.choir_Id == 5 || widget.choir_Id == 16
                                ? const Color.fromARGB(255, 95, 5, 5)
                                : const Color.fromARGB(255, 46, 105, 48),
                      )),
                )
              ],
            ),
            body: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text('Edit Song',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'VarelaRound',
                    //fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Expanded(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _fruitConController,
                        decoration: InputDecoration(
                          labelText: getContentNumber(widget.fruitId - 1),
                          labelStyle: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'VarelaRound',
                            fontWeight: FontWeight.bold),
                        maxLines: null,
                      ),
                      TextField(
                        controller: _infoController,
                        style: TextStyle(fontFamily: 'VarelaRound'),
                        //decoration: InputDecoration(labelText: 'Description'),
                        maxLines: null,
                      ),
                      TextField(
                        controller: _descriptionController,
                        style: TextStyle(fontFamily: 'VarelaRound'),
                        //decoration: InputDecoration(labelText: 'Description'),
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              )))
            ])));
  }

  String getContentNumber(int index) {
    if (widget.choir_Id == 13) {
      if (index < 10) {
        return '0.${index}';
      } else {
        return '${index - 9}';
      }
    } else if (widget.choir_Id == 3 || widget.choir_Id == 8) {
      if (index < 1) {
        return '${index}';
      } else {
        return '${index}';
      }
    } else {
      if (index < 0) {
        return '0.${index}';
      } else {
        return '${index + 1}';
      }
    }
  }

  void saveDialog(BuildContext context, int? id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Save"),
          content: const Text("Save Changes?"),
          actions: <Widget>[
            Row(
              children: [
                ElevatedButton(
                    child: const Text("Exit"),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: () async {
                    _saveChanges();
                    // _loadFruitDetails();
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  child: const Text("Close"),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
