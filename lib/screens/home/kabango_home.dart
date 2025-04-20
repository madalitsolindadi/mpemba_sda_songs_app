
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../database_helper/database_helper.dart';
import '../../developer_info_screen.dart';
import '../../donate screen.dart';
import '../add_song.dart';
import '../fruit_detail_view.dart';
import '../../options/switch_book.dart';

class KabangoHome extends StatefulWidget {

  const KabangoHome({super.key,});
  @override
  _FamilyHomeState createState() => _FamilyHomeState();
}

class _FamilyHomeState extends State<KabangoHome> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  bool isSearchVisible = false; // Track visibility of search bar
  final ScrollController _scrollController = ScrollController();
  bool _fabVisible = true;
  String discription = '';
  late List<Map<String, dynamic>> songs = [];
  late List<Map<String, dynamic>> info = [];
  late List<Map<String, dynamic>> songDesc = [];
  String choir_title = '';


Widget _titleBar() {
   final ctitle = 'Kabango Choir SongBook';
   setState(() {
      choir_title = ctitle;     
      });
return Container(
            color: const Color.fromARGB(255, 58, 56, 56),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SelectableText(choir_title,
              style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'MAIAN',
              fontWeight: FontWeight.bold,
              color: Colors.white,         
            )
             ) ]
              
            ));
  }  

  Widget _searchTextField() {
    return TextField(
      onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
      controller: searchController,        
      autofocus: true, //Display the keyboard when TextField is displayed
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
         fontFamily: 'VarelaRound',
      ),
      textInputAction: TextInputAction.search, //Specify the action button on the keyboard
      decoration: InputDecoration( //Style of TextField
        enabledBorder: UnderlineInputBorder( //Default TextField border
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder( //Borders when a TextField is in focus
          borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search: any text or number', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle( //Style of hintText
          color: Colors.white,
          fontSize: 16,
           fontFamily: 'VarelaRound',
        ),
      ),
    );
  }
  
  @override
  void initState() {
    super.initState();
    // Example of inserting data into the database (you can remove this later)
   // DatabaseHelper().insertFruit('Apple');
   // DatabaseHelper().insertFruit('Banana');
    //DatabaseHelper().insertFruit('Cherry');
    //DatabaseHelper().insertFruitDetail(id,'Bananas are a good source of potassium and are great for energy.');
    //DatabaseHelper().deleteFruitDetail(id);
    //DatabaseHelper().getFruits();
    //DatabaseHelper().insertAllFruits();
    //DatabaseHelper().deleteFruits();
   

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _fabVisible = false; // Show FAB when scrolling down
        });
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _fabVisible = true; // Hide FAB when scrolling up
        });
      }
    });
    _loadSongs ();
     
  }

  void _loadSongs () async {

   
     final songz = await DatabaseHelper().getFruits_kab();
     songDesc = await DatabaseHelper().getAllSongs_kab();
     final infoz = await DatabaseHelper().getSongInfos_kab();
     final ctitle = 'Kabango';
   
     setState(() {
      songs = songz;
      info = infoz;
      choir_title = ctitle;     
      });
   
  }
  
 

   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    // ignore: deprecated_member_use
   return WillPopScope(
     onWillPop: () async {
      if (Navigator.canPop(context)) {
      SystemNavigator.pop();
      return false;
       }
       return true;
     },
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //centerTitle: true,
        backgroundColor:  const Color.fromARGB(255, 58, 56, 56),
        title: !isSearchVisible ?Text('Mpemba SDASongs',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'MAIAN',
              fontWeight: FontWeight.bold,
              color: Colors.white,
                        
            )):_searchTextField(),
            
             
              actions: !isSearchVisible
        ? [
          Row(
            children: [
              IconButton(
                onPressed: (){
                  _showNumPad(context);
                    },
              icon: Icon(Icons.dialpad),
              color: Colors.white,
              ),
              IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            setState(() {
              isSearchVisible = true;
            });
          }),
           IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
           Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SwitchHymnal(),
                              )
                            );
          }),
                
              
          
            ],
          )
          
        ] 
        : [
          IconButton(
            icon: Icon(Icons.clear),
            color: Colors.white,
            onPressed: () {
              if (searchQuery.isEmpty) {
                setState((){
                  isSearchVisible = false;
                });
                //Navigator.of(context).pop();
                }
                        setState(() {
                          //numberController.clear();
                          String currentText = searchQuery;
                          if (currentText.isNotEmpty) {
                            searchQuery = currentText.substring(0, currentText.length - currentText.length);
                            searchController.text = currentText.substring(0, currentText.length - currentText.length);
                          }
                          if (searchQuery.isEmpty) {
                          isSearchVisible = false;
                          }
                        });
              
            }
          )
        ],
        leading: IconButton(
              icon: Image.asset('assets/chur_icon.png',
                width: 56.0,
                height: 56.0,),
              onPressed: () {
                
              },
             // color: Colors.transparent,
            ),
        
        
      ),
      body:Column(
        children: [
          Container(
            child: _titleBar(),
          ),
          
          Expanded(
            child: SingleChildScrollView(
            controller: _scrollController,
              child: Column(
                children: songs
                    .asMap()
                    .entries
                    .where((entry) {
                      final index = entry.key;
                      final title = entry.value['name'].toString().toLowerCase();
                      final description = songDesc[index]['description'].toString().toLowerCase();
                      return title.contains(searchQuery) || getContentNumber(index).contains(searchQuery)
                      || description.contains(searchQuery);
                    })
                    .map((entry) {
                      final index = entry.key;
                      String addSign = " +";
                      final title = entry.value['name'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                        child: ListTile(
                          title: Text('${getContentNumber(index)} - $title' + '     ' + addSign,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'VarelaRound',
                                fontWeight: FontWeight.bold,
                                
                              )),
                          onTap: () {
                            timeDilation = 2.0; // slows down animations speed 
                             // Navigate to the details screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FruitDetailView(
                          fruitId: songs[index]['id'],
                          fruits: songs,
                          initialIndex: songs[index]['id']-1,
                          description: songDesc,
                          songinformation: info,
                          choir_Id: 9,
                                ),
                              )
                            );
                          },
                        ),
                      ));
                    })
                    .toList(),
              ),
            ),
          ),
          AnimatedOpacity(
      opacity: _fabVisible  ? 1.0 : 0.0, // Fade in or out based on visibility flag
      duration: Duration(milliseconds: 300),
          child:  Container(
            color:  const Color.fromARGB(255, 58, 56, 56),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
              icon:  ClipOval(
                child: Image.asset('assets/donate.png',
                fit: BoxFit.cover,
                width: 40.0,
                height: 40.0,
                ),
              ),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
                 _fabVisible? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonateScreen(choir_Id: 9,))): null;},
              //color:   Colors.white,
            ),
            SizedBox(width: 10.0,),
            IconButton(
                onPressed: (){
                  _fabVisible? Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>AddSong(fruits: songs, choir_Id: 9,))): null;
                    },
              icon: Icon(Icons.add),
              color: Colors.white,
              ),
              SizedBox(width: 10.0,),
            IconButton(
              icon: const Icon(Icons.info_outline_rounded,color: Colors.white,),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
                _fabVisible? Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeveloperInfoScreen())): null;},
              //color:   Colors.white,
            ),
              ],
            )
            
          )),]),
         
    floatingActionButton: _buildFABColumn())
    );
  }
   Widget _buildFABColumn() {
    return AnimatedOpacity(
      opacity: _fabVisible  ? 1.0 : 0.0, // Fade in or out based on visibility flag
      duration: Duration(milliseconds: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //SizedBox(height: 300), // Spacing between buttons
      Row(
       // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
            
          ],
        ),
        SizedBox(height: 50), // Spacing between buttons
        ])
      );
    }
    void _showNumPad(BuildContext context) {
      TextEditingController numberController = TextEditingController();
       String? errorMessage; // To store error message
      final ButtonStyle buttonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(12), // Rectangular buttons
    ),
      backgroundColor: Colors.grey,// Background color
      foregroundColor: Colors.white,
      //minimumSize: Size(5, 5), // Define size of buttons
  );
  final ButtonStyle buttonStyleDumn = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(12), // Rectangular buttons
    ),
      backgroundColor: Colors.grey,// Background color
      foregroundColor: Colors.grey,
      //minimumSize: Size(5, 5), // Define size of buttons
  );
  final TextStyle textStyle = TextStyle(
    fontSize: 26, fontFamily: 'VarelaRound', fontWeight: FontWeight.bold, color: Colors.white
  );
  final TextStyle textStyleNull = TextStyle(
    fontSize: 16, fontFamily: 'VarelaRound', fontWeight: FontWeight.bold,
    color:  const Color.fromARGB(255, 58, 56, 56),
  );

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
          return StatefulBuilder(
        builder: (context, setState) {
          return Container(
          height: MediaQuery.of(context).size.height * 0.75, // Half of the screen height
           
              color: const Color.fromARGB(255, 58, 56, 56),
              
          child: Column(
            children: [
              if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color:  Colors.white,
                      fontFamily: 'VarelaRound', fontSize: 16),
                    ),
                  ), // Display error message when it's not null
              TextField(
                style: const TextStyle(fontSize: 24,
                 fontWeight: FontWeight.bold,
                 color: Colors.white),
                 textAlign: TextAlign.center,
                controller: numberController,
                //controller: TextEditingController(),
                keyboardType: TextInputType.none, // Disable keyboard input
                decoration: InputDecoration(
               // blue hint text color
                hintStyle: TextStyle(color: Colors.white),
                
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  color: Colors.white,
                  onPressed: () {
                    if (numberController.text.isEmpty) {Navigator.of(context).pop();}
                     // Clear the input field
                        setState(() {
                          //numberController.clear();
                          String currentText = numberController.text;
                          if (currentText.isNotEmpty) {
                            numberController.text = currentText.substring(0, currentText.length - 1);
                          }
                          errorMessage = null; // Clear the error message when input is cleared
                        });
                  },
                ),),
              ),
              Expanded(
                child: GridView.count(
                 crossAxisSpacing: 10, 
                 mainAxisSpacing: 10, 
                  padding: const EdgeInsets.all(20), 
                  //shrinkWrap: true,
                  crossAxisCount: 4,
                  children: [
                    /*for (int i = 1; i <= 9; i++)
                       SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: ElevatedButton(
                         style:  buttonStyle,
                        onPressed: () {
                           // Append the pressed number to the text field
                          setState(() {
                            numberController.text += i.toString();
                          });
                        },
                         
                        child: Text(i.toString(), style: TextStyle(fontSize: 24)),
                      ),),*/
                  SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '',
                          enableInteractiveSelection: false,// disabling selection
                    style: textStyleNull,
                        onTap: () {
                       
                      },
                     
                    ),),
                    for (int i = 1; i <= 3; i++)
                       SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                        i.toString(),
                        enableInteractiveSelection: false,// disabling selection
                        style: textStyle,
                        onTap: () {
                           // Append the pressed number to the text field
                          setState(() {
                            numberController.text += i.toString();
                          });
                        },
                         
                      ),),
                      SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '',
                          enableInteractiveSelection: false,// disabling selection
                    style: textStyleNull,
                        onTap: () {
                       
                      },
                     
                    ),),
                    for (int i = 4; i <= 6; i++)
                       SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                        i.toString(),
                        enableInteractiveSelection: false,// disabling selection
                        style: textStyle,
                        onTap: () {
                           // Append the pressed number to the text field
                          setState(() {
                            numberController.text += i.toString();
                          });
                        },
                      ),),
                      SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '',
                          enableInteractiveSelection: false,// disabling selection
                   style: textStyleNull,
                        onTap: () {
                       
                      },
                     
                    ),),
                    for (int i = 7; i <= 9; i++)
                       SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                        i.toString(),
                        enableInteractiveSelection: false,// disabling selection
                        style: textStyle,
                        onTap: () {
                           // Append the pressed number to the text field
                          setState(() {
                            numberController.text += i.toString();
                          });
                        },
                      ),),
                      SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '',
                          enableInteractiveSelection: false,// disabling selection
                    style: textStyleNull,
                        onTap: () {
                       
                      },
                     
                    ),),
                    SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '',
                          enableInteractiveSelection: false,// disabling selection
                    style: textStyleNull,
                        onTap: () {
                       
                      },
                     
                    ),),
                   SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '0',
                          enableInteractiveSelection: false,// disabling selection
                    style: textStyle,
                        onTap: () {
                        // Append '0' to the text field logic here
                        setState(() {
                          numberController.text += '0';
                        });
                      },
                     
                    ),),
                      /*SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: ElevatedButton(
                      style:  buttonStyle,
                      onPressed: () {
                        // Append '-' to the text field
                         setState(() {
                          numberController.text += '.';
                        });
                      },
                      child: Text('.',
                      style: TextStyle(fontSize: 32,
                      color: Colors.black
                      ),
                      ),
                    ),),*/
                     SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          'OK',
                          enableInteractiveSelection: false,// disabling selection
                      style:  numberController.text.isEmpty? textStyleNull: textStyle,
                      
              onTap: () {
                if (numberController.text.isNotEmpty){
                 double? selectedNumber = double.tryParse(numberController.text);
                if (selectedNumber != null && selectedNumber >= 1
                    && selectedNumber <= songs.length
                    && selectedNumber != 0.2 && selectedNumber != 0.6
                    && selectedNumber != 0.3 && selectedNumber != 0.7
                    && selectedNumber != 0.4 && selectedNumber != 0.8
                    && selectedNumber != 0.5 && selectedNumber != 0.9
                    ) {
                  switch (selectedNumber) {
                    case 0.0:selectedNumber=-1;break;
                    case 0.1:selectedNumber=0;break;
                    /*case 0.2:selectedNumber=-4;break;
                    case 0.3:selectedNumber=-3;break;
                    case 0.4:selectedNumber=-2;break;
                    case 0.5:selectedNumber=-1;break;
                    case 0.6:selectedNumber=0;break;*/
                    default:
                  } 
                  Navigator.of(context).pop();
                  Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>FruitDetailView(
                      fruitId: selectedNumber!.toInt()-1,
                      initialIndex: selectedNumber.toInt() -1,
                      fruits: songs,
                      description: songDesc,
                      songinformation: info,
                      choir_Id: 9,
                    
                    ))
                  );
                } else {
                   // Show error message if input is invalid
                          setState(() {
                            errorMessage = 'Not found!';
                          });
                }
              }
              else {null;}
              
        }),),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  });
}

  String getContentNumber(int index) {
    if (index < 0) {
      return '0.${index}';
    } else {
      return '${index+1}';
    }
  }
}
