import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen/MainScreen.dart';
import 'package:flutter_application_1/constants/Colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Screen/DashboardScreen.dart';
import 'Screen/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keep Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        ),
          accentColor: ACCENT_COLOR,
          primaryColor: PRIMARY_COLOR,
          appBarTheme: AppBarTheme(backgroundColor: PRIMARY_COLOR),
          inputDecorationTheme: InputDecorationTheme(
              fillColor: PRIMARY_COLOR.withOpacity(.15),
              filled: true,
              labelStyle: TextStyle(
                color: Colors.black38,
              ),
              contentPadding: const EdgeInsets.all(2),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: PRIMARY_COLOR.withOpacity(.01))),
              focusColor: Colors.black38,
              iconColor: Colors.black38,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              )),
          scaffoldBackgroundColor: HexColor("#EBF9EA"),
          elevatedButtonTheme: ElevatedButtonThemeData(
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
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(GoogleFonts.mukta()),
            ),
          ),
          textTheme: GoogleFonts.muktaTextTheme(),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: HexColor("#22AA56"),
          ),
          drawerTheme: DrawerThemeData(backgroundColor: HexColor("#EBF9EA"))),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/dashboard': (context) => MainScreen()
      },
    );
  }
}
