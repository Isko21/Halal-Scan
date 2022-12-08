import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../utility/common_functions.dart';
import '../../widgets/button.dart';

class ReportWrongStatus extends StatelessWidget {
  const ReportWrongStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String value = 'Halal';
    return StatefulBuilder(
      builder: (c, s) => Padding(
        padding: EdgeInsets.only(
            right: 30,
            left: 30,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/line_icon.png'),
            ),
            Text(
              'Notice something wrong?',
              style: bodyLarge(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Halal status:',
                  style: bodyMedium(),
                ),
                const Spacer(),
                DropdownButton<String>(
                    icon: Transform.rotate(
                      angle: math.pi / 2,
                      child: const Icon(Icons.arrow_forward_ios, size: 10),
                    ),
                    value: value,
                    items: [
                      DropdownMenuItem<String>(
                          value: 'Halal',
                          child: Text(
                            'Halal',
                            style: titleMedium()
                                .copyWith(fontWeight: FontWeight.normal),
                          )),
                      DropdownMenuItem<String>(
                          value: 'Haram',
                          child: Text(
                            'Haram',
                            style: titleMedium()
                                .copyWith(fontWeight: FontWeight.normal),
                          )),
                      DropdownMenuItem<String>(
                          value: 'Mushbooh',
                          child: Text(
                            'Mushbooh',
                            style: titleMedium()
                                .copyWith(fontWeight: FontWeight.normal),
                          )),
                    ],
                    onChanged: (val) => s(() => value = val!))
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'As soon as we update the product information, you will be notified via a notification.',
              style: bodyMedium(),
            ),
            const SizedBox(height: 10),
            CustomElevatedButton(
              text: 'Send',
              onTap: () {},
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
