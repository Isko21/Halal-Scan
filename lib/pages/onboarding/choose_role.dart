import 'package:flutter/material.dart';
import 'package:halal_scan/widgets/button.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../models/config.dart';
import '../../utility/common_functions.dart';
import '../../utility/stepper.dart';

class ChooseRoleView extends StatefulWidget {
  final Function() onNextClicked;
  const ChooseRoleView({required this.onNextClicked, super.key});

  @override
  State<ChooseRoleView> createState() => _ChooseRoleViewState();
}

class _ChooseRoleViewState extends State<ChooseRoleView> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 30),
          child: Column(
            children: [
              CustomStepper(
                totalStep: 3,
                completedStep: 2,
                selectedColor: CustomColor.buttonColor,
                backGroundColor: const Color(0xFFE0E0E0),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose \nyour role',
                  style: titleLarge().copyWith(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              HalalInfoTile(
                title: 'Scanner',
                description:
                    'You are helping the community scan and review more products.',
                isChecked: isChecked,
                onPressed: () => setState(() => isChecked = !isChecked),
              ),
              const SizedBox(height: 20),
              HalalInfoTile(
                title: 'Reviewer',
                description:
                    'You must know all the rules for reviewing goods and have a halal education.',
                isChecked: !isChecked,
                onPressed: () => setState(() => isChecked = !isChecked),
              ),
            ],
          ),
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

class HalalInfoTile extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final bool isChecked;
  const HalalInfoTile({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
    this.isChecked = false,
  });

  @override
  State<HalalInfoTile> createState() => _HalalInfoTileState();
}

class _HalalInfoTileState extends State<HalalInfoTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: widget.isChecked,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColor.veryLightBackColor,
                border: Border.all(color: CustomColor.darkBackColor),
                borderRadius: BorderRadius.circular(14)),
            margin: const EdgeInsets.only(top: 65, left: 4, right: 4),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Who is ${widget.title}?',
                  style: bodyLarge().copyWith(color: Colors.black),
                ),
                const SizedBox(height: 10),
                Text(widget.description),
              ],
            ),
          ),
        ),
        Card(
          color: widget.isChecked ? CustomColor.darkBackColor : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: CustomColor.darkBackColor, width: 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            onTap: widget.onPressed,
            contentPadding: const EdgeInsets.symmetric(horizontal: 25),
            title: SizedBox(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: titleMedium().copyWith(
                        color: widget.isChecked ? Colors.white : Colors.black),
                  ),
                  RoundCheckBox(
                    size: 30,
                    isChecked: widget.isChecked,
                    borderColor: CustomColor.buttonColor,
                    checkedColor: CustomColor.buttonColor,
                    onTap: (selected) {
                      widget.onPressed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
