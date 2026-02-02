import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpBoxAutofill extends StatefulWidget {
  final int length;
  final double boxSize;
  final Function(String) onCompleted;

  const OtpBoxAutofill({
    super.key,
    this.length = 6,
    this.boxSize = 50,
    required this.onCompleted,
  });

  @override
  State<OtpBoxAutofill> createState() => _OtpBoxAutofillState();
}

class _OtpBoxAutofillState extends State<OtpBoxAutofill>
    with CodeAutoFill {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers =
        List.generate(widget.length, (index) => TextEditingController());
    focusNodes =
        List.generate(widget.length, (index) => FocusNode());
    listenForCode();
  }

  @override
  void codeUpdated() {
    if (code != null && code!.length == widget.length) {
      for (int i = 0; i < widget.length; i++) {
        controllers[i].text = code![i];
      }
      widget.onCompleted(code!);
    }
  }

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      for (int i = 0; i < widget.length; i++) {
        controllers[i].text = value[i];
      }
      widget.onCompleted(value);
      return;
    }

    if (value.isNotEmpty && index < widget.length - 1) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    String otp = controllers.map((e) => e.text).join();
    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  Widget _buildBox(int index) {
    return SizedBox(
      width: widget.boxSize,
      height: widget.boxSize,
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (v) => _onChanged(v, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:
      List.generate(widget.length, (i) => _buildBox(i)),
    );
  }

  @override
  void dispose() {
    cancel();
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }
}
