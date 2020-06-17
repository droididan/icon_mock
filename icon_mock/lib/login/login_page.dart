import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_mock/animations/fade_animation.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/hebrew_input_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double opacity = 0.0;
  final _phoneController = TextEditingController();
  final _smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _header(width),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 70),
                    _phoneTitle(),
                    SizedBox(height: 16),
                    _phone(),
                    SizedBox(height: 8),
                    _sms(),
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
                  ],
                ),
              ),
              _continue(context),
            ],
          ),
        ]),
      ),
    );
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

  Widget _header(double width) {
    return Container(
      height: 400,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: ClippingClass(),
            child: Positioned(
              top: -40,
              height: 400,
              width: width,
              child: FadeAnimation(
                  1,
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/black_background.jpg'),
                            fit: BoxFit.fill)),
                  )),
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            height: 300,
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

  Widget _continue(BuildContext context) => FadeAnimation(
      2.0,
      Center(
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          child: InkWell(
            splashColor: gold,
            onTap: () => _onContinueTap(),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 50,
              width: MediaQuery.of(context).size.width * .3,
              margin: EdgeInsets.symmetric(horizontal: 60),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: HebrewText(
                  "המשך",
                  style: titleFont.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ));

  void _onContinueTap() {
    final phone = _phoneController.text;
    if (phone.length > 9) {
      setState(() {
        opacity = 1.0;
      });
    }
  }

  Widget _phone() {
    return FadeAnimation(
        1.8,
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(196, 135, 198, .3),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )
              ]),
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(196, 135, 198, .3),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  )
                ]),
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
        SizedBox(height: 20),
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

class ClippingClass extends CustomClipper<Path> {
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
