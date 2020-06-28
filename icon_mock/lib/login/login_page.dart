import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:icon_mock/animations/fade_animation.dart';
import 'package:icon_mock/onboarding/onboarding_page.dart';
import 'package:icon_mock/theme.dart';

import 'package:icon_mock/widgets/focus_aware.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/extensions/context_ext.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:lottie/lottie.dart';

enum LoginState {
  phone,
  sms,
}
final spacing = SizedBox(height: 36);
final smallSpacing = SizedBox(height: 8);
final radius = Radius.circular(30);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double opacity = 0.0;
  final _phoneController = TextEditingController();
  final _smsController = TextEditingController();
  LoginState state = LoginState.phone;
  double loaderLocation = 200.0;
  bool loading = false;

  @override
  void initState() {
    setStatusColor();
    KeyboardVisibilityNotification().addNewListener(
        onChange: (bool visible) => setState(() => loading = visible));
    super.initState();
  }

  setStatusColor() async {
    await FlutterStatusbarcolor.setStatusBarColor(greyDark);
  }

  void loaderPosition(bool visible) {
    if (!mounted) return;
    setState(() => loaderLocation = visible ? 50 : 200);
  }

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(horizontal: 42, vertical: 42);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: greyDark,
        body: FocusAwareWidget(
          child: Stack(children: [
            _buildIconTitle(),
            _buildProgressBar(context),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                    boxShadow: [containerShadow],
                    borderRadius:
                        BorderRadius.only(topLeft: radius, bottomLeft: radius),
                    color: greyLight),
                height: context.heightPx * .68,
                width: context.widthPx * .94,
                child: Stack(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    HebrewText('ברוך הבא!',
                        style: hugeFont.copyWith(color: white)),
                    spacing,
                    _phoneTitle(),
                    smallSpacing,
                    _phone(),
                    spacing,
                    _sms(),
                  ]),
                  Positioned(
                    bottom: 0,
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
                ]),
              ),
            ),
            if (!loading)
              Align(
                alignment: Alignment.bottomCenter,
                child: PrivacyAndTerms(),
              ),
          ]),
        ),
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context) {
    return Visibility(
      visible: !loading,
      child: AnimatedPositioned(
        duration: Duration(milliseconds: 550),
        bottom: loaderLocation,
        left: 0,
        child: Container(
            height: context.heightPx * .42,
            child: Lottie.asset('assets/animations/login_background.json')),
      ),
    );
  }

  Widget _buildIconTitle() {
    return Padding(
      padding: const EdgeInsets.all(42.0),
      child: Text(
        'ICON',
        style: hugeFont.copyWith(fontSize: 40, color: brightGold),
      ),
    );
  }

  Widget _phoneTitle() => FadeAnimation(
      1.7,
      Align(
          alignment: Alignment.centerRight,
          child: HebrewText(
            "מה הנייד שלך?",
            style:
                mediumFont.copyWith(fontWeight: FontWeight.bold, color: white),
            textAlign: TextAlign.end,
          )));

  Widget _smsTitle() => FadeAnimation(
      1.7,
      Align(
          alignment: Alignment.centerRight,
          child: HebrewText(
            "מה הקוד שקיבלת?",
            style:
                mediumFont.copyWith(fontWeight: FontWeight.bold, color: white),
            textAlign: TextAlign.end,
          )));

  void _onContinueTap() {
    final phone = _phoneController.text;
    final sms = _smsController.text;
    // check for valid phone (in real life I want to have regex here)
    if (state == LoginState.phone) {
      if (_phoneValid(phone)) {
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
          state = LoginState.sms;
          opacity = 1.0;
          loaderPosition(true);

          Future.delayed(Duration(seconds: 4), () => loaderPosition(false));
        });
      } else {
        // show phone number is invalid
        context.showToast("מספר טלפון לא תקין");
      }
    } else if (state == LoginState.sms) {
      if (_smsValid(sms)) {
        Navigator.pop(context);
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => OnboardingPage()),
        );
      } else {
        context.showToast('טעות בקוד, נסה שוב');
      }
    }
  }

  bool _smsValid(String sms) => sms == "123456";

  bool _phoneValid(String phone) => phone.length > 9;

  Widget _phone() {
    return FadeAnimation(
        1.8,
        Container(
          height: 48,
          decoration: fieldShadow,
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: false,
                style: mediumFont.copyWith(fontSize: 18),
                controller: _phoneController,
                maxLines: 1,
                maxLength: 11,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    suffixIcon:
                        Icon(FontAwesomeIcons.mobile, color: brightGold),
                    border: InputBorder.none,
                    counterText: '',
                    hintText: "054-5554433",
                    hintStyle: TextStyle(color: greyLight.withOpacity(.5))),
              ),
            ],
          ),
        ));
  }

  Widget _sms() => Column(children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 550),
          opacity: opacity,
          child: Column(
            children: <Widget>[
              _smsTitle(),
              smallSpacing,
              Container(
                height: 48,
                decoration: fieldShadow,
                child: Column(
                  children: <Widget>[
                    TextField(
                        style: mediumFont.copyWith(fontSize: 20),
                        autofocus: false,
                        maxLines: 1,
                        controller: _smsController,
                        maxLength: 6,
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            suffixIcon:
                                Icon(FontAwesomeIcons.sms, color: brightGold),
                            border: InputBorder.none,
                            counterText: '',
                            hintText: "112233",
                            hintStyle:
                                TextStyle(color: greyLight.withOpacity(.5)))),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.heightPx * .01),
        AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: opacity,
          child: MaterialButton(
              onPressed: () {},
              child: HebrewText(
                'שלח שוב',
                style: smallFont.copyWith(fontSize: 14, color: white),
              )),
        ),
      ]);
}

class OvalShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'בכניסה למערכת אישרת את ',
              style: smallFont.copyWith(color: Colors.grey)),
          TextSpan(
              text: 'תנאי השימוש',
              style: smallFont.copyWith(
                  color: white, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () async {}),
          TextSpan(text: ' ו', style: smallFont.copyWith(color: Colors.grey)),
          TextSpan(
              text: 'מדיניות הפרטיות',
              style: smallFont.copyWith(
                  color: white, decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()..onTap = () async {}),
        ]),
      ),
    );
  }
}
