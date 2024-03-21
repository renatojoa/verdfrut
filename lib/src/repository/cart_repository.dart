import 'dart:ffi';

import 'package:get/utils.dart';
import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/models/item_model.dart';

class CartRepository {
  List<CartItemModel> cartList = [];

  void removeItemCart(CartItemModel myItem) {
    cartList.remove(myItem);
    print(cartList);
    print(getCount());
  }

  void addItemCart(ItemModel myItem) {
    print(cartList);
    bool itemFound = false;

    for (int i = 0; i < cartList.length; i++) {
      if (cartList[i].item == myItem) {
        cartList[i].qtd += 1;
        itemFound = true;
        break;
      }
    }
    if (!itemFound) {
      cartList.add(CartItemModel(item: myItem, qtd: 1));
    }
    print(getCount());
  }

  void clearCart() {
    cartList.clear();
  }

  double cartTotalPrice() {
    double total = 0;

    for (var part in cartList) {
      total += part.qtd * part.item.price;
    }
    return total;
  }

  void updateCartItemQuantity(int index, int quantity) {
    cartList[index].qtd = quantity;
  }

  int getCount() {
    // Inicializa o contador como 0.
    int countMyCart = 0;

    // Usa fold para somar os valores da propriedade 'qtd' de todos os elementos em cartList.
    countMyCart = cartList.fold(
        0, (previousValue, element) => previousValue + element.qtd);

    // Retorna o contador.
    return countMyCart;
  }
}
