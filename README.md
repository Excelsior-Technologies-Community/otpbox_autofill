#OTPBox Autofill

OTPBox Autofill is a reusable Flutter widget that demonstrates OTP input boxes with simulated SMS autofill.

It helps you avoid writing repetitive OTP UI logic and shows how OTP autofill works using a service layer.
---

## Feature Preview

- Multiple OTP input boxes
- Auto move to next box
- Backspace navigation
- Manual OTP input
- Simulated SMS OTP autofill
- Fake SMS preview banner
- Simple Material UI

---

## Preview
https://github.com/user-attachments/assets/67424f98-859e-41d4-bdf1-5807856904d9

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```
dependencies:
  otpbox_autofill:
    git:
      url: https://github.com/Excelsior-Technologies-Community/otpbox_autofill.git
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
│       ├─ autofill_otpbox.dart      # AutoFillOtpBox screen
│       ├─ sms_autofill.dart         # Simulated SMS service
│       └─ otpbox_autofill_widget.dart   # Single OTP box widget
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

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutoFillOtpBox(),
    );
  }
}


```
--------------------------------

## OtpBoxAutofill Properties

| Property    | Type | Required | Default | Description                            |
| ----------- | ---- | -------- | ------- | -------------------------------------- |
| `otpLength` | int  | No       | `6`     | Number of OTP digits (OTP boxes count) |

--------------------------------
# How SMS Autofill Works
```
This package uses a simulated SMS service:

SmsAutoFillService.startListening(...)
```
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
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY...

```
