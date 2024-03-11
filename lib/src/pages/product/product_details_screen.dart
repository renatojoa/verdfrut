import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/models/item_model.dart';
import 'package:greengroocer/src/pages/widgets/quantity_widget.dart';
import 'package:greengroocer/src/services/utils_services.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key, required this.item});

  ItemModel item;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  UtilsServices utilsServices = UtilsServices();

  int ammounTobuy = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(tag: widget.item.imageUrl, child: Image.asset(widget.item.imageUrl))
              ),
              Expanded(
                child: Container(
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                
                    
                  
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                //Nome - Quantidade
                Row(
                  children: [
                                         
                    Expanded(
                      child: Text(
                      widget.item.itemName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                      ),
                    ),
                     QuantityWidget(
                      productType: widget.item.unit, 
                      qtd: ammounTobuy,
                      result: (quantity){
                       setState(() {
                         ammounTobuy = quantity;
                       }); 
                      }
                      ),
                    // QuantityWidget(qtd: ammounTobuy)
                  ],
                ),
          
                //Preco
                Row(
                  children: [
                    Text(
                      utilsServices.priceToCurrency(widget.item.price),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: CustomColors.customGreenColor
                    ),
                    ),
                    Text('/${widget.item.unit}', style: TextStyle(
                    color: Colors.grey.shade500,
                    fontWeight:  FontWeight.bold,
                    fontSize: 12,
                    
                    
                    ),
                    ),
                  ],
                ),
                //descricao
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        widget.item.description,
                        style: const TextStyle(
                          height: 1.5
                        ),
                        ),
                    ),
                  ),
                ),
                SizedBox(
                  height:  55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.customWhitechColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    onPressed: () {
                       Navigator.of(context).pop();
                    },
                      
                  child: const Text(
                    '+',
                    style: TextStyle(
                    color: Colors.white
            
                  ),
                  )
                  ),
                )
                
                
              ]
              ),
              )
              )
            
            ],
          
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(onPressed:() {
                Navigator.of(context).pop();
              }, 
                icon: const Icon(
                  Icons.arrow_back_ios
                )
              ),
            ),
          )
        ],
      )
          
          );
  }    
}