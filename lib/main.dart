import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/DetailTaskScreen.dart';
import 'package:flutter_application_1/Screen/MainScreen.dart';
import 'package:flutter_application_1/Screen/FirstScreen.dart';
import 'package:flutter_application_1/constants/Colors.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/provider/Task_Provider.dart';
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'Screen/LoginScreen.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => TaskProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          accentColor: ACCENT_COLOR,
          primaryColor: PRIMARY_COLOR,
          appBarTheme: AppBarTheme(backgroundColor: PRIMARY_COLOR),
          inputDecorationTheme: inputDecorationTheme(),
          scaffoldBackgroundColor: HexColor("#EBF9EA"),
          elevatedButtonTheme: elevatedButtonThemeData(),
          outlinedButtonTheme: outlinedButtonThemeData(),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(GoogleFonts.mukta()),
            ),
          ),
          textTheme: textTheme(context),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: HexColor("#22AA56"),
          ),
          drawerTheme: DrawerThemeData(backgroundColor: HexColor("#EBF9EA"))),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/login': (context) => Login(),
        '/dashboard': (context) => MainScreen(),
        '/details': (context) => DetailTaskScreen()
      },
    );
  }
}

InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
      fillColor: PRIMARY_COLOR.withOpacity(.15),
      filled: true,
      labelStyle: const TextStyle(
        color: Colors.black38,
      ),
      contentPadding: const EdgeInsets.all(2),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: PRIMARY_COLOR.withOpacity(.01))),
      focusColor: Colors.black38,
      iconColor: Colors.black38,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
        ),
      ),
    );

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          ACCENT_COLOR,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );

OutlinedButtonThemeData outlinedButtonThemeData() => OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );

TextTheme textTheme(BuildContext context) =>
    GoogleFonts.muktaTextTheme().copyWith(
      subtitle2: TextStyle(
        color: Theme.of(context).textTheme.subtitle2?.color?.withOpacity(.5),
      ),
      headline4: TextStyle(color: Colors.white),
      subtitle1: TextStyle(fontWeight: FontWeight.bold),
    );
