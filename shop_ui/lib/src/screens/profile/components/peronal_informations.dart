import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'info_row.dart';

class PeronalInformations extends StatelessWidget {
  const PeronalInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          const InfoRow(field: 'Name:', value: 'Usuario App'),
          const InfoRow(field: 'Email:', value: 'usuario@gmail.com'),
          const InfoRow(field: 'Location:', value: 'RJ'),
          const InfoRow(field: 'Zip Code:', value: '20.000-000'),
          const InfoRow(field: 'Phone Number:', value: '(11) 33223-3020'),
        ],
      ),
    );
  }
}
