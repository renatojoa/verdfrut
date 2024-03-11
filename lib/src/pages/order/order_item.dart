import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/models/order_model.dart';
import 'package:greengroocer/src/pages/home/components/dialog_pix.dart';
import 'package:greengroocer/src/pages/order/order_status_flow.dart';
import 'package:greengroocer/src/services/utils_services.dart';

class OrderItem extends StatefulWidget {
  OrderItem({super.key, required this.orderItem});
  
  final OrderModel orderItem;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
              child: Theme(
                
                data: Theme.of(context).copyWith(
                  dividerColor: const Color.fromARGB(0, 240, 161, 161)
                ),
                child: ExpansionTile(
                  initiallyExpanded: widget.orderItem.orderStatus == 'pending_payment',
                  title: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Pedido: ${widget.orderItem.orderID}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customPurpleColor
                        ),
                      ),
                      Text(utilsServices.formatDateTime(widget.orderItem.orderDate),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      
                      ),
                    ]
                    ),
                  childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: 
                              SizedBox(
                                height: 150,
                                child: ListView(
                                  children: 
                                    widget.orderItem.itens.map((orderItem) {
                                      return Row(
                                        children: [                                       
                                          Text(
                                          '${orderItem.qtd} ${orderItem.item.unit}'
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Text(
                                              orderItem.item.itemName
                                              ),
                                            ),
                                          ),
                                            Padding(
                                                      
                                              padding: const EdgeInsets.only(right: 10),
                                              child: Text(
                                                utilsServices.priceToCurrency(orderItem.totalPrice()), textAlign: TextAlign.end, 
                                              ),
                                            ),  
                                        ],
                                      );
                                    }).toList(),
                                ),
                          )
                          ),
                          
                            
                          //coluna
                            VerticalDivider(
                              color: Colors.grey.shade300,
                              thickness: 2,
                              width: 8,
                            ),
                            //fluxo pedido
                            Expanded(
                              flex: 2,
                              child: 
                                OrderStatusFlow(
                                  dueDateOrderPay: widget.orderItem.dueDateOrderPay.isBefore(DateTime.now()), 
                                  orderStatus: widget.orderItem.orderStatus,)
                            ),
                        
            
              
                          ],
                          
                    
                          
                        ),
                              
                        
                        
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Total ', 
                              style: TextStyle(
                              fontWeight:  FontWeight.bold,
                              fontSize: 14,
                              ),
                              ),
                              TextSpan(
                                text: utilsServices.priceToCurrency(widget.orderItem.finalPrice), 
                                style: const TextStyle(
                                fontSize: 15,
                                ),
                              ),
                          ],
                        ),
                   ),
                  Visibility(
                    visible: widget.orderItem.orderStatus == 'pending_payment',
                    child: ElevatedButton.icon(             
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customGreenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (_){
                            return QrCodeView(context, order: widget.orderItem);
                        }
                        );
                      },
                      icon: const Icon(Icons.pix, color: Colors.white,), 
                      label: const Text('Ver QR Code Pix',
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),           
                ],
                    
                    
                    
                ),
          
              ),
              
           
          );
      
  

  }
  }

