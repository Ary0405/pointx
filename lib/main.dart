import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointx/providers/auth_provider.dart';
import 'package:pointx/screens/username_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
      ),
    );
  }
}
