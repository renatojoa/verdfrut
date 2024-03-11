import 'dart:math';

import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/app_data.dart';
import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/models/order_model.dart';
import 'package:greengroocer/src/pages/cart/cart_item_list.dart';
import 'package:greengroocer/src/pages/home/components/dialog_pix.dart';
import 'package:greengroocer/src/services/utils_services.dart';
import 'package:greengroocer/src/config/app_data.dart' as appData;

class CartScreenView extends StatefulWidget {
  const CartScreenView({super.key});

  @override
  State<CartScreenView> createState() => _CartScreenViewState();
}

class _CartScreenViewState extends State<CartScreenView> {
  final UtilsServices utilsServices = UtilsServices();

    void removeItemFromCart(CartItemModel cartItem){
    setState(() {
      appData.cartList.remove(cartItem);
    });
  }


  double cartTotalPrice(){
    
    double total = 0;

    for (var item in appData.cartList) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho', style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: CustomColors.customPurpleColor,
        
      ),
      backgroundColor: Colors.white,
      body: appData.cartList.isEmpty
            ? Center(
              
                // Se a quantidade de itens for zero, exiba um aviso
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const Text(
                      'Carrinho vazio',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey
                      ),
                      
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
              ]
                ),
            ) :
            Column(
              children: [
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartList.length, 
              itemBuilder: (
                
                BuildContext context, 
                int index){ 
                  return CartItemList(
                    cartItem: appData.cartList[index],
                    updatedQuantity: (quantity)
                    { 
                      if (quantity == 0) {
                        removeItemFromCart(appData.cartList[index]); 
                      } else {
                        setState(() => appData.cartList[index].qtd = quantity); 
                      }
                    }, remove: (CartItemModel ) {  },
                    );
               },
            )
            ), 
            const SizedBox( height: 50),
            
            Container(
              padding:  const EdgeInsets.all(16),
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
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Total geral',
                  style: TextStyle(
                    fontSize: 12,
                  )
                  ),
                  
                  Text(
                    utilsServices.priceToCurrency(cartTotalPrice()),
                    style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customWhitechColor,
                      fontWeight: FontWeight.bold,
                  )
                  ),
                  ElevatedButton(
                      style:  ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customPurpleColor,
                        side: BorderSide(
                          width: 2,
                          color: CustomColors.customWhitechColor,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                        )
                      ),
                      onPressed: () {
                        confimationOrderModal();
                      }, child: const Text('Concluir Pedido', style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),
                      )
                      ),
                ],
              ),
            ),
        ],


      ),

    );
  }

  Future<bool?> confimationOrderModal(){
    return showDialog<bool>(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text('Finalizar Compra'),
          content: const Text('Deseja Realmente concluir a compra?'),
          actions: [
            
            TextButton(onPressed: () {
              Navigator.pop(context, false);
            }, child: 
            const Text('Não')
            ),
             
            TextButton(
              onPressed: () {

                OrderModel myNewOrder = OrderModel(
                  itens: cartList, 
                  orderID: Random().nextInt(1000000000).toString(),
                  finalPrice: cartTotalPrice(), 
                  orderDate: DateTime.now(), 
                  orderStatus: 'pending_payment', 
                  dueDateOrderPay: DateTime.now().add(const Duration(days: 30)), 
                  qrCodeValue: Random().nextInt(1000000000).toString(),

                  );
                  orders.add(myNewOrder);
                  
                  Navigator.pop(context, true);
        
                  
                  showDialog(
                          context: context, 
                          builder: (_){
                            return QrCodeView(context, order: myNewOrder);
                  });
                  
              },
              child: const Text('Sim'),
            )
        
          ],
        );
      }
    );
  }

  processingOrder(){

  }
}