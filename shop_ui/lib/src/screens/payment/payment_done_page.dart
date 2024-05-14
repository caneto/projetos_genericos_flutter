import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../approot/app_root.dart';

class PaymentDonePage extends StatelessWidget {
  const PaymentDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CheckBoxIcon(
              iconSize: 56,
              innerPaddingSize: 56,
            ),
            const SizedBox(
              height: AppDefaults.margin * 2,
            ),

            /// Info
            Padding(
              padding: const EdgeInsets.all(AppDefaults.margin),
              child: Column(
                children: [
                  Text(
                    'Congratulations!!!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Payment is the transfer of money services in exchange product or Payments ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Actions
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get your reciept'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppRoot()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary.withOpacity(0.15),
                    ),
                    child: Text(
                      'Back To Home',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckBoxIcon extends StatelessWidget {
  const CheckBoxIcon({
    super.key,
    this.color = AppColors.primary,
    this.iconSize = 48,
    this.innerPaddingSize = 32,
  });

  final Color color;
  final double iconSize;
  final double innerPaddingSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(innerPaddingSize),
      decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 8,
          ),
          shape: BoxShape.circle),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.check_rounded,
          color: color,
          size: iconSize,
        ),
      ),
    );
  }
}
