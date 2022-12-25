import 'package:flutter/cupertino.dart';

class CustomStepper extends StatelessWidget {
  final int totalStep;
  final int completedStep;
  final Color selectedColor;
  final Color backGroundColor;
  const CustomStepper(
      {Key? key,
      this.totalStep = 4,
      required this.selectedColor,
      required this.backGroundColor,
      this.completedStep = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index;
    return SizedBox(
      height: 15,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (index = 0; index < totalStep; index++)
            Container(
              width: (MediaQuery.of(context).size.width - 70) / totalStep,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color:
                    (index < completedStep) ? selectedColor : backGroundColor,
              ),
            ),
        ],
      ),
    );
  }
}
