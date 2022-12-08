import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utility/common_functions.dart';
import '../../widgets/button.dart';
import '../config.dart';

class ReportWrongImage extends StatelessWidget {
  const ReportWrongImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 30,
          right: 30,
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
              'Product image:',
              style: bodyMedium(),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: CustomColor.lightBackColor),
            ),
            height: 200,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.photo_camera_solid,
                  size: 40,
                ),
                onPressed: () {},
              ),
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
            onTap: () {},
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
