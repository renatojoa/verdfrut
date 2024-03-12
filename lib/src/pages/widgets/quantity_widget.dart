import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuantityWidget extends StatelessWidget {
  int qtd;
  String productType;
  final Function(int quantity) result;
  final bool isRemovable;

  QuantityWidget(
      {super.key,
      required this.qtd,
      required this.productType,
      required this.result,
      this.isRemovable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 2,
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _QtdComponent(
              splashColor: Colors.red,
              color:
                  !isRemovable || qtd > 1 ? Colors.grey : Colors.red.shade100,
              icon:
                  !isRemovable || qtd > 1 ? Icons.remove : Icons.delete_forever,
              onPressed: () {
                if (qtd == 0) {
                  return;
                }
                int resultCount = qtd - 1;
                result(resultCount);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
              ),
              child: Text(
                '$qtd $productType',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            _QtdComponent(
              splashColor: Colors.green,
              color: Colors.grey,
              icon: Icons.add,
              onPressed: () {
                int resultCount = qtd + 1;
                result(resultCount);
              },
            )
          ],
        ));
    //Valor
  }
}

class _QtdComponent extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;
  final splashColor;

  const _QtdComponent({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        splashColor: splashColor,
        onTap: onPressed,
        child: Ink(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
