// lib/developer_info_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'options/custom_text_selection_controls.dart';
import 'screens/home/dorica_home.dart';

class DonateScreen extends StatefulWidget {
  final int choir_Id;
  const DonateScreen({super.key, required this.choir_Id});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       //backgroundColor: Colors.blue,
        title: Text('Donate',
         style: TextStyle(
              fontSize: 26.0,
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: Colors.white,)),
              flexibleSpace: 
              Container(
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
              ),
      leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                timeDilation = 2.0; // slows down animations speed 
              // Navigate back to the home screen
               Navigator.pop(context);
              },
              color: Colors.white,
            ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          SelectableText(
                  "\nSupport the developer with a donation\n",
                  style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'VarelaRound', fontWeight: FontWeight.bold), // White text
                  textAlign: TextAlign.center,
                  onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
                ),
          Expanded(
            child: SingleChildScrollView(   
     child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            
                SelectableText(
                  "If you find this app useful please consider\nsupporting the developer with a donation\n"
                  ,
                  style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'MAIAN'), // White text
                  textAlign: TextAlign.center,
                  onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
                ),
                Image.asset('assets/sponsor.png',
                width: 100.0,
                height: 100.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset('assets/airtel.png',
                width: 30.0,
                height: 30.0,),
                SizedBox(width: 8,),
                SelectableText(
                  
                  "0999555439",
                  style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'MAIAN'), // White text
                  textAlign: TextAlign.center,
                  onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
                ),]),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset('assets/tnm.png',
                width: 35.0,
                height: 35.0,),
                SizedBox(width: 8,),
                SelectableText(
                  
                  "0888693338",
                  style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'MAIAN'), // White text
                  textAlign: TextAlign.center,
                  onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
                ),
                ]
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset('assets/nb_icon.png',
                width: 30.0,
                height: 30.0,),
                SizedBox(width: 8,),
                SelectableText(
                  
                  "1001957728",
                  style: TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'MAIAN'), // White text
                  textAlign: TextAlign.center,
                  onSelectionChanged: (selection, cause) {
              // Handle selection changes if needed
              print('Selected text from ${selection.start} to ${selection.end}');
            },
            contextMenuBuilder: (context, editableTextState) {
              return CustomTextSelectionToolbar(editableTextState: editableTextState);
            },
                ),]),
          ],
        ),
      ),
    )
      ))]
      )
    );
  }
}