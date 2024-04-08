import 'dart:math';

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/app_data.dart' as appData;
import 'package:greengroocer/src/config/app_data.dart';
import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/models/order_model.dart';
import 'package:greengroocer/src/pages/cart/cart_item_list.dart';
import 'package:greengroocer/src/pages/home/components/dialog_pix.dart';
import 'package:greengroocer/src/pages/order/order_tab.dart';
import 'package:greengroocer/src/repository/cart_repository.dart';
import 'package:greengroocer/src/services/utils_services.dart';

class CartScreenView extends StatefulWidget {
  CartScreenView(
      {super.key, required this.controller, required this.cartRepository});
  PageController controller;
  CartRepository cartRepository;
  List<CartItemModel> novo = [];

  @override
  State<CartScreenView> createState() => _CartScreenViewState();
}

class _CartScreenViewState extends State<CartScreenView> {
  final UtilsServices utilsServices = UtilsServices();
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();

  @override
  void dispose() {
    // Cancela cualquier temporizador o detiene cualquier animación aquí
    // Esto asegura que no se realicen actualizaciones de estado después de que el widget haya sido eliminado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomColors.customPurpleColor,
      ),
      backgroundColor: Colors.white,
      body: widget.cartRepository.cartList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Carrinho vazio',
                    style: TextStyle(fontSize: 30, color: Colors.grey),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/emptyCart.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartRepository.cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartItemList(
                        cartItem: widget.cartRepository.cartList[index],
                        updatedQuantity: (quantity) {
                          if (quantity == 0) {
                            widget.cartRepository.removeItemCart(
                                widget.cartRepository.cartList[index]);
                          } else {
                            widget.cartRepository
                                .updateCartItemQuantity(index, quantity);
                          }
                        },
                        remove: (CartItemModel) {},
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('Total geral', style: TextStyle(fontSize: 12)),
                      Text(
                        utilsServices.priceToCurrency(
                            widget.cartRepository.cartTotalPrice()),
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.customPurpleColor,
                          side: BorderSide(
                            width: 2,
                            color: CustomColors.customPurpleColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          confimationOrderModal();
                        },
                        child: const Text(
                          'Concluir Pedido',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Future<void> confimationOrderModal() async {
    if (!mounted) return;
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Finalizar Compra'),
          content: const Text('Deseja Realmente concluir a compra?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                widget.novo = widget.cartRepository.cartList;
                final myNewOrder = OrderModel(
                  itens: widget.novo,
                  orderID: Random().nextInt(1000000000).toString(),
                  finalPrice: widget.cartRepository.cartTotalPrice(),
                  orderDate: DateTime.now(),
                  orderStatus: 'pending_payment',
                  dueDateOrderPay: DateTime.now().add(const Duration(days: 30)),
                  qrCodeValue: Random().nextInt(1000000000).toString(),
                );
                orders.add(myNewOrder);
                // widget.cartRepository.clearCart();

                Navigator.pop(context);

                widget.controller.jumpToPage(2);

                showDialog(
                  context: context,
                  builder: (_) {
                    return QrCodeView(context, order: myNewOrder);
                  },
                );
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
