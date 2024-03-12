import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/app_data.dart' as appData;
import 'package:greengroocer/src/pages/order/order_item.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Pedidos',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: appData.orders.isEmpty
            ? Center(
                // Se a quantidade de itens for zero, exiba um aviso
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Nenhum pedido realizado',
                        style: TextStyle(fontSize: 30, color: Colors.grey),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/fruit/sad.jpg',
                            height: 600,
                            width: 600,
                          ),
                        ),
                      ),
                    ]),
              )
            : Column(children: [
                Expanded(
                    child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: appData.orders.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return OrderItem(orderItem: appData.orders[index]);
                  },
                ))
              ]));
  }
}
