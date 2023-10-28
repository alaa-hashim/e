// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:ecommerce_app/core/services/stripekeys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/user.dart';

abstract class PaymentManager extends GetxController {
  User? user;
  static Future<void> makePayment(int amount, String currency) async {
    try {
      String clientSecret =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
          appearance: const PaymentSheetAppearance(
              colors: PaymentSheetAppearanceColors(background: AppColor.black)),
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: "alaa",
          style: ThemeMode.light,
          customerId: Stripe.stripeAccountId),
    );
  }

  static Future<String> _getClientSecret(String amount, String currency) async {
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'amount': amount,
        'currency': currency,
      },
    );

    if (response.statusCode == 200) {
      // Parse the JSON response to extract the client secret
      final Map<String, dynamic> responseJson = json.decode(response.body);
      final String clientSecret = responseJson['client_secret'];

      if (clientSecret != null) {
        return clientSecret;
      } else {
        throw Exception("Invalid response: Missing client secret");
      }
    } else {
      // Handle the error gracefully
      throw Exception("Error creating Payment Intent: ${response.body}");
    }
  }
}
