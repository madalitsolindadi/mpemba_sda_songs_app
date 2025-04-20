// lib/developer_info_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'options/custom_text_selection_controls.dart';
import 'screens/home/dorica_home.dart';

class DeveloperInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 60, 60),
      appBar: AppBar(
       backgroundColor:  const Color.fromARGB(255, 49, 112, 164),
        title: Text('Developer Info',
         style: TextStyle(
              fontSize: 18.0,
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: Colors.white,)),
      leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
              // Navigate back to the home screen
               Navigator.pop(
                              context
                              
                            );
              },
              color: Colors.white,
            ),
      ),
      body: SingleChildScrollView(
        child: Container(
       // color: const Color.fromARGB(255, 61, 60, 60), // Set background color to blue
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  '\n\nMpemba SDASongs App\nwas made in love for ' 
                '\"Church Music\"\nand the Mpemba SDA Church Singing Groups\nby Madalitso P. Lindadi. \na solo software app developer.\n\n\n'
                'If you enjoy using the App, please consider leaving your reviews to\nsmarttechplusplus@gmail.com.'
                ' \nor WhatsApp to\n0888693338 / 0999555439'
                '\n\n\nThis will help to make the App better in the next release.\n\n\n'
                  'This app was developed using Flutter.\n\n\n'
                'To God be the glory for the zeal of learning new programming skills.\n\n\n'
                'Thanks to different individuals for providing the text of the various hymns.\nSpecial thanks to my MUBAS computer lecturers;\nFlavia Kambale\nwho laid a C++ foundation,'
                '\nJuliana Masi\nwho introduced me to OOP,\nand Bahat Phiri\nwho introduced me to GUI\n'
                'and showed me a way to\nFlutter Development.\n\nCopyright©2025\n\n\n\n\n\n',
                  style: TextStyle(fontSize: 16, fontFamily: 'VarelaRound', color: Colors.white), // White text
                  textAlign: TextAlign.center,
                  onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}