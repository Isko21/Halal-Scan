import 'package:flutter/material.dart';
import 'package:halal_scan/models/product.dart';

import '../../models/config.dart';
import '../../utility/common_functions.dart';
import '../../utility/stepper.dart';
import '../../widgets/button.dart';

class HalalInfoView extends StatefulWidget {
  final Function() onNextClicked;
  const HalalInfoView({required this.onNextClicked, super.key});

  @override
  State<HalalInfoView> createState() => _HalalInfoViewState();
}

class _HalalInfoViewState extends State<HalalInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomStepper(
              totalStep: 3,
              completedStep: 3,
              selectedColor: CustomColor.buttonColor,
              backGroundColor: const Color(0xFFE0E0E0),
            ),
            const SizedBox(height: 30),
            Text(
              'Product status \ninfo',
              style: titleLarge().copyWith(fontSize: 40, color: Colors.black),
            ),
            const SizedBox(height: 20),
            const HalalInfoWidget(
              title: 'Halal',
              description: 'You may use this product',
              status: CustomProductStatus.halal,
            ),
            const HalalInfoWidget(
              title: 'Haram',
              description: 'You should avoid this product',
              status: CustomProductStatus.haram,
            ),
            const HalalInfoWidget(
              title: 'Mushbooh',
              description: 'This product is doubtful',
              status: CustomProductStatus.mushbooh,
            ),
            const HalalInfoWidget(
              title: 'Unknown',
              description: 'This product is pending verification',
              status: CustomProductStatus.unknown,
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
        child: CustomElevatedButton(
            text: 'Next',
            onTap: () {
              widget.onNextClicked();
            },
            height: 55),
      ),
    );
  }
}

class HalalInfoWidget extends StatelessWidget {
  final String title;
  final String description;
  final CustomProductStatus status;
  const HalalInfoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.veryLightBackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.amberAccent,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(title, style: titleMedium()),
                  Text(description, style: bodyMedium()),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 13),
            decoration: BoxDecoration(
              color: getHalalColor(status),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30),
                topLeft: Radius.circular(100),
              ),
            ),
            height: 100,
            width: 70,
            child: Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(getHalalIcon(status), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}