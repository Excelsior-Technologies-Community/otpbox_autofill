import 'package:flutter/material.dart';

class OtpBoxWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode current;
  final FocusNode? next;
  final FocusNode? previous;

  const OtpBoxWidget({
    super.key,
    required this.controller,
    required this.current,
    this.next,
    this.previous,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: TextField(
        controller: controller,
        focusNode: current,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && next != null) {
            next!.requestFocus();
          }
          if (value.isEmpty && previous != null) {
            previous!.requestFocus();
          }
        },
      ),
    );
  }
}
