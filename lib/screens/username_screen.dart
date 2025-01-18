import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointx/providers/auth_provider.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context);
    return Scaffold(
      // backgroundColor: const Color(0xFF0D1127),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF614FA8),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: 0.7,
                child: Image.asset(
                  'assets/username.png',
                ),
              ),
            ),
            Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 25,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/pointx_logotag.png',
                        height: 120,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter your username to continue',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
