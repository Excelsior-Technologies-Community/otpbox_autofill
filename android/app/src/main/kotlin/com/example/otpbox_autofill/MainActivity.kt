package com.example.otpbox_autofill

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.google.android.gms.auth.api.phone.SmsRetriever

class MainActivity : FlutterActivity() {

    private val CHANNEL = "otpbox_autofill"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "startListening") {
                SmsRetriever.getClient(this).startSmsRetriever()
                result.success(true)
            } else {
                result.notImplemented()
            }
        }
    }
}
