import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContCart extends GetxController {
  int initialValue = 0;
  bool isLoading = false;

  Future<void> updateValue(int count) async {
    isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 2));
    initialValue = count;
    isLoading = false;
    update();
  }
}
