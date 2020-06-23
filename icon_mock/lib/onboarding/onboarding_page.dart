import 'dart:io';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_mock/animations/fade_animation.dart';
import 'package:icon_mock/chat/recent_chats_page.dart';
import 'package:icon_mock/model/user_model.dart';
import 'package:icon_mock/theme.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
      backgroundColor: greyLight,
      body: FocusAwareWidget(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildPageTitle(context),
            _buildUserDetails(context),
            _buildAvatar(context),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          heroTag: 'next',
          backgroundColor: brightGold,
          onPressed: () => _onContinueTap(),
          child: Icon(
            FontAwesomeIcons.arrowLeft,
            color: black,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Positioned(
      top: context.heightPx * .16,
      child: Container(
        height: context.heightPx * .33,
        width: context.widthPx * .91,
        child: Column(children: [
          SizedBox(height: 16),
          _avatar(),
          SizedBox(height: 16),
          _buildFirstName(),
          SizedBox(height: 16),
          _buildLastName(),
        ]),
        decoration: BoxDecoration(
          color: greyLight,
          boxShadow: [containerShadow],
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildUserDetails(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: context.heightPx * .48,
        child: Align(
          child: Column(
            children: <Widget>[
              _buildGender(),
              SizedBox(height: context.widthPx * .05),
              _buildAge(),
              SizedBox(height: context.widthPx * .05),
              _buildCelebToggle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageTitle(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Column(children: [
              SizedBox(height: 30),
              HebrewText('פרופיל', style: titleFont)
            ]),
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            height: context.heightPx * .35,
            color: greyDark),
      ],
    );
  }

  Widget _avatar() {
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
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: white,
                boxShadow: [containerShadow]),
            child: _image == null
                ? Icon(Icons.person, size: 50, color: brightGold)
                : CircleAvatar(
                    backgroundColor: brightGold,
                    backgroundImage: FileImage(_image),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstName() {
    return ShadowInputBox(
        controller: firstNameController,
        onChanged: (first) => userState.firstName = first,
        hintText: 'שם פרטי',
        width: context.widthPx * .8,
        maxLines: 1);
  }

  Widget _buildLastName() {
    return ShadowInputBox(
      controller: lastNameController,
      onChanged: (last) => userState.lastName = last,
      hintText: 'שם משפחה',
      width: context.widthPx * .8,
      maxLines: 1,
    );
  }

  Widget _buildGender() {
    return FadeAnimation(
      1.2,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GenderButton(
              title: 'זכר',
              isSelected: currentGender == Gender.male,
              icon: Icon(
                FontAwesomeIcons.male,
                size: 30,
              ),
              onTap: () => setState(() => currentGender = Gender.male)),
          GenderButton(
              title: 'נקבה',
              isSelected: currentGender == Gender.female,
              icon: Icon(
                FontAwesomeIcons.female,
                size: 30,
              ),
              onTap: () => setState(() => currentGender = Gender.female))
        ],
      ),
    );
  }

  Widget _buildAge() {
    return FadeAnimation(
      1.3,
      Column(
        children: <Widget>[
          HebrewText(
            'בחירת גיל',
            style: mediumFont.copyWith(color: white),
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
                style: hugeFont.copyWith(
                  color: brightGold,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCelebToggle() {
    return FadeAnimation(
      1.4,
      Center(
        child: Column(
          children: <Widget>[
            HebrewText(
              'האת אתה סלב? ',
              style: mediumFont.copyWith(color: white),
            ),
            SizedBox(height: context.widthPx * .03),
            ToggleSwitch(
                initialLabelIndex: 1,
                cornerRadius: 20,
                activeBgColor: brightGold,
                activeTextColor: black,
                inactiveBgColor: white,
                inactiveTextColor: black,
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

  void _onContinueTap() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty) {
      // continue to the chat
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => RecentChatsPage()));
    } else {
      context.showToast('שם פרטי ומשפחה חייבים להכיל פרטים');
    }
  }

  void _updateAge(DateTime date) {
    final currentYear = DateTime.now().year;
    final age = currentYear - date.year;
    setState(() => userState.age = age);
  }
}
