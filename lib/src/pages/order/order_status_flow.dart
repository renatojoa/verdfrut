import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/custom_colors.dart';

class OrderStatusFlow extends StatelessWidget {
  final String orderStatus;
  final bool dueDateOrderPay;

  final Map<String, int> statusList = <String, int>{
    'pending_payment': 0,
    'refounded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };
  int get currentStatus => statusList[orderStatus]!;

  OrderStatusFlow(
      {super.key, required this.orderStatus, required this.dueDateOrderPay});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DotState(isActive: true, orderStatus: "Pedido Confimado"),
        const Padding(
          padding: EdgeInsets.only(left: 8, bottom: 2),
          child: _CustomDivider(),
        ),
        if (currentStatus == 1) ...{
          const _DotState(
              backgroundColor: Colors.amber,
              isActive: true,
              orderStatus: 'Pix estornado'),
        } else if (dueDateOrderPay) ...{
          const _DotState(
            isActive: true,
            orderStatus: 'Pagamento Vencido',
            backgroundColor: Colors.red,
          )
        } else ...{
          _DotState(isActive: currentStatus >= 2, orderStatus: 'Pagamento'),
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 2, bottom: 2),
            child: _CustomDivider(),
          ),

          _DotState(isActive: currentStatus >= 3, orderStatus: 'Preparando'),
          // ignore: equal_elements_in_set
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 2, bottom: 2),
            child: _CustomDivider(),
          ),

          _DotState(isActive: currentStatus >= 4, orderStatus: 'Envio'),
          // ignore: equal_elements_in_set
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 2, bottom: 2),
            child: _CustomDivider(),
          ),
          _DotState(isActive: currentStatus >= 5, orderStatus: 'Entregue')
        }
      ],
    );
  }
}

// ignore: camel_case_types
class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _DotState extends StatelessWidget {
  const _DotState(
      {required this.isActive,
      required this.orderStatus,
      this.backgroundColor});

  final bool isActive;
  final orderStatus;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomColors.customPurpleColor),
            color: isActive
                ? backgroundColor ?? CustomColors.customPurpleColor
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(Icons.check, color: Colors.white, size: 12)
              : const SizedBox.shrink(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              orderStatus,
              maxLines: 2,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
