import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/models/order_model.dart';
import 'package:greengroocer/src/services/utils_services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';

class QrCodeView extends StatelessWidget {
  QrCodeView(BuildContext context, {super.key, required this.order});

  final UtilsServices utilsServices = UtilsServices();
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text('Pagamento com pix',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            heightFactor: 1,
            child: SizedBox(
              height: 200,
              width: 200,
              child: QrImageView(
                data: order.qrCodeValue,
                size: 200,
                version: QrVersions.auto,
              ),
            ),
          ),
          // ignore: prefer_interpolation_to_compose_strings
          Text(
            'Vencimento: ${utilsServices.formatDateTime(order.dueDateOrderPay)}',
            style: const TextStyle(fontSize: 11),
          ),
          Text(
            'Total: ${utilsServices.priceToCurrency(order.finalPrice)}',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          Center(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(color: CustomColors.customGreenColor)),
              onPressed: () {
                _copiarTextoParaAreaDeTransferencia(context, order.qrCodeValue);
              },
              icon: Icon(
                Icons.copy,
                color: CustomColors.customPurpleColor,
                size: 16,
              ),
              label: Text(
                'Copiar Código Pix',
                style: TextStyle(
                  color: CustomColors.customPurpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _copiarTextoParaAreaDeTransferencia(context, String texto) {
  Clipboard.setData(ClipboardData(text: texto));
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: CustomColors.customGreenColor,
    content: const Text('Pix Copiado!'),
  ));
}
