// settings_screen.dart
import 'package:flutter/material.dart';
import 'package:sweet/main.dart';
import 'package:sweet/options/colors_file.dart';
import 'package:sweet/screens/home/amo_home.dart';
import 'package:sweet/screens/home/blessedtidings_home.dart';
import 'package:sweet/screens/home/church_home.dart';
import 'package:sweet/screens/home/newlines_home.dart';
import 'package:sweet/screens/home/pathfinders_home.dart';
import 'package:sweet/screens/home/the_comfort_home.dart';
import 'package:sweet/screens/home/dorica_home.dart';
import 'package:sweet/screens/home/family_home.dart';
import 'package:sweet/screens/home/ivet_home.dart';
import 'package:sweet/screens/home/senioryouth_home.dart';
import 'package:sweet/screens/home/youngdorcas_home.dart';
import 'package:sweet/screens/home/ziboda_home.dart';

import '../screens/home/fam_home.dart';
import '../screens/home/kabango_home.dart';
import '../screens/home/tawomboledwa_home.dart';
import '../screens/home/tower_home.dart';
import 'custom_text_selection_controls.dart';
import '../screens/home/sweet_home.dart';

class SwitchHymnal extends StatefulWidget {
  const SwitchHymnal({super.key});

  @override
  State<SwitchHymnal> createState() => _SwitchHymnalState();
}

class _SwitchHymnalState extends State<SwitchHymnal> {
  final TextStyle textStyle = TextStyle(
    fontSize: 18, fontFamily: 'VarelaRound',  color: Colors.white
  );
  String noContetMsg = "No Content...\nLyrics Not Yet Provided By The Choir Owners...";
  String sweetNoContetMsg = "Permission Not Yet Granted By The Choir Owners...";
  String doricaNoContetMsg = "Permission Not Yet Granted...\n\n"
                             "Assist the Developer to get early permission from The Malamulo Publishing House...\n";
  String choir_title = '';
  final String correctPassword = 'SweetHome';
  final String correctPasswordD = 'DorikaHome';
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = "";
  Widget _titleBar() {
   final ctitle = 'SongBook Menu';
   setState(() {
      choir_title = ctitle;     
      });
return Container(
            color: const Color.fromARGB(255, 46, 105, 48), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SelectableText(choir_title,
              style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'MAIAN',
              fontWeight: FontWeight.bold,
              color: Colors.white,         
            )
             ) ]
              
            ));
  } 
    @override
  void dispose() {
    // Dispose the controllers when the widget is disposed
    _passwordController.dispose();
    super.dispose();
  }
  // clear the text fields
  void _clear() {
    _passwordController.clear();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 105, 48),
        centerTitle: true,
        titleTextStyle: const TextStyle(
              fontSize: 16.0,
              fontFamily: 'MAIAN',
              fontWeight: FontWeight.bold,
              color: Colors.white,           
            ),
        title: Row(
          children: [
            IconButton(
              icon: Image.asset('assets/chur_icon.png',
                width: 30.0,
                height: 30.0,),
              onPressed: () {
                
              },
             // color: Colors.transparent,
            ),
            Text("Mpemba SDASongs"),
        
       
          ],
        ),
         
             leading: Row(
              children: [
             IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
              // Navigate back to the previous screen
              Navigator.pop(context);
              },
              color: Colors.white,
            ),
            
            ])
      ),
      body: Column(
        children: [
          Container(
            child: _titleBar(),
          ),
          
          Expanded(
            child: SingleChildScrollView(         
       child: Column(
        children: [
          SizedBox(height: 10,),
        Container(  
        color: ColorsFile().amoColor(), 
           child:  ListTile (
                  minTileHeight: 60,
                  leading: Image.asset('assets/chur_icon.png',
                width: 30.0,
                height: 30.0,),
                title:  Text(
                 
                  "AMO Choir",
                  style: textStyle, // White text
                 
                ),
                onTap: () {
                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AmoHome(),
                              )
                            );
                  },
       )),

SizedBox(height: 10,),
                Container(  
                   color: ColorsFile().blesColor(),
           child:ListTile(
                  minTileHeight: 60,
               leading:  Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
                title:  Text(
                 
                  "Blessed Tidings",
                  style: textStyle,
                  
                 ),
                  onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlessedHome(),
                              )
                            );
                  },
                )),
SizedBox(height: 10,),
               Container(  
                color: ColorsFile().churColor(), 
           child: ListTile( 
                  minTileHeight: 60,
               leading:  Image.asset('assets/chur_icon.png',
                width: 30.0,
                height: 30.0,
                
                ),
                title:  Text(
                  
                  "Church Choir",
                  style: textStyle,
                  
                ),
                onTap: () {
                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChurchHome(),
                              )
                            );
                  },
               )),
SizedBox(height: 10,),
Container(

           child: ListTile(
                  minTileHeight: 60,
                 leading:  Image.asset('assets/chur_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Dorcas Choir",
                  style: textStyle,

                ),
                onLongPress: () {
                  _sweetPassword(context);
                },
                onTap: () {
                   /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoricaHome(),
                              )
                            );*/
                            // no content message                        
    ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar
    (
      content: Text(doricaNoContetMsg,
    style: TextStyle(fontSize: 20,
    fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));
                  },
     ),
                decoration: 
                BoxDecoration(
                  gradient: 
                  LinearGradient(
                    colors: ColorsFile().dorColor(), 
                    begin: 
                    Alignment.topCenter, 
                    end: 
                    Alignment.bottomCenter,
                    )
                ),
              ),
     

SizedBox(height: 10,),
      Container(  
         color: ColorsFile().amoColor(), 
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "FAM",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FamHome(),
                              )
                            );
                  },
      )),
SizedBox(height: 10,),
       Container( 
         color:  ColorsFile().familyColor(), 
           child:     ListTile(
                  minTileHeight: 60,
                 leading:Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
              title:   Text(
                  
                  "Family Voices",
                  style: textStyle,
          ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FamilyHome(),
                              )
                            );
                  },
       )),
       SizedBox(height: 10,),
       Container(  
         color: ColorsFile().iveColor(),
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "iVet Choir",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => IvetHome(),
                              )
                            );
                            // no content message                        
   /* ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar
    (
      content: Text(noContetMsg,
    style: TextStyle(fontSize: 20,
    fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));*/
                  },
      )),
      SizedBox(height: 10,),
       Container(  
        color: ColorsFile().kabColor(), 
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Kabango Choir",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => KabangoHome(),
                              )
                            );
                            // no content message                        
   /* ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar
    (
      content: Text(noContetMsg,
    style: TextStyle(fontSize: 20,
    fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));*/
                  },
      )),
      SizedBox(height: 10,),
       Container( 
         color: ColorsFile().newColor(), 
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Newlines Choir",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewlinesHome(),
                              )
                            );
                  },
      )),
      SizedBox(height: 10,),
       Container(  
        decoration: 
                BoxDecoration(
                  gradient: 
                  LinearGradient(
                    colors:
                    ColorsFile().pathColor(), 
                    begin: 
                    Alignment.topCenter, 
                    end: 
                    Alignment.bottomCenter,
                    )
                ),
        
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "PathFinder Choir",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PathfindersHome(),
                              )
                            );
                  },
      )),
      SizedBox(height: 10,),
       Container(  
         color: ColorsFile().senColor(), 
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "SeniorYouth Choir",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SenioryouthHome(),
                              )
                            );
                            // no content message                        
   /* ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar
    (
      content: Text(noContetMsg,
    style: TextStyle(fontSize: 20,
    fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));*/
                  },
      )),
      SizedBox(height: 10,),
     Container(  
      color: ColorsFile().sweetColor(), 
           child:    ListTile(
                  minTileHeight: 60,
                 leading:Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
              title: Text(
                 
                  "Sweet toTrust",
                  style: textStyle,

                ),
                onLongPress: () {
                  _sweetPassword(context);
                },
                 onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SweetHome(),
                              )
                            );
                            // no content message                        
   /* ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar
    (
      content: Text(sweetNoContetMsg,
    style: TextStyle(fontSize: 20,
    fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));*/
                  },
      ) ),
      SizedBox(height: 10,),
      Container( 
         color: ColorsFile().tawoColor(), 
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Tawomboledwa",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TawomboledwaHome(),
                              )
                            );
                  },
      )),
      SizedBox(height: 10,),

               Container(  
                color:  ColorsFile().comfColor(), 
           child: ListTile(
                  minTileHeight: 60,
                  leading:  Image.asset('assets/chur_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "The Comforters",
                  style: textStyle,
                 
                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ComfortHome(),
                              )
                            );
   /*                         // no content message                        
    ScaffoldMessenger.of(context)
    .showSnackBar(SnackBar
    (
      content: Text(noContetMsg,
    style: TextStyle(fontSize: 20,
    fontFamily: 'VarelaRound',),),
    duration: Duration(seconds: 5),));*/
                  },
               )),
      SizedBox(height: 10,),
      Container( 
         color: ColorsFile().towColor(),  
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Tower ofHope",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TowerHome(),
                              )
                            );
                  },
      )),
      SizedBox(height: 10,),
      Container(  
        decoration: 
                BoxDecoration(
                  gradient: 
                  LinearGradient(
                    colors:
                    ColorsFile().dorColor(), 
                    begin: 
                    Alignment.topCenter, 
                    end: 
                    Alignment.bottomCenter,
                    )
                ),
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Young Dorcas",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoungdorcasHome(),
                              )
                            );                      

                  },
      )),
      SizedBox(height: 10,),
      Container( 
         color: ColorsFile().zibColor(), 
           child:      ListTile(
                  minTileHeight: 60,
                 leading: Image.asset('assets/comf_icon.png',
                width: 30.0,
                height: 30.0,),
               title:  Text(
                  
                  "Ziboda Choir",
                  style: textStyle,

                ),
                onTap: () {
                    Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ZibodaHome(),
                              )
                            );

                  },
      )),
          SizedBox(height: 10,),     
        ],
    )
    )
    )
    ]
    )
    );
  }
   void _validatePassword() {
    if (_passwordController.text.trim() == correctPassword) {
      // If the password is correct, update the base date and navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SweetHome()),
      );_clear();
    } 
    else if ( _passwordController.text.trim() == correctPasswordD){
      // If the password is correct, update the base date and navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DoricaHome()),
      );_clear();
    }
    else {
      // Show an error message
      _clear();
        Navigator.of(context).pop();
    }
  }

  void _sweetPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         // title: const Text("Sweet toTrust"),
          content:  TextField(
            controller: _passwordController,
            decoration: InputDecoration(
             labelText: "No Permission",
                border: OutlineInputBorder(),
                ),
              ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                _validatePassword();
                //Navigator.of(context).pop();
              } 
            ),
            if (errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}