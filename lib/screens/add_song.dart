import 'package:flutter/material.dart';
import 'package:sweet/options/colors_file.dart';

import '../database_helper/database_helper.dart';
import 'home/amo_home.dart';
import 'home/blessedtidings_home.dart';
import 'home/church_home.dart';
import 'home/kabango_home.dart';
import 'home/newlines_home.dart';
import 'home/pathfinders_home.dart';
import 'home/tawomboledwa_home.dart';
import 'home/the_comfort_home.dart';
import 'home/fam_home.dart';
import 'home/family_home.dart';
import 'home/ivet_home.dart';
import 'home/senioryouth_home.dart';
import 'home/sweet_home.dart';
import 'home/dorica_home.dart';
import 'home/tower_home.dart';
import 'home/youngdorcas_home.dart';
import 'home/ziboda_home.dart';

class AddSong extends StatefulWidget {
  final List<Map<String, dynamic>> fruits;
  final int choir_Id;

  AddSong({required this.fruits, required this.choir_Id});

  @override
  _AddSongState createState() => _AddSongState();
}

class _AddSongState extends State<AddSong> {
  late TextEditingController _descriptionController;
  late TextEditingController _fruitConController;
  late TextEditingController _infoConController;
  bool _hasChanges = false; // Track if changes have been made
  String? OriginalDescription;
  String? OriginalTitle;
  String stringWarning = 'This song will be lost when the App is uninstalled.'
            '\n\nKeep a separate word document for the song you are adding...';
  List<Map<String, dynamic>> fruitz = [];
  String choir_title = '';

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _fruitConController = TextEditingController();
    _infoConController = TextEditingController();
   
    _loadFruits();
    // Listen for changes in the text field
    _descriptionController.addListener(checkChanges);
    // Listen for changes in the text field
    _fruitConController.addListener(checkChanges);
    _infoConController.addListener(checkChanges);
    
  }
   @override
  void dispose() {
    _fruitConController.dispose();
    _descriptionController.dispose();
    _infoConController.dispose();
    super.dispose();
  }

  
  void _loadFruits()async {
    
    if (widget.choir_Id == 1){
      final songs = await DatabaseHelper().getFruits_amo();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'AMO Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }
      else if (widget.choir_Id == 2){
      final songs = await DatabaseHelper().getFruits_bles();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Blessed Tidings SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }
    else if (widget.choir_Id == 3){
      final songs = await DatabaseHelper().getFruits_chur();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Church Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 4){
      final songs = await DatabaseHelper().getFruits_comf();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'The Comforters SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 5){
      final songs = await DatabaseHelper().getFruits_dor();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Dorica SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 6){
      final songs = await DatabaseHelper().getFruits_fam();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'FAM SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 7){
      final songs = await DatabaseHelper().getFruits_family();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Family Voices SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 8){
      final songs = await DatabaseHelper().getFruits_ivet();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'iVet Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 9){
      final songs = await DatabaseHelper().getFruits_kab();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Kabango Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 10){
      final songs = await DatabaseHelper().getFruits_new();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Newlines Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 11){
      final songs = await DatabaseHelper().getFruits_path();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'PathFinder Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 12){
      final songs = await DatabaseHelper().getFruits_senior();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'SeniorYouth Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 13){
      final songs = await DatabaseHelper().getFruits_Sw();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Sweet toTrust SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }
     else if (widget.choir_Id == 14){
      final songs = await DatabaseHelper().getFruits_tawo();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Tawomboledwa SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 15){
      final songs = await DatabaseHelper().getFruits_tow();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Tower ofHope SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 16){
      final songs = await DatabaseHelper().getFruits_young();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Young Dorcas SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }

     else if (widget.choir_Id == 17){
      final songs = await DatabaseHelper().getFruits_zib();
    if (songs.isNotEmpty) {
      setState(() {
        fruitz= songs;
      });
    }
      final ctitle = 'Ziboda Choir SongBook';
      setState(() {
        choir_title= ctitle;
      });
    }
    
  }
  void checkChanges() {
    if (_fruitConController.text.isNotEmpty && _descriptionController.text.isNotEmpty
    && _infoConController.text.isNotEmpty) {
      setState(() {
        _hasChanges = true;
      });
    }
  }
  

  void _saveChanges() async {
    if (widget.choir_Id == 1){
    await DatabaseHelper().insertFruitDetail_amo(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_amo(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_amo(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }
    else if (widget.choir_Id == 2){
    await DatabaseHelper().insertFruitDetail_bles(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_bles(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_bles(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 3){
    await DatabaseHelper().insertFruitDetail_chur(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_chur(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_chur(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 4){
    await DatabaseHelper().insertFruitDetail_comf(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_comf(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_comf(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 5){
    await DatabaseHelper().insertFruitDetail_dor(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_dor(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_dor(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 6){
    await DatabaseHelper().insertFruitDetail_fam(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_fam(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_fam(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 7){
    await DatabaseHelper().insertFruitDetail_family(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_family(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_family(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 8){
    await DatabaseHelper().insertFruitDetail_ivet(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_ivet(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_ivet(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 9){
    await DatabaseHelper().insertFruitDetail_kab(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_kab(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_kab(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 10){
    await DatabaseHelper().insertFruitDetail_new(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_new(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_new(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 11){
    await DatabaseHelper().insertFruitDetail_path(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_path(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_path(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 12){
    await DatabaseHelper().insertFruitDetail_senior(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_senior(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_senior(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 13){
    await DatabaseHelper().insertFruitDetail_Sw(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_Sw(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_Sw(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 14){
    await DatabaseHelper().insertFruitDetail_tawo(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_tawo(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_tawo(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 15){
    await DatabaseHelper().insertFruitDetail_tow(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_tow(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_tow(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else if (widget.choir_Id == 16){
    await DatabaseHelper().insertFruitDetail_young(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_young(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_young(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }

    else{
    await DatabaseHelper().insertFruitDetail_zib(fruitz.length+1, _descriptionController.text);
    await DatabaseHelper().insertFruit_zib(_fruitConController.text);
    await DatabaseHelper().insertSongInfo_zib(_infoConController.text);
    setState(() {
      OriginalDescription = _descriptionController.text;
      OriginalTitle = _fruitConController.text;
      _hasChanges = false;
    });
    }
    // Show confirmation message or navigate back
    ScaffoldMessenger.of(context).showSnackBar
    (SnackBar(content: Text('${widget.choir_Id == 13? fruitz.length-9: widget.choir_Id == 3 || widget.choir_Id == 8? fruitz.length:fruitz.length+1}' 
    + "- " + '${_fruitConController.text}'
    + "\nAdded successfully",
    style: TextStyle(fontSize: 20, fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));
    _fruitConController.clear();
    _descriptionController.clear();
    _infoConController.clear();
    var HomePage;
    int choir_Id = widget.choir_Id;
    
   switch (choir_Id) {
                    case 1 :HomePage = AmoHome();break;
                    case 2 :HomePage = BlessedHome();break;
                    case 3 :HomePage = ChurchHome();break;
                    case 4 :HomePage = ComfortHome();break;
                    case 5 :HomePage = DoricaHome();break;
                    case 6 :HomePage = FamHome();break;
                    case 7 :HomePage = FamilyHome();break;
                    case 8 :HomePage = IvetHome();break;
                    case 9 :HomePage = KabangoHome();break;
                    case 10 :HomePage = NewlinesHome();break;
                    case 11 :HomePage = PathfindersHome();break;
                    case 12 :HomePage = SenioryouthHome();break;
                    case 13 :HomePage = SweetHome();break;
                    case 14 :HomePage = TawomboledwaHome();break;
                    case 15 :HomePage = TowerHome();break;
                    case 16 :HomePage = YoungdorcasHome();break;
                    case 17 :HomePage = ZibodaHome();break;
                    default:
                  }
      await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context) => HomePage
                                  ));
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
        //backgroundColor: widget.choir_Id == 2? Colors.transparent : Colors.blue,
        title: Text(choir_title,
        style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: Colors.white,           
            )),
            flexibleSpace: 
              Container(
                 decoration: 
                BoxDecoration(
                  gradient: 
                  LinearGradient(
                    colors: widget.choir_Id == 5 || widget.choir_Id == 16 ?
                    ColorsFile().dorColor(): widget.choir_Id == 11 ? ColorsFile().pathColor():
                    [const Color.fromARGB(255, 46, 105, 48), const Color.fromARGB(255, 46, 105, 48),],
                    begin: 
                    Alignment.topCenter, 
                    end: 
                    Alignment.bottomCenter,
                    )
                ),
              ),
            
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
              if (_hasChanges) {
                saveDialog(context, fruitz.length+1);
              }
              else {
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
            onPressed: () async{
              if (_hasChanges) {
                saveDialog(context, fruitz.length+1);
              }
              else {
                null;
              }
            }, // Enable only if changes are made
           child: Text('Save',
           style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: _hasChanges ? Colors.white: widget.choir_Id == 5 || widget.choir_Id == 16 ? const Color.fromARGB(255, 95, 5, 5):const Color.fromARGB(255, 46, 105, 48),        
            )),)
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text('Add Song',
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'VarelaRound',
              //fontWeight: FontWeight.bold,
              color:  Colors.black,          
            )
            ),
          Expanded(
            child: SingleChildScrollView(   
     child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            TextField(
              controller: _fruitConController,
              decoration: InputDecoration(labelText: 'Enter Song Title'),
              style: TextStyle(fontSize: 24, fontFamily: 'VarelaRound', fontWeight: FontWeight.bold),
              maxLines: null,
            ),
            TextField(
              controller: _infoConController,
              style: TextStyle(fontFamily: 'VarelaRound'),
              decoration: InputDecoration(labelText: 'Enter Song Info'),
              maxLines: null,
            ),
            TextField(
              controller: _descriptionController,
              style: TextStyle(fontFamily: 'VarelaRound'),
              decoration: InputDecoration(labelText: 'Enter Song Body'),
              maxLines: null,
            ),
            SizedBox(height: 20,),
             Text(stringWarning,
            style: TextStyle(fontSize: 18,
            color: _hasChanges ?  const Color.fromARGB(255, 173, 52, 18): Colors.white, 
            ),)
          ],
        ),
      ),
    )
      ))]
      
    )
    )
    );
  }
  void saveDialog(BuildContext context, int? id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Save"),
          content: const Text("Save this song?"),
          actions: <Widget>[
            Row(
              children: [
                 ElevatedButton(
              child: const Text("Exit"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              } 
            ),
            SizedBox(width: 5,),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () async {
                _saveChanges();
               // _loadFruitDetails();
              },
            ),
            SizedBox(width: 5,),
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