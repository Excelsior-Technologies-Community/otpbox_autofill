class SmsAutoFillService {
  static Future<void> startListening(
      Function(String otp) onOtpReceived) async {

    await Future.delayed(const Duration(seconds: 2));

    final otp =
    (100000 + DateTime.now().millisecondsSinceEpoch % 900000).toString();

    onOtpReceived(otp);
  }
}
