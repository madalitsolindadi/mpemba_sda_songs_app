// lib/developer_info_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'options/custom_text_selection_controls.dart';
import 'screens/home/dorica_home.dart';

class PublisherInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 61, 60, 60),
      appBar: AppBar(
       backgroundColor:  const Color.fromARGB(255, 49, 112, 164),
        title: Text('Malamulo Publishing House Info',
         style: TextStyle(
              fontSize: 16.0,
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
                  pub_info.toString(),
                  style: TextStyle(fontSize: 16, fontFamily: 'VarelaRound', color: Colors.white), // White text
                  textAlign: TextAlign.start,
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
    )
    );

  }
  final List<String> pub_info = [
    '''MAWU OTSOGOLERA

Ili ndi bukhu la nyimbo za utumiki wa amayi mu mpingo wa Seventh-day
Adventist m'dziko la Malawi (Malawi Union Conference). Ndipo uku ndi kusindikiza
Bukhuli lalinganizidwa, kusindikizidwa komanso kufalitsidwa ndi
nyumba yosindikiza mabuku ya Malamulo Publishing House, mogwirizana ndi
nthambi yotsogolera utumiki wa amayi mu mpingo wa Seventh-day Adventist kuno ku
Malawi. Ganizo lolinganiza bukhu la nyimbo za amayi a mpingowu linakhazikitsidwa
pa mkumano womwe unachitika pakati pa atsogoleri a Malamulo Publishing House ndi
atsogoleri a amayi mu mpingo wa Seventh-day Adventist, pa 15 October, 2014.

Mkumanowu unabweretsa pamodzi atsogoleri a utumiki wa amayi ochokera ku
chigawo cha Kum'mwera, (South Malawi Conference), pakati, (Central Malawi
Conference), kumpoto (North Malawi Conference), komanso likulu la mpingowu
m'dziko lonse la Malawi, (Malawi union Conference) ndi atsogoleri a nyumba
yosindikiza mabuku ya Malamulo Publishing House. Ena a akazi a abusa
(shephardesses) analiponso pa mkumanowu, motsogozedwa ndi mkazi wa mtsogoleri
wa mpingowu m'dziko muno. Bukhu la nyimbo za utumiki wa amayili lalinganizidwa
ndi kusindikizidwa pa zolinga izi:
• Kusungira nyimbozi ndi mayimbidwe ake kuti mibadwo ya mtsogolo idzathe
kuyamikira ndi kutsatira mayimbidwe okoma a amayi a lero.
• Kuthandiza amayi kukhala ndi mayimbidwe ofanana komanso ogwirizana
ka nyimbozi mu mpingo wonse wa Seventh-day Adventist m'dziko muno,
molingana ndi momwe ozipeka analinganizira.
• Kupeputsa amayi ku ntchito yokopera nyimbozi paokha.

Mu kusindikiza kwachitatuku m'bukhuli mwaonjezeredwa nyimbo imodzi ya
Chitumbuka yomwe inavomerezedwa pa mkumano wa posachedwapa wa atsogoleri a
utumiki wa amayi m'dziko muno. Nyimboyi ikubwera kumapeto kweni-kweni kwa
bukhuli, pambuyo pa zomwe zinalimo kale.

Mu kusindikiza kwachitatuku m'bukhuli muli nyimbo 173. Nyimbo 167 ndi za
Chichewa, ndipo 6 ndi za Chitumbuka. Nyimbo zokwana 143 ndi za Do Do Do ndipo
zotsala zonsezo ndi za mawu okha. Pali chiyang'aniro chakuti nazonso za mawu
okhazo zidzakhala ndi Do Do Do wake pa kusindikiza kwa mtsogolo.

Tikuthokoza amayi onse omwe anatenga mbali pa ntchito yosonkhanitsa ndi kusankha nyimbozi.

Sitikuiwalanso kuthokoza anthu onse omwe anapeka nyimbozi. Mulungu
akudalitseni pamene mukugwiritsa ntchito bukhu ili la nyimbo za utumiki wa amayi.

IFE OLINGANIZA, KUSINDIKIZA, NDI KUFALITSA BUKHULI
''',
  ];
}