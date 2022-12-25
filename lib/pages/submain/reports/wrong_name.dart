import 'package:flutter/material.dart';

import '../../../utility/common_functions.dart';
import '../../../widgets/button.dart';
import '../../../models/config.dart';

class ReportWrongName extends StatelessWidget {
  const ReportWrongName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Product name:',
              style: bodyMedium(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColor.lightBackColor),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Type product name here',
              hintStyle: bodyMedium().copyWith(fontSize: 14),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'As soon as we update the product information, you will be notified via a notification.',
            style: bodyMedium(),
          ),
          const SizedBox(height: 10),
          CustomElevatedButton(
            text: 'Send',
            height: 45,
            onTap: () {},
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
