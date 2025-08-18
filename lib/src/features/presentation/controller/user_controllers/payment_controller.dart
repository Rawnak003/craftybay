import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  Future<void> payment() async {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        multi_card_name: "visa, master, bkash, nagad",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "rawna689c6ee1c8062",
        store_passwd: "rawna689c6ee1c8062@ssl",
        total_amount: 71217.00,
        tran_id:  generateRandomString(10),
      ),
    );


    final response = await sslcommerz.payNow();

    if (response.status == 'VALID') {
      debugPrint('Payment Successful');
    } else if (response.status == 'FAILED') {
      debugPrint('Payment Failed');
    } else if (response.status == 'CLOSED') {
      debugPrint('Payment Closed');
    } else {
      debugPrint('Something Went Wrong');
    }
  }

  String generateRandomString(int length) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }
}
