import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointx/providers/auth_provider.dart';
import 'package:pointx/screens/logged_in_screen.dart';
import 'package:pointx/screens/login_screen.dart';
import 'package:pointx/screens/otp_screen.dart';
import 'package:pointx/screens/select_store_screen.dart';
import 'package:pointx/screens/store_details_screen.dart';
import 'package:pointx/screens/success_screen.dart';
import 'package:pointx/screens/username_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class NoGlowOnScroll extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(
            username: "",
          ),
        ),
      ],
      child: MaterialApp(
        title: 'PointX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0x008063be)),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        home: UsernameScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/otp': (context) => const OtpScreen(),
          '/logged_in': (context) => const LoggedInScreen(),
          '/select_store': (context) => const SelectStoreScreen(),
          '/success': (context) => const SuccessScreen(),
          '/store_details': (context) => const StoreDetailsScreen(),
        },
      ),
    );
  }
}
