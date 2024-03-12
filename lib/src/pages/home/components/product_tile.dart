// ignore_for_file: must_be_immutable

import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/models/item_model.dart';
import 'package:greengroocer/src/pages/product/product_details_screen.dart';
import 'package:greengroocer/src/services/utils_services.dart';
import 'package:greengroocer/src/config/app_data.dart' as appData;

class ProductTile extends StatelessWidget {
  final ItemModel item;

  final void Function(GlobalKey) cartAnimationMathod;
  final GlobalKey imageGk = GlobalKey();
  int cartQuantityItems;
  GlobalKey<CartIconKey> globalKeyCartItems;

  ProductTile(
      {super.key,
      required this.item,
      required this.cartAnimationMathod,
      required this.cartQuantityItems,
      required this.globalKeyCartItems});

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //conteudo
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (c) {
                return ProductDetails(item: item);
              }),
            );
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //image
                    Expanded(
                      child: Hero(
                        tag: item.imageUrl,
                        child: Container(
                          key: imageGk,
                          child: Image.asset(
                            item.imageUrl,
                          ),
                        ),
                      ),
                    ),
                    //name
                    Text(
                      item.itemName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //price
                    Row(
                      children: [
                        Text(
                          utilsServices.priceToCurrency(item.price),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: CustomColors.customPurpleColor),
                        ),
                        Text(
                          '/${item.unit}',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
        //carrinho
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15), topRight: Radius.circular(20)),
            child: Material(
              child: InkWell(
                onTap: () {
                  cartAnimationMathod(imageGk);
                  cartQuantityItems = countCartItem();
                  globalKeyCartItems.currentState!
                      .runCartAnimation((++cartQuantityItems).toString());
                  addProductToOrder(item);
                  return;
                },
                child: Ink(
                    height: 40,
                    width: 35,
                    decoration: BoxDecoration(
                      color: CustomColors.customWhitechColor,
                    ),
                    child: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.red,
                      size: 20,
                      shadows: [
                        BoxShadow(color: Colors.grey, blurRadius: 2),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool addProductToOrder(ItemModel item) {
    bool itemExists = false;
    for (int i = 0; i < appData.cartList.length; i++) {
      if (appData.cartList[i].item.itemName == item.itemName) {
        appData.cartList[i].qtd += 1;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      appData.cartList.add(CartItemModel(item: item, qtd: 1));
    }
    return true;
  }

  int countCartItem() {
    int count = 0;
    for (int i = 0; i < appData.cartList.length; i++) {
      count = appData.cartList[i].qtd + count;
    }
    return count;
  }
}
