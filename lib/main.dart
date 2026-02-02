import 'package:flutter/material.dart';
import 'package:otpbox_autofill/otpbox_autofill.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpTestScreen(),
    );
  }
}

class OtpTestScreen extends StatefulWidget {
  const OtpTestScreen({super.key});

  @override
  State<OtpTestScreen> createState() => _OtpTestScreenState();
}

class _OtpTestScreenState extends State<OtpTestScreen> {
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Autofill")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpBoxAutofill(
              onCompleted: (v) => setState(() => otp = v),
            ),
            const SizedBox(height: 20),
            Text("OTP: $otp"),
          ],
        ),
      ),
    );
  }
}
