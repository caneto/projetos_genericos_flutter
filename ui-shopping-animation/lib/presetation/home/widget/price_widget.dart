import 'package:flutter/material.dart';
import 'package:shopping/models/mode_shopping.dart';

import '../../../services/utils_services.dart';

class PriceWidget extends StatelessWidget {
  final ModeShopping shopping;

  PriceWidget({super.key, required this.shopping});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Text(
      utilsServices.priceToCurrency(shopping.price),
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
