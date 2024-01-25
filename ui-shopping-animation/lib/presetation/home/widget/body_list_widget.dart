import 'package:flutter/material.dart';
import 'package:shopping/models/mode_shopping.dart';
import 'package:shopping/presetation/home/controller_home.dart';
import 'package:shopping/utils/app_color.dart';

import '../../../services/utils_services.dart';

class BodyListWidget extends StatelessWidget {
  final ControllerHome controller;
  
  BodyListWidget({super.key, required this.controller});

  final UtilsServices utilsServices = UtilsServices();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          padding: const EdgeInsets.all(0.0),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.model.length,
            itemBuilder: (BuildContext context, int index) {
              final ModeShopping model = controller.model[index];
              return Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Novo Lançamento',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.backgroundColor),
                                ),
                                Text(
                                  model.name,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: AppColor.backgroundColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  child: Text(
                                    utilsServices.priceToCurrency(model.price),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.backgroundColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.backgroundColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 120,
                                    height: 60,
                                    child: const Center(
                                      child: Text(
                                        'Comprar Agora',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Flexible(child: Image.asset(model.image)),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.backgroundColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        width: 40,
                        height: 35,
                        child: Center(
                          child: Text(
                            model.size.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
