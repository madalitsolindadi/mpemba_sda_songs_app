import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweet/screens/home/church_home.dart';
import 'package:sweet/screens/splash_screen.dart';

import 'app_expiry_manager.dart';
import 'database_helper/database_helper.dart';
import 'options/font_state.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'screens/home/sweet_home.dart';
import 'options/songs_setup.dart';
import 'screens/exp_screenz.dart';
import 'screens/home/dorica_home.dart';

//final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  SongsSetup songsSetup = SongsSetup();
  await AppExpiryManager.initializeNotifications();
  await DatabaseHelper().database;
  await songsSetup.initializeSongs();
  tz.initializeTimeZones();
  timeDilation = 2.0; // slows down animations speed

  //const AndroidInitializationSettings initializationSettingsAndroid =
  // AndroidInitializationSettings('app_icon');

  //final InitializationSettings initializationSettings = InitializationSettings(
  // android: initializationSettingsAndroid,
  //);

  //await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(
    ChangeNotifierProvider(
      create: (context) => FontSettings(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Create an instance of AppExpiryManager
  final AppExpiryManager appExpiryManager = AppExpiryManager();
  // setting expiration date here did not work 2024/11/24
  DateTime today = DateTime.now();
  final DateTime expiryDate =
      DateTime(2024, 12, 30); //Customize the expiry date yyyy-MM-dd
  final DateTime oneDayToExpire = DateTime(2024, 12, 29);
  final DateTime sevenDaysToExpire = DateTime(2024, 12, 23);
  final DateTime fifteenDaysToExpire = DateTime(2024, 12, 15);

  //bool is1DayToExpire = false;
  //bool is7DaysToExpire = false;
  //bool is15DaysToExpire = true;

  @override
  Widget build(BuildContext context) {
    // Schedule notifications for expiry reminders when the app starts
    /* appExpiryManager.scheduleExpiryNotifications();

    bool is1DayToExpire = today.year==oneDayToExpire.year && today.month==oneDayToExpire.month
                          && today.day==oneDayToExpire.day;
    bool is7DaysToExpire = today.year==sevenDaysToExpire.year && today.month==sevenDaysToExpire.month
                          && today.day==sevenDaysToExpire.day;
    bool is15DaysToExpire = today.year==fifteenDaysToExpire.year && today.month==fifteenDaysToExpire.month
                          && today.day==fifteenDaysToExpire.day;
    bool isAppExpired() {
    return today.isAfter(expiryDate);
  }
    

    // Check if the app has expired
    if (isAppExpired()) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Voices songBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ExpiredScreen(),
      );
    } 
    else if (is15DaysToExpire) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Voices songBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Expired15Screen(),
      );
    }
    else if (is7DaysToExpire) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Voices songBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Expired7Screen(),
      );
    }
    else if (is1DayToExpire) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Voices songBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Expired1Screen(),
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Voices songBook',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      );
    }*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mpemba SDASongs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class ThreeMonthBasedScreen extends StatefulWidget {
  @override
  _ThreeMonthBasedScreenState createState() => _ThreeMonthBasedScreenState();
}

class _ThreeMonthBasedScreenState extends State<ThreeMonthBasedScreen> {
  DateTime? baseDate;
  DateTime? lockDate;
  DateTime? lockingDate;

  @override
  void initState() {
    super.initState();
    _loadBaseDate();
    _loadLockDate();
  }

  Future<void> _loadBaseDate() async {
    final prefs = await SharedPreferences.getInstance();
    final baseDateString = prefs.getString('baseDate');
    setState(() {
      baseDate = baseDateString != null
          ? DateTime.parse(baseDateString)
          : DateTime(2024, 09, 30); // Default base date
    });
  }

  Future<void> _loadLockDate() async {
    final lockDateString = await DatabaseHelper().getLockDate();
    DateTime today = DateTime.now();
    setState(() {
      lockDate = DateTime.parse(lockDateString);
    });
    if (today.day == lockDate?.day &&
        today.month == lockDate?.month &&
        today.year == lockDate?.year) {
      setState(() {
        _updateLockingDate();
      });
    } else {
      setState(() {
        lockingDate = lockDate;
      });
    }
  }

  Future<void> _updateLockingDate() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    DateTime newLockingDate;

    int yr;
    int mth;
    int dy;
    String stringNewLockingDate;
    if (today.month == 12) {
      yr = today.year - 40;
      mth = 1;
      if (today.day < 10) {
        dy = today.day;
        stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '0$dy';
      } else {
        dy = today.day;
        stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
      }
    } else if (today.month == 01) {
      mth = today.month + 1;
      yr = today.year - 40;
      if (today.day < 29) {
        if (today.day < 10) {
          dy = today.day;
          stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '0$dy';
        } else {
          dy = today.day;
          stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
        }
      } else {
        dy = 28;
        stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
      }
    } else {
      yr = today.year - 40;
      mth = today.month + 1;
      dy = today.day;
      if (mth < 10) {
        if (dy < 10) {
          stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '0$dy';
        } else {
          if (dy == 31) {
            dy = 30;
            stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
          } else {
            stringNewLockingDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
          }
        }
      } else {
        if (dy < 10) {
          stringNewLockingDate = '$yr' + '-' + '$mth' + '-' + '0$dy';
        } else {
          stringNewLockingDate = '$yr' + '-' + '$mth' + '-' + '$dy';
        }
      }
    }

    newLockingDate = DateTime.parse(stringNewLockingDate);

    //await prefs.setString('baseDate', newBaseDate.toIso8601String());
    await DatabaseHelper().updateLockDate(newLockingDate.toString());
    setState(() {
      lockingDate = newLockingDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (baseDate == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()), // Loading state
      );
    }

    DateTime today = DateTime.now();

    /*bool isAfterLockDate() {
    return today.isAfter(lockDate!);
  }*/
    bool isAfterLockDate = today.isAfter(lockingDate!);

    bool is5minutes = today.difference(baseDate!).inMinutes >= 5;

    // Calculate the difference in days from the base date
    int daysDifference =
        (today.year - baseDate!.year) * 12 + (today.day - baseDate!.day);

    int daysDiff = today.day - baseDate!.day;

    // Check if today is after the two-day interval
    bool isAfterTwoDayInterval = daysDiff % 2 == 0;

    // Calculate the difference in months from the base date
    int monthsDifference =
        (today.year - baseDate!.year) * 12 + (today.month - baseDate!.month);

    // Check if today is after the three-month interval
    bool isAfterThreeMonthInterval =
        monthsDifference % 3 == 0 && today.day >= baseDate!.day;

    // Check if today is after the three-month interval
    bool isAfterOneMonthInterval =
        monthsDifference % 1 == 0 && today.day >= baseDate!.day;

    // Navigate to the appropriate screen
    return isAfterLockDate
        ? PasswordProtectedScreen(onPasswordSuccess: _updateLockDate)
        : ChurchHome();
  }

  Future<void> _updateBaseDate() async {
    final prefs = await SharedPreferences.getInstance();
    final newBaseDate = DateTime.now();
    //await prefs.setString('baseDate', newBaseDate.toIso8601String());
    await DatabaseHelper().updateBaseDate(newBaseDate.toIso8601String());
    setState(() {
      baseDate = newBaseDate;
    });
  }

  Future<void> _updateLockDate() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    DateTime newLockDate;

    int yr;
    int mth;
    int dy;
    String stringNewLockDate;
    if (today.month == 12) {
      yr = today.year + 1;
      mth = 1;
      if (today.day < 10) {
        dy = today.day;
        stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '0$dy';
      } else {
        dy = today.day;
        stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
      }
    } else if (today.month == 01) {
      mth = today.month + 1;
      yr = today.year;
      if (today.day < 29) {
        if (today.day < 10) {
          dy = today.day;
          stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '0$dy';
        } else {
          dy = today.day;
          stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
        }
      } else {
        dy = 28;
        stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
      }
    } else {
      yr = today.year;
      mth = today.month + 1;
      dy = today.day;
      if (mth < 10) {
        if (dy < 10) {
          stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '0$dy';
        } else {
          if (dy == 31) {
            dy = 30;
            stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
          } else {
            stringNewLockDate = '$yr' + '-' + '0$mth' + '-' + '$dy';
          }
        }
      } else {
        if (dy < 10) {
          stringNewLockDate = '$yr' + '-' + '$mth' + '-' + '0$dy';
        } else {
          stringNewLockDate = '$yr' + '-' + '$mth' + '-' + '$dy';
        }
      }
    }

    newLockDate = DateTime.parse(stringNewLockDate);

    //await prefs.setString('baseDate', newBaseDate.toIso8601String());
    await DatabaseHelper().updateLockDate(newLockDate.toString());
    setState(() {
      lockDate = newLockDate;
    });
  }
}

class PasswordProtectedScreen extends StatelessWidget {
  final VoidCallback onPasswordSuccess;

  const PasswordProtectedScreen({required this.onPasswordSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromARGB(255, 33, 138, 40),
          title: Text("Password Required",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, const Color.fromARGB(255, 128, 0, 0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => SystemNavigator.pop(),
            color: Colors.white,
          )),
      body: PasswordForm(onPasswordSuccess: onPasswordSuccess),
    );
  }
}

class PasswordForm extends StatefulWidget {
  final VoidCallback onPasswordSuccess;

  const PasswordForm({required this.onPasswordSuccess});

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  String passYear = DateTime.now().year.toString();
  String correctPassword = ""; // Set your password here
  String errorMessage = "";
  bool _obscurePassword = true;
  String askForPasswordString =
      "To get your password;\ncontact the developer:\n\n"
      "smarttechplusplus@gmail.com\n0888693338\n0999555439";
  DateTime? lockDate;

  @override
  void initState() {
    super.initState();
    _loadLockDate();
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

  void _askForPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Contact the Developer"),
          content: SelectableText(askForPasswordString),
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

  void _showPasswordHint(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Password Hint"),
          content:
              SelectableText('Tichenjere tingaiwale Yehova nthawi yothaitha!!'),
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

  void _validatePassword() {
    correctPassword = "Mpemba$passYear"; // Set your password here
    if (_passwordController.text == correctPassword) {
      // If the password is correct, update the base date and navigate to HomeScreen
      widget.onPasswordSuccess();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChurchHome()),
      );
      _clear();
    } else {
      // Show an error message
      setState(() {
        errorMessage = "Incorrect password. Please try again.";
      });
    }
  }

  Future<void> _loadLockDate() async {
    final lockDateString = await DatabaseHelper().getLockDate();
    setState(() {
      lockDate = DateTime.parse(lockDateString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Open the songBook with Password",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: const Icon(Icons.lock, color: Colors.green),
              suffixIcon: IconButton(
                icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              labelStyle: TextStyle(fontSize: 18.0),
              border: OutlineInputBorder(),
            ),
            obscureText: _obscurePassword,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _validatePassword,
            child: Text("Open"),
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // text and iconcolor
                backgroundColor: Colors.green // Background color
                ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              if (lockDate == DateTime.parse('2025-01-20')) {
                _askForPassword(context);
              } else {
                _showPasswordHint(context);
              }
            },
            label: Text("Forgot Password?"),
            icon: const Icon(Icons.lock_reset),
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // text and iconcolor
                backgroundColor: Colors.green // Background color
                ),
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
      ),
    );
  }
}
