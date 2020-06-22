import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/animations/fade_animation.dart';
import 'package:icon_mock/chat/recent_chats_page.dart';
import 'package:icon_mock/model/user_model.dart';
import 'package:icon_mock/theme.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:icon_mock/widgets/big_button.dart';
import 'package:icon_mock/widgets/focus_aware.dart';
import 'package:icon_mock/widgets/gender_button.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/widgets/input.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final picker = ImagePicker();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  Gender currentGender = Gender.male;

  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: FocusAwareWidget(
        child: Stack(children: [
          ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: context.widthPx * .1),
              Container(height: 100, width: 100, child: _buidUserPhoto()),
              SizedBox(height: context.widthPx * .05),
              _buildFirstName(),
              _buildLastName(),
              SizedBox(height: context.widthPx * .05),
              _buildGender(),
              SizedBox(height: context.widthPx * .05),
              _buildAge(),
              SizedBox(height: context.widthPx * .05),
              _buildCelebToggle(),
            ],
          ),
          _continueButton(),
        ]),
      ),
    );
  }

  Widget _buidUserPhoto() {
    return FadeAnimation(
      1.0,
      GestureDetector(
        onTap: () async {
          final pickedFile = await picker.getImage(source: ImageSource.gallery);

          setState(() {
            _image = File(pickedFile.path);
          });
        },
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: brightGold,
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ]),
            child: Container(
              height: 95,
              width: 95,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: _image == null
                  ? Icon(Icons.camera_alt, size: 40, color: Colors.black)
                  : CircleAvatar(
                      backgroundColor: brightGold,
                      backgroundImage: FileImage(_image),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstName() {
    return FadeAnimation(
      1.2,
      ShadowInputBox(
          controller: firstNameController,
          onChanged: (first) => userState.firstName = first,
          padding: columnPadding,
          hintText: 'שם פרטי',
          width: context.widthPx * .8,
          maxLines: 1),
    );
  }

  Widget _buildLastName() {
    return FadeAnimation(
      1.3,
      ShadowInputBox(
        controller: lastNameController,
        onChanged: (last) => userState.lastName = last,
        padding: columnPadding,
        hintText: 'שם משפחה',
        maxLines: 1,
      ),
    );
  }

  Widget _buildGender() {
    return FadeAnimation(
      1.4,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GenderButton(
              title: 'זכר',
              isSelected: currentGender == Gender.male,
              asset: '',
              onTap: () => setState(() => currentGender = Gender.male)),
          GenderButton(
              title: 'נקבה',
              isSelected: currentGender == Gender.female,
              asset: '',
              onTap: () => setState(() => currentGender = Gender.female))
        ],
      ),
    );
  }

  Widget _buildAge() {
    return FadeAnimation(
      1.5,
      Column(
        children: <Widget>[
          HebrewText(
            'גיל',
            style: mediumFont,
          ),
          MaterialButton(
              onPressed: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    theme: DatePickerTheme(
                        doneStyle: mediumFont.copyWith(color: gold)),
                    minTime: DateTime(1920, 1, 1),
                    maxTime: DateTime(2010, 1, 1),
                    onChanged: (date) => _updateAge(date),
                    onConfirm: (date) => _updateAge(date),
                    currentTime: DateTime.now());
              },
              child: Text(
                userState?.age?.toString() ?? '20',
                style: hugeFont,
              )),
        ],
      ),
    );
  }

  Widget _buildCelebToggle() {
    return FadeAnimation(
      1.6,
      Center(
        child: Column(
          children: <Widget>[
            HebrewText(
              'האת אתה סלב? ',
              style: mediumFont,
            ),
            SizedBox(height: context.widthPx * .03),
            ToggleSwitch(
                initialLabelIndex: 0,
                cornerRadius: 20,
                activeBgColor: brightGold,
                activeTextColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveTextColor: Colors.white,
                labels: ['כן', 'לא'],
                icons: [FontAwesomeIcons.check, FontAwesomeIcons.times],
                onToggle: (index) {
                  print('switched to: $index');
                }),
          ],
        ),
      ),
    );
  }

  Widget _continueButton() {
    return FadeAnimation(
        2.0,
        Align(
            alignment: Alignment.bottomCenter,
            child: BigButton(
                onTap: () {
                  if (firstNameController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty) {
                    // continue to the chat
                    Navigator.pop(context);
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (_) => RecentChatsPage()));
                  } else {
                    context.showToast('שם פרטי ומשפחה חייבים להכיל פרטים');
                  }
                },
                title: 'המשך')));
  }

  void _updateAge(DateTime date) {
    final currentYear = DateTime.now().year;
    final age = currentYear - date.year;
    setState(() => userState.age = age);
  }
}
