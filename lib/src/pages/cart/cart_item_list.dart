import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/cart_item_model.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/pages/widgets/quantity_widget.dart';
import 'package:greengroocer/src/services/utils_services.dart';

class CartItemList extends StatefulWidget {
  CartItemList({super.key, required this.cartItem, required this.updatedQuantity, required this.remove});
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  final Function(int) updatedQuantity;

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: ListTile(
        //image
        leading: Image.asset(
          widget.cartItem.item.imageUrl,
          height: 60,
          width: 60,
          ),

        //title
        title: Text(widget.cartItem.item.itemName),
        subtitle: 
        Text(
          '${utilsServices.priceToCurrency(widget.cartItem.item.price * widget.cartItem.qtd)}/ ${widget.cartItem.item.unit}', 
          style: TextStyle(
          color: CustomColors.customPurpleColor,
          fontWeight:  FontWeight.bold,
          fontSize: 12,
          ),
          ),
        //qtd
        trailing: QuantityWidget(
          qtd: widget.cartItem.qtd, 
          productType: widget.cartItem.item.unit, 
          result: widget.updatedQuantity,
        isRemovable: true,
        ),
      ),
    );
  }
}
