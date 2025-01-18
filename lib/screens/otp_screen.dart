import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF614FA8),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/otp.png',
                  ),
                  // const SizedBox(height: 20),
                  const Text(
                    'Verification Code',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'We have sent a One-Time Password to your mobile number ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // otp input boxes
                  OTPTextField(
                    length: 4,
                    width: 250,
                    fieldWidth: 50,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) async {
                      Navigator.pushNamed(context, '/logged_in');
                    },
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.white,
                      borderColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
