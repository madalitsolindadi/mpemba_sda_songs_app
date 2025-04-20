import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../database_helper/database_helper.dart';
import '../options/font_size_dialog.dart';
import '../options/font_state.dart';
import 'fruit_detail_edit.dart';
import 'home/amo_home.dart';
import 'home/blessedtidings_home.dart';
import 'home/church_home.dart';
import 'home/the_comfort_home.dart';
import 'home/dorica_home.dart';
import 'home/fam_home.dart';
import 'home/family_home.dart';
import 'home/ivet_home.dart';
import 'home/senioryouth_home.dart';
import 'home/sweet_home.dart'; // Import the editable screen

class FruitDetailView extends StatefulWidget {
  final int fruitId; // Pass the fruit ID
  final List<Map<String, dynamic>> fruits;
  final List<Map<String, dynamic>> description;
  final List<Map<String, dynamic>> songinformation;
  final int initialIndex;
   final int choir_Id;

  FruitDetailView(
    {
      required this.fruitId,
      required this.fruits,
      required this.initialIndex,
      required this.description,
      required this.songinformation,
      required this.choir_Id
      }
      );

  @override
  _FruitDetailViewState createState() => _FruitDetailViewState();
}

class _FruitDetailViewState extends State<FruitDetailView> {
  String _fruitName = ''; // To hold the fruit name
  String _description = ''; // To hold the description
   List<Map<String, dynamic>> songinfo = []; 
  List<Map<String, dynamic>> fruitz = [];

  late PageController _pageController;
  late int _currentIndex;
  final ScrollController _scrollController = ScrollController();
  bool _fabVisible = true;
  DateTime? baseDate;
  String? lockDate;
  String choir_title = '';

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
     _pageController = PageController(initialPage: _currentIndex);
     _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _fabVisible = false; // Show FAB when scrolling down
        });
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _fabVisible = true; // Show FAB when scrolling up
        });
      }
    });
    _loadFruitDetails();
    _loadBaseDate();
  }

  Future<void> _loadBaseDate() async {
    //final prefs = await SharedPreferences.getInstance();
    //final baseDateString = prefs.getString('baseDate');
    final lockDateString = await DatabaseHelper().getLockDate();
    
    final baseDateString = await DatabaseHelper().getBasedate();
    setState(() {
      //lockDate = DateTime.parse(lockDateString);
      String formatLockDate = DateTime.parse(lockDateString).toIso8601String().split('T')[0];
      formatLockDate = '${formatLockDate.split('-')[2]}-${formatLockDate.split('-')[1]}-${formatLockDate.split('-')[0]}';
      lockDate = formatLockDate;
      baseDate = DateTime.parse(baseDateString!); 
    });
  }

  void _loadFruitDetails() async {
    
   
    if (widget.choir_Id == 13){
      final description = await DatabaseHelper().getFruitDetails_Sw(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_Sw();
    final songinformation = await DatabaseHelper().getSongInfo_Sw(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Sweet toTrust';
      setState(() {
        choir_title= ctitle;
      });
    }
     else  if (widget.choir_Id == 5){
      final description = await DatabaseHelper().getFruitDetails_dor(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_dor();
    final songinformation = await DatabaseHelper().getSongInfo_dor(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Dorica';
      setState(() {
        choir_title= ctitle;
      });
    }

     else  if (widget.choir_Id == 12){
      final description = await DatabaseHelper().getFruitDetails_senior(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_senior();
    final songinformation = await DatabaseHelper().getSongInfo_senior(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'SeniorYouth Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 1){
      final description = await DatabaseHelper().getFruitDetails_amo(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_amo();
    final songinformation = await DatabaseHelper().getSongInfo_amo(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'AMO Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 3){
      final description = await DatabaseHelper().getFruitDetails_chur(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_chur();
    final songinformation = await DatabaseHelper().getSongInfo_chur(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Church Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 4){
      final description = await DatabaseHelper().getFruitDetails_comf(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_comf();
    final songinformation = await DatabaseHelper().getSongInfo_comf(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'The Comforters';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 7){
      final description = await DatabaseHelper().getFruitDetails_family(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_family();
    final songinformation = await DatabaseHelper().getSongInfo_family(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Family Voices';
      setState(() {
        choir_title= ctitle;
      });
    }
    else  if (widget.choir_Id == 8){
      final description = await DatabaseHelper().getFruitDetails_ivet(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_ivet();
    final songinformation = await DatabaseHelper().getSongInfo_ivet(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'iVet Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 14){
      final description = await DatabaseHelper().getFruitDetails_tawo(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_tawo();
    final songinformation = await DatabaseHelper().getSongInfo_tawo(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Tawomboledwa';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 2){
      final description = await DatabaseHelper().getFruitDetails_bles(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_bles();
    final songinformation = await DatabaseHelper().getSongInfo_bles(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Blessed Tidings';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 17){
      final description = await DatabaseHelper().getFruitDetails_zib(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_zib();
    final songinformation = await DatabaseHelper().getSongInfo_zib(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Ziboda Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 10){
      final description = await DatabaseHelper().getFruitDetails_new(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_new();
    final songinformation = await DatabaseHelper().getSongInfo_new(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Newlines Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 11){
      final description = await DatabaseHelper().getFruitDetails_path(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_path();
    final songinformation = await DatabaseHelper().getSongInfo_path(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'PathFinder Choir';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 9){
      final description = await DatabaseHelper().getFruitDetails_kab(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_kab();
    final songinformation = await DatabaseHelper().getSongInfo_kab(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Kabango Choir';
      setState(() {
        choir_title= ctitle;
      });
    }
    else  if (widget.choir_Id == 16){
      final description = await DatabaseHelper().getFruitDetails_young(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_young();
    final songinformation = await DatabaseHelper().getSongInfo_young(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Young Dorcas';
      setState(() {
        choir_title= ctitle;
      });
    }

    else  if (widget.choir_Id == 15){
      final description = await DatabaseHelper().getFruitDetails_tow(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_tow();
    final songinformation = await DatabaseHelper().getSongInfo_tow(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'Tower ofHope';
      setState(() {
        choir_title= ctitle;
      });
    }
    else  if (widget.choir_Id == 6){
      final description = await DatabaseHelper().getFruitDetails_fam(widget.fruitId);
    final fruits = await DatabaseHelper().getFruits_fam();
    final songinformation = await DatabaseHelper().getSongInfo_fam(widget.fruitId);

    if (description.isNotEmpty) {
      setState(() {
        _description = description[0]['description'];
        songinfo = songinformation;
      });
    }
    
    if (fruits.isNotEmpty) {
      setState(() {
       // _fruitName = fruits.firstWhere((fruit) => fruit['id'] == widget.fruitId)['name'];
        fruitz =fruits;
      });
    }
      final ctitle = 'FAM';
      setState(() {
        choir_title= ctitle;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Show notification if at the end of pages
    if (index == 0) {
      _showEndOfPagesNotification("page 1.");
    } else if (index == widget.fruits.length - 1) {
      _showEndOfPagesNotification("last page.");
    }
  }

  void _showEndOfPagesNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }


  void _showFontSizeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FontSizeDialog(
          onFontSizeChanged: (newFontSize) {
            Provider.of<FontSettings>(context, listen: false)
                .setFontSize(newFontSize);
          },
          onBoldChanged: (isBold) {
            Provider.of<FontSettings>(context, listen: false).toggleBold();
          },
        );
      },
    );
  }

  void _navigateToEditScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FruitDetailEdit(fruitId: widget.fruitId, choir_Id: widget.choir_Id,),
      ),
    );

    // Reload fruit details after returning from edit screen
    _loadFruitDetails();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
   return WillPopScope(
     onWillPop: () async {
       // Check if there's a previous screen and pop if so
       timeDilation = 2.0; // slows down animations speed 
       // Check if there's a previous screen and pop if so
               if (Navigator.canPop(context)) {
            // Navigate back to the home screen
             if(widget.choir_Id == 3){Navigator.of(context).popUntil((route) => route.isFirst,);}
               else{Navigator.pop(context);}
                
       }
       return true;
     },
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            SelectableText(choir_title +' SongBook' ,
        onTap: () {_showAppLockDate(context);},
        style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: Colors.white,           
            )
            ),
           
          ],
        ),
        
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
              // Navigate back to the home screen
               if (Navigator.canPop(context)) {
            // Navigate back to the home screen
               
               if(widget.choir_Id == 3){Navigator.of(context).popUntil((route) => route.isFirst,);}
               else{Navigator.pop(context);}

              }
              },
              color: Colors.white,
            ),
            actions: [
               IconButton(
                onPressed: (){
                  _showNumPad(context);
                    },
              icon: Icon(Icons.dialpad),
              color: Colors.white,
              ),

              IconButton(
              icon:  Icon(Icons.text_fields_outlined),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
                  _showFontSizeDialog(context);},
              color:   Colors.white,
            ),

               
              /*IconButton(
              icon:  Icon(widget.choir_Id != 3?Icons.home:null),
              onPressed: () async {

                timeDilation = 2.0; // slows down animations speed 
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
                    case 12 :HomePage = SenioryouthHome();break;
                    case 13 :HomePage = SweetHome();break;
                    case 14 :HomePage = TawomboledwaHome();break;
                    case 15 :HomePage = TowerHome();break;
                    case 16 :HomePage = YoungdorcasHome();break;
                    case 17 :HomePage = ZibodaHome();break;
                    default:
                  }
     widget.choir_Id != 3? await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:(context) => HomePage
                                  )): null;
    //Navigator.pop(context); // Go back to previous screen 
    },
              color:   Colors.white,
            ),
              
          IconButton(
            icon: Icon(Icons.text_fields,
              color: Colors.white,),
            onPressed: () => _showFontSizeDialog(context), // Show font size dialog when tapped
          ),
          ElevatedButton.icon(
              
              //onPressed: _navigateToEditScreen,
              onPressed: () async {
                
    _loadFruitDetails();
              }, label: Text('Edit Song',
              style: TextStyle(color: Colors.grey, fontFamily: 'VarelaRound',),),
              icon: Icon(Icons.edit,
              color: Colors.grey,),
            ),

          PopupMenuButton<String>(
             icon: Icon(Icons.more_vert, color: Colors.white), // Change color of the three dots
            onSelected: (value) async {
              if (value == 'Change Text Font') {
                _showFontSizeDialog(context); // Show font size dialog when tapped
              } else if (value == 'Edit Song') {
                 
              }
            },
            itemBuilder: (BuildContext context,) {
              return {'Change Text Font', 'Edit Song'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),*/
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        itemCount: widget.fruits.length,
        itemBuilder: (context, index) {
          return Consumer<FontSettings>(
            builder: (context, settings, child) {

             

              return SingleChildScrollView(
                controller: _scrollController,
      child :Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


             



            SelectableText(
              getContentNumber(index) + '- ' + '${widget.fruits[index]['name'].toString()}',// title
              style: TextStyle(fontSize: settings.fontSize+6.0, fontFamily: 'VarelaRound', fontWeight: FontWeight.bold),
              onTap: () {
                songInfoDialog(context, widget.songinformation[index]['id']);
              },
            ),
            SizedBox(height: 16),
            /*Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),*/
            SelectableText(
              widget.description[index]['description'].toString(),
              style: TextStyle(
                    fontSize: settings.fontSize,
                    fontFamily: 'VarelaRound',
                    fontWeight: settings.isBold ? FontWeight.bold : FontWeight.normal, // Apply bold style conditionally
                      ),
            ),
            SizedBox(height: 20,),
          //  AnimatedOpacity(
     // opacity: _fabVisible  ? 1.0 : 0.0, // Fade in or out based on visibility flag
     // duration: Duration(milliseconds: 400),
        //  child: 
          Container(
            color: Colors.grey, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
              icon: const Icon(Icons.info_outline_rounded,color: Colors.white,),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
                songInfoDialog(context, widget.songinformation[index]['id']);},
              //color:   Colors.white,
            ),
             SizedBox(width: 10.0,),
                
            IconButton(
                onPressed: () async {
                   await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context,) => FruitDetailEdit(fruitId: widget.description[index]['id'], choir_Id: widget.choir_Id,),
      ),
    );
                    },
              icon: Icon(Icons.edit),
              color: Colors.white,
              ),
              SizedBox(width: 10.0,),
            
           

              ],
            )
          )
          //),
          ],
        ),
      ),
    );
    });
        
        },
        
        ),
        
   /* floatingActionButtonLocation:
FloatingActionButtonLocation.endFloat,
floatingActionButton:
_fabVisible ? FloatingActionButton(
  backgroundColor:Colors.grey,
              foregroundColor: Colors.white,
onPressed: () => _showNumPad(context), // Call numpad function
child:
Icon(Icons.dialpad), // Icon for numpad button
) : null,*/
)

);
        }
        
 _showNumPad(BuildContext context) {
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
    color:  widget.choir_Id ==5 ? const Color.fromARGB(255, 128, 0, 0):const Color.fromARGB(255, 46, 105, 48),
  );

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
          return StatefulBuilder(
        builder: (context, setState) {
          return Container(
          height: MediaQuery.of(context).size.height * 0.75, // Half of the screen height
          decoration: 
                BoxDecoration(
                  gradient: 
                  LinearGradient(
                    colors: widget.choir_Id ==5 ?
                    [Colors.blue, const Color.fromARGB(255, 128, 0, 0)]:
                    [const Color.fromARGB(255, 46, 105, 48), const Color.fromARGB(255, 46, 105, 48),],
                    begin: 
                    Alignment.topCenter, 
                    end: 
                    Alignment.bottomCenter,
                    )
                ),
          child: Column(
            children: [
              if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.white,
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
                    
                    
                      widget.choir_Id == 13? SizedBox(
                        width: 80, // Set width for small buttons
                        height: 80, // Set height for small buttons
                        child: SelectableText(
                          '.',
                          enableInteractiveSelection: false,// disabling selection
                    style: textStyle,
                        onTap: () {
                          // Append '.' to the text field
                         setState(() {
                          numberController.text += '.';
                        });
                      },
                     
                    ),):SizedBox(
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
                if (widget.choir_Id == 13){
                  if (numberController.text.isNotEmpty){
                 double? selectedNumber = double.tryParse(numberController.text);
                if (selectedNumber != null && selectedNumber >= 0.0 && selectedNumber <= fruitz.length-10) {
                   switch (selectedNumber) {
                    case 0.0:selectedNumber=-9;break;
                    case 0.1:selectedNumber=-8;break;
                    case 0.2:selectedNumber=-7;break;
                    case 0.3:selectedNumber=-6;break;
                    case 0.4:selectedNumber=-5;break;
                    case 0.5:selectedNumber=-4;break;
                    case 0.6:selectedNumber=-3;break;
                    case 0.7:selectedNumber=-2;break;
                    case 0.8:selectedNumber=-1;break;
                    case 0.9:selectedNumber=0;break;
                    default: 
                  }  
                   Navigator.of(context).pop(); 
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:(context)=>FruitDetailView(
                      fruitId: selectedNumber!.toInt()+10,
                      initialIndex: selectedNumber.toInt() +9,
                      fruits: fruitz,
                      description: widget.description,
                      songinformation: widget.songinformation,
                      choir_Id: widget.choir_Id,
                    
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
                }
                else if (widget.choir_Id == 3|| widget.choir_Id == 8){
                  if (numberController.text.isNotEmpty){
                 double? selectedNumber = double.tryParse(numberController.text);
                if (selectedNumber != null && selectedNumber >= 0 && selectedNumber <= fruitz.length-1) {
                   switch (selectedNumber) {
                    /*case 0.0:selectedNumber=-9;break;
                    case 0.1:selectedNumber=-8;break;
                    case 0.2:selectedNumber=-7;break;
                    case 0.3:selectedNumber=-6;break;
                    case 0.4:selectedNumber=-5;break;
                    case 0.5:selectedNumber=-4;break;
                    case 0.6:selectedNumber=-3;break;
                    case 0.7:selectedNumber=-2;break;
                    case 0.8:selectedNumber=-1;break;
                    case 0.9:selectedNumber=0;break;
                    default: */
                  } 
                  Navigator.of(context).pop(); 
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:(context)=>FruitDetailView(
                      fruitId: selectedNumber!.toInt()+1,
                      initialIndex: selectedNumber.toInt() ,
                      fruits: fruitz,
                      description: widget.description,
                      songinformation: widget.songinformation,
                      choir_Id: widget.choir_Id,
                    
                    )
                    )
                  );

                } else {
                   // Show error message if input is invalid
                          setState(() {
                            errorMessage = 'Not found!';
                          });
                }
              }
              else {null;}
                }
                else {
                  if (numberController.text.isNotEmpty){
                 double? selectedNumber = double.tryParse(numberController.text);
                if (selectedNumber != null && selectedNumber >= 1
                    && selectedNumber <= fruitz.length
                    ) {
                  Navigator.of(context).pop(); 
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:(context)=>FruitDetailView(
                      fruitId: selectedNumber!.toInt()-1,
                      initialIndex: selectedNumber.toInt() -1,
                      fruits: fruitz,
                      description: widget.description,
                      songinformation: widget.songinformation,
                      choir_Id: widget.choir_Id,
                    
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
                }
                
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
    if (widget.choir_Id == 13){
      if (index < 10) {
      return '0.${index}';
    } else {
      return '${index-9}';
    }
    }
    else if (widget.choir_Id == 3|| widget.choir_Id == 8){
    if (index < 1) {
      return '${index}';
    } else {
      return '${index}';
    }
    }
    else {
      if (index < 0) {
      return '0.${index}';
    } else {
      return '${index+1}';
    }
    }
  }
  void _showAppLockDate(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("App Lock Date"),
          content:  Text(lockDate!,
          style: TextStyle(fontSize: 18,)
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void songInfoDialog(BuildContext context, int? id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Song Info"),
          content:  Text(widget.songinformation[id!-1]['song_ref'].toString()),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
