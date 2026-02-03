import 'package:flutter/material.dart';
import 'sms_autofill.dart';
import 'otpbox_autofill_widget.dart';

class AutoFillOtpBox extends StatefulWidget {
  final int otpLength;

  const AutoFillOtpBox({super.key, this.otpLength = 6});

  @override
  State<AutoFillOtpBox> createState() => _AutoFillOtpBoxState();
}

class _AutoFillOtpBoxState extends State<AutoFillOtpBox> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  String? fakeSms;
  bool otpFilled = false;

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.otpLength, (_) => TextEditingController());
    focusNodes =
        List.generate(widget.otpLength, (_) => FocusNode());

    SmsAutoFillService.startListening(_onOtpReceived);
  }

  void _onOtpReceived(String otp) async {
    const appHash = "FA+9qCX9VSu";

    // 1. Show SMS
    setState(() {
      fakeSms = "<#> Your OTP is $otp\n$appHash";
    });

    // 2. Wait so user can read SMS
    await Future.delayed(const Duration(seconds: 2));

    // 3. Autofill OTP
    for (int i = 0; i < widget.otpLength; i++) {
      controllers[i].text = otp[i];
    }

    setState(() => otpFilled = true);

    // 4. Wait 2 seconds, then delete SMS
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      fakeSms = null; // SMS disappears
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Fake SMS banner (top)
            if (fakeSms != null)
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  fakeSms!,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ),

            const SizedBox(height: 60),

            // OTP boxes (center)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.otpLength, (index) {
                return OtpBoxWidget(
                  controller: controllers[index],
                  current: focusNodes[index],
                  next: index < widget.otpLength - 1
                      ? focusNodes[index + 1]
                      : null,
                  previous:
                  index > 0 ? focusNodes[index - 1] : null,
                );
              }),
            ),

            const SizedBox(height: 30),

            if (otpFilled)
              const Center(
                child: Text(
                  "OTP auto-filled from SMS",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
