
import 'package:flutter/material.dart';
import 'package:sweet/screens/home/church_home.dart';

import '../options/custom_text_selection_controls.dart';
import 'home/dorica_home.dart';

class Expired15Screen extends StatefulWidget {
  const Expired15Screen({super.key});

  @override
  State<Expired15Screen> createState() => _Expired15ScreenState();
}

class _Expired15ScreenState extends State<Expired15Screen> {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(12), // Rectangular buttons
    ),
      backgroundColor: Colors.green,// Background color
      foregroundColor: Colors.white,
      //minimumSize: Size(5, 5), // Define size of buttons
  );
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 202, 195, 195),
        title: Text('App 15 Days to Expire',
        style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
                        
            )),
      ),
      body: Center(
        child: Column( 
          children: [
            SizedBox(height: 50,),
            SelectableText(
          'Renew or Get the latest version\n\n\nContact the developer\n'
          'lindadimadalitsop@gmail.com.\n'
          'Call/WhatsApp: 0888693338 / 0999555439',
          //showCursor: true,
            //cursorColor: Colors.blue,
            //cursorWidth: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 53, 145, 78)),
       onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
          ),
          SizedBox(height: 16,),
          ElevatedButton(
                        style: buttonStyle,  
                      onPressed: () {
                        // Navigate back to the home screen
               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChurchHome(),
                              )
                            );
                      },
                      child: Text('Close', style: TextStyle(fontSize: 18)),
                    ),
        ]
        )));
     }
  }

  class Expired1Screen extends StatefulWidget {
  const Expired1Screen({super.key});

  @override
  State<Expired1Screen> createState() => _Expired1ScreenState();
}

class _Expired1ScreenState extends State<Expired1Screen> {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(12), // Rectangular buttons
    ),
      backgroundColor: Colors.green,// Background color
      foregroundColor: Colors.white,
      //minimumSize: Size(5, 5), // Define size of buttons
  );
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 202, 195, 195),
        title: Text('App Expires Tomorrow',
        style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
                        
            )),
      ),
      body: Center(
        child: Column( 
          children: [
            SizedBox(height: 50,),
            SelectableText(
          'Renew or Get the latest version\n\n\nContact the developer\n'
          'smarttechplusplus@gmail.com.\n'
          'Call/WhatsApp: 0888693338 / 0999555439',
          //showCursor: true,
            //cursorColor: Colors.blue,
            //cursorWidth: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 53, 145, 78)),
       onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
          ),
          SizedBox(height: 16,),
          ElevatedButton(
                        style: buttonStyle,  
                      onPressed: () {
                        // Navigate back to the home screen
               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChurchHome(),
                              )
                            );
                      },
                      child: Text('Close', style: TextStyle(fontSize: 18)),
                    ),
        ]
        )));
     }
  }

  class Expired7Screen extends StatefulWidget {
  const Expired7Screen({super.key});

  @override
  State<Expired7Screen> createState() => _Expired7ScreenState();
}

class _Expired7ScreenState extends State<Expired7Screen> {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(12), // Rectangular buttons
    ),
      backgroundColor: Colors.green,// Background color
      foregroundColor: Colors.white,
      //minimumSize: Size(5, 5), // Define size of buttons
  );
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 202, 195, 195),
        title: Text('App 7 Days to Expire',
        style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
                        
            )),
      ),
      body: Center(
        child: Column( 
          children: [
            SizedBox(height: 50,),
            SelectableText(
          'Renew or Get the latest version\n\n\nContact the developer\n'
          'lindadimadalitsop@gmail.com.\n'
          'Call/WhatsApp: 0888693338 / 0999555439',
          //showCursor: true,
            //cursorColor: Colors.blue,
            //cursorWidth: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 53, 145, 78)),
       onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
          ),
          SizedBox(height: 16,),
          ElevatedButton(
                        style: buttonStyle,  
                      onPressed: () {
                        // Navigate back to the home screen
               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChurchHome(),
                              )
                            );
                      },
                      child: Text('Close', style: TextStyle(fontSize: 18)),
                    ),
        ]
        )));
     }
  }

class ExpiredScreen extends StatefulWidget {
  const ExpiredScreen({super.key});

  @override
  State<ExpiredScreen> createState() => _ExpiredScreenState();
}

class _ExpiredScreenState extends State<ExpiredScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        backgroundColor:  const Color.fromARGB(255, 202, 195, 195),
        title: Text('App Expired',
        style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
                        
            )),
      ),
      body: Center(
        child: SelectableText(
          'Renew or Get the latest version\n\n\nContact the developer\n'
          'lindadimadalitsop@gmail.com.\n'
          'Call/WhatsApp: 0888693338 / 0999555439',
          //showCursor: true,
            //cursorColor: Colors.blue,
            //cursorWidth: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.red,),
       onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
          ),
        ));
     }
  }