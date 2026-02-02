# OTPBox Autofill

OTPBox Autofill is a reusable Flutter widget that provides clean OTP input boxes with optional SMS autofill support.

It helps you avoid writing repetitive OTP UI logic and makes it easy to capture and validate OTP codes.

---

## Feature Preview

- Multiple OTP input boxes  
- Auto move to next box  
- Backspace navigation  
- Paste full OTP  
- Manual OTP input  
- SMS OTP autofill (Android / iOS)  
- Simple Material UI  

---

## Preview
// Upload a screen recording or screenshot here

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```
dependencies:
  otpbox_autofill:
    git:
      url: https://github.com/Excelsior-Technologies-Communitye/otpbox_autofill.git
```
then run:
```
flutter pub get
```
---------------------------
## File Structure
```
otpbox_autofill/
│
├─ lib/
│   ├─ otpbox_autofill.dart          # Main library file
│   │
│   └─ src/
│       └─ otpbox_autofill_widget.dart   # OtpBoxAutofill widget
│
├─ example/
│   └─ main.dart                     # Example usage
│
├─ pubspec.yaml
├─ README.md
└─ LICENSE
```
-----------------------------
## Usage
```
import 'package:flutter/material.dart';
import 'package:otpbox_autofill/otpbox_autofill.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpBoxAutofill(
              length: 6,
              onCompleted: (value) {
                setState(() {
                  otp = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Text("OTP: $otp"),
          ],
        ),
      ),
    );
  }
}

```
--------------------------------

## OtpBoxAutofill Properties

| Property        | Type               | Required | Default | Description |
|-----------------|--------------------|----------|---------|-------------|
| `length`        | `int`              | No       | `6`     | Number of OTP digits |
| `boxSize`       | `double`           | No       | `50`    | Width & height of each OTP box |
| `onCompleted`   | `Function(String)` | Yes      | —       | Callback when OTP is fully entered |
--------------------------------
## MIT License
```
Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this OTPBox Autofill library and associated documentation files
(the “Software”), to deal in the Software without restriction, including without
limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES, OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING FROM,
OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
