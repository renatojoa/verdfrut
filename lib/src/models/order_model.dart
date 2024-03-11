import 'dart:ffi';

import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/models/item_model.dart';

class OrderModel {

  List<CartItemModel> itens;
  String orderID;
  double finalPrice;
  DateTime orderDate;
  String orderStatus;
  DateTime dueDateOrderPay;
  String  qrCodeValue;
  


  OrderModel({
    required this.itens,
    required this.orderID,
    required this.finalPrice,
    required this.orderDate,
    required this.orderStatus,
    required this.dueDateOrderPay,
    required this.qrCodeValue
  });
}