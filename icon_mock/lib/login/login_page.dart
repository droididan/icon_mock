import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_mock/animations/fade_animation.dart';
import 'package:icon_mock/onboarding/onboarding_page.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/big_button.dart';
import 'package:icon_mock/widgets/focus_aware.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';
import 'package:icon_mock/extensions/size_ext.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

enum LoginState {
  phone,
  sms,
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double opacity = 0.0;
  final _phoneController = TextEditingController();
  final _smsController = TextEditingController();
  LoginState state = LoginState.phone;

  bool hideHeader = false;

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
        onChange: (bool visible) => setState(() => hideHeader = visible));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: FocusAwareWidget(
          child: Stack(children: [
            ListView(
              children: <Widget>[
                _header(context, width),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: context.heightPx * .06),
                      _phoneTitle(),
                      SizedBox(height: context.heightPx * .02),
                      _phone(),
                      SizedBox(height: context.heightPx * .01),
                      _sms(),
                    ],
                  ),
                ),
              ],
            ),
            _nextButton(),
          ]),
        ),
      ),
    );
  }

  Align _nextButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: BigButton(
            onTap: () => _onContinueTap(),
            title: state == LoginState.phone ? "שלח" : 'המשך'));
  }

  Widget _phoneTitle() => FadeAnimation(
      1.7,
      Align(
          alignment: Alignment.centerRight,
          child: HebrewText(
            "מה הנייד שלך?",
            style: mediumFont.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          )));

  Widget _header(BuildContext context, double width) {
    final height = context.heightPx * .45;
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: hideHeader ? context.heightPx * .15 : height,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: OvalShape(),
            child: Positioned(
                height: height,
                width: width,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/black_background.jpg'),
                          fit: BoxFit.fill)),
                )),
          ),
          Positioned(
            top: context.heightPx * .16,
            left: 10,
            height: height,
            width: width,
            child: FadeAnimation(
              1.5,
              Text(
                "ICON",
                style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(color: gold, letterSpacing: .5, fontSize: 70),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onContinueTap() {
    final phone = _phoneController.text;
    final sms = _smsController.text;
    // check for valid phone (in real life I want to have regex here)
    if (state == LoginState.phone) {
      if (_phoneValid(phone)) {
        setState(() {
          state = LoginState.sms;
          opacity = 1.0;
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
          decoration: fieldShadow,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[200]))),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: TextField(
                    autofocus: false,
                    style: GoogleFonts.lato(),
                    controller: _phoneController,
                    maxLines: 1,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 25),
                        icon: Icon(Icons.phone_android, color: Colors.black),
                        border: InputBorder.none,
                        counterText: '',
                        hintText: "054-5554433",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _sms() => Column(children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 550),
          opacity: opacity,
          child: Container(
            decoration: fieldShadow,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[200]))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: TextField(
                      autofocus: false,
                      maxLines: 1,
                      controller: _smsController,
                      maxLength: 6,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(right: 25),
                          icon: Icon(Icons.sms, color: Colors.black),
                          border: InputBorder.none,
                          counterText: '',
                          hintText: "11-22-33",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
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
                style: smallFont.copyWith(fontSize: 14),
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
